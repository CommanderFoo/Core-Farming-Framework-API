--[[
Copyright 2021 Manticore Games, Inc. 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]

--[[
    This script handles crafting recipes at specific Crafting Stations or globally without a station.
--]]

---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APIInventory
local INVENTORY = require(script:GetCustomProperty("APIInventory"))
---@type APICurrency
local CURRENCY = require(script:GetCustomProperty("APICurrency"))
---@type APIPlayerUpgrades
local UPGRADES = require(script:GetCustomProperty("APIPlayerUpgrades"))
---@type APIDrops
local DROPS = require(script:GetCustomProperty("APIDrops"))
---@type APIItemPickups
local ITEM_PICKUPS = require(script:GetCustomProperty("APIItemPickups"))
---@type APIRealTime
local REALTIME = require(script:GetCustomProperty("APIRealTime"))
---@type APIReplicator
local REPLICATOR = require(script:GetCustomProperty("APIReplicator"))
---@type APIPlayerLots
local PLAYER_LOTS = require(script:GetCustomProperty("APIPlayerLots"))
---@type APITags
local TAGS = require(script:GetCustomProperty("APITags"))

-- Constants
local CRAFTING_TAG = "CFT_"

-- Private Variables
---@type table<string, table>
local craftingStations = {}
local settings = {}
local validRecipeLookup = {}
local craftingState = {}
local floatingCraftingState = {}
local lastGlobalCraftingState = {}
local uuidNum = 0
local cacheValidRecipesTask = nil

---@class APICrafting
local API = {}

API.GLOBAL_KEY = CRAFTING_TAG .. "global"

API.Events = {
    -- Internal Events
    LoadCraftingStations = CRAFTING_TAG .. "LoadCraftingStations",
    StartCrafting = CRAFTING_TAG .. "StartCrafting",
    CollectCrafting = CRAFTING_TAG .. "CollectCrafting",
    ResetCrafting = CRAFTING_TAG .. "ResetCrafting",
    -- Public Events
    StartedCrafting = CRAFTING_TAG .. "StartedCrafting",
    CraftingReadyForCollect = CRAFTING_TAG .. "ReadyForCollect",
    CraftingCollected = CRAFTING_TAG .. "CraftingCollected",
    CraftingReset = CRAFTING_TAG .. "CraftingReset"
}

API.Setting = {
    AllowGlobalCrafting = 1,
    StorageKey = 2,
    ClearAbandonedStationTimeout = 3,
    GlobalAllowAllRecipes = 4,
    GlobalRecipes = 5
}

local DEFAULT_SETTINGS = {
    [API.Setting.AllowGlobalCrafting] = true,
    [API.Setting.StorageKey] = nil,
    [API.Setting.ClearAbandonedStationTimeout] = 60,
    [API.Setting.GlobalAllowAllRecipes] = true,
    [API.Setting.GlobalRecipes] = ""
}

---Registers a Crafting Station to the system
---@param craftingStationId string
---@param functionTable table
function API.RegisterCraftingStation(craftingStationId, functionTable)
    craftingStations[craftingStationId] = functionTable

    if Environment.IsServer() then
        for _, player in ipairs(Game.GetPlayers()) do
            LoadCraftingStationState(player, craftingStationId)
        end
    end
end

---When destroying a Crafting Station it is important to unregister it
---@param craftingStationId string
function API.UnregisterCraftingStation(craftingStationId)
    craftingStations[craftingStationId] = nil

    if Environment.IsServer() then
        for _, player in ipairs(Game.GetPlayers()) do
            UnloadCraftingStationState(player, craftingStationId)
        end
    end
end

---Returns true if the Crafting Station has been registered.
---@param craftingStationId string
---@return boolean
function API.IsCraftingStationRegistered(craftingStationId)
    return craftingStations[craftingStationId] ~= nil
end

---Sets crafting settings.
---@param newSettings table
function API.SetSettings(newSettings)
    settings = newSettings
end

---Gets a crafting setting.
---@param setting integer
function API.GetSetting(setting)
    if settings[setting] ~= nil then
        return settings[setting]
    end
    return DEFAULT_SETTINGS[setting]
end

---Returns an id formatted as a Crafting Station id for a target object if possible.
---@param target CoreObject
---@param instance table|nil
---@return string|nil
function API.GetCraftingStationId(target, instance)
    instance = instance or REPLICATOR.GetInstance(target)
    if instance then
        return instance.replicatorId .. tostring(instance.id)
    end
    return nil
end

---Returns a Crafting Station id if one exists in the targets ancestors.
---@param target CoreObject
---@return string|nil
function API.FindCraftingStationIdByAncestors(target)
    while Object.IsValid(target) do
        local craftingStationId = API.GetCraftingStationId(target)
        if craftingStationId and API.IsCraftingStationRegistered(craftingStationId) then
            return craftingStationId
        end
        target = target.parent
    end
    return nil
end

---Returns true if the crafting station is currently crafting a recipe. If craftingStationId is nil then the global
---crafting state will be checked.
---@param player Player
---@param craftingStationId string|nil
function API.IsCrafting(player, craftingStationId)
    if craftingStationId then
        return API.GetCraftingStationState(craftingStationId).hasStartedCrafting
    else
        if API.GetSetting(API.Setting.AllowGlobalCrafting) then
            return API.GetCraftingState(player.id).recipeId ~= nil
        else
            return false
        end
    end
end

---Returns true if the Player can craft a Recipe at the Crafting Station if one is provided, otherwise checks against
---global crafting status if that is allowed.
---@param player Player
---@param craftingStationId string|nil
---@param recipeId string
---@param amountToCraft integer
---@return boolean
function API.CanCraft(player, craftingStationId, recipeId, amountToCraft)
    if craftingStationId and not API.IsCraftingStationRegistered(craftingStationId) then
        warn(string.format("Crafting Station id: %s has not been registered.", craftingStationId))
        return false
    end

    -- Check global Crafting
    if not craftingStationId and not API.GetSetting(API.Setting.AllowGlobalCrafting) then
        return false
    end

    -- Is station already crafting?
    if API.IsCrafting(player, craftingStationId) then
        return false
    end

    -- Is this a valid Recipe?
    local recipeData = API.GetRecipeData(recipeId)
    if not recipeData then
        return false
    end

    -- Check allowed Recipe ids and tags
    local allowedRecipes = {}
    if craftingStationId then
        local craftingStationState = API.GetCraftingStationState(craftingStationId)
        allowedRecipes = validRecipeLookup[craftingStationState.craftingStationDataId]
    else
        allowedRecipes = validRecipeLookup[API.GLOBAL_KEY]
    end

    local isAllowed = false
    for _, allowedRecipeId in pairs(allowedRecipes) do
        if allowedRecipeId == recipeId then
            isAllowed = true
            break
        end
    end

    if not isAllowed then
        return false
    end

    -- Validate amount
    if not amountToCraft or amountToCraft < 1 then
        amountToCraft = 1
    end

    -- Does the Player have the ingredients?
    local items = {}
    local currencies = {}
    if recipeData.Inputs then
        for _, inputData in pairs(recipeData.Inputs) do
            if inputData.ItemId and inputData.ItemId ~= "" then
                if not items[inputData.ItemId] then
                    items[inputData.ItemId] = 0
                end
                items[inputData.ItemId] = items[inputData.ItemId] + (inputData.Amount * amountToCraft)
            elseif inputData.CurrencyId and inputData.CurrencyId ~= "" then
                if not currencies[inputData.CurrencyId] then
                    currencies[inputData.CurrencyId] = 0
                end
                currencies[inputData.CurrencyId] = currencies[inputData.CurrencyId] + (inputData.Amount * amountToCraft)
            end
        end
    end

    if not INVENTORY.CanRemoveItemsFromInventory(player, nil, items, false) then
        return false
    end

    for currencyId, amount in pairs(currencies) do
        if CURRENCY.GetCurrencyAmount(player, currencyId) < amount then
            return false
        end
    end

    return true
end

---Starts crafting a recipe. If craftingStationId is nil then the global crafting state will be used.
---@param player Player
---@param craftingStationId string|nil
---@param recipeId string
---@param amountToCraft integer
function API.StartCrafting(player, craftingStationId, recipeId, amountToCraft)
    if not amountToCraft or amountToCraft < 1 then
        amountToCraft = 1
    end

    if not API.CanCraft(player, craftingStationId, recipeId, amountToCraft) then
        return
    end

    -- Remove ingredients on both server and client for immediate feedback, but do not update the other context to avoid
    -- doing it multiple times
    local recipeData = API.GetRecipeData(recipeId)
    if recipeData.Inputs then
        for _, inputData in pairs(recipeData.Inputs) do
            if inputData.ItemId and inputData.ItemId ~= "" then
                local itemType = INVENTORY.GetItemType(inputData.ItemId)
                INVENTORY.RemoveFromInventory(player, nil, itemType, inputData.ItemId, inputData.Amount * amountToCraft, nil, false, false)
            elseif inputData.CurrencyId and inputData.CurrencyId ~= "" then
                CURRENCY.RemoveCurrencyAmount(player, inputData.CurrencyId, inputData.Amount * amountToCraft, false)
            end
        end
    end

    if Environment.IsServer() then
        -- Start crafting
        if craftingStationId then
            local key = GetCraftingStationKey(craftingStationId)
            local uniqueId = GenerateUUID(player)

            craftingStations[craftingStationId].StartCrafting(uniqueId, recipeId, amountToCraft)
            craftingState[player.id][key] = {
                uniqueId = uniqueId,
                recipeId = recipeId,
                amountToCraft = amountToCraft,
                startTime = REALTIME.CompactTime(REALTIME.GetRealTime())
            }

            -- Save
            if not SaveCraftingStationState(player, key, false) then
                warn(string.format("Could not save Crafting Station state for Crafting Station: %s", craftingStationId))
                return
            end

            -- Sync with Client
            SendCraftingStateToClient(player, key)
        else
            if API.GetSetting(API.Setting.AllowGlobalCrafting) then
                craftingState[player.id][API.GLOBAL_KEY] = {
                    uniqueId = nil,
                    recipeId = recipeId,
                    amountToCraft = amountToCraft,
                    startTime = REALTIME.CompactTime(REALTIME.GetRealTime())
                }

                -- Save
                if not SaveCraftingStationState(player, API.GLOBAL_KEY, false) then
                    warn(string.format("Could not save Crafting state"))
                    return
                end

                -- Sync with Client
                SendCraftingStateToClient(player, API.GLOBAL_KEY)

                Events.Broadcast(API.Events.StartedCrafting, nil, recipeId, amountToCraft)
            else
                return
            end
        end
    else
        -- Forward to Server
        Events.BroadcastToServer(API.Events.StartCrafting, craftingStationId, recipeId, amountToCraft)
    end
end

---Returns true if the Player can collect from the Crafting Station or global crafting. Returns false and an error
---message if they cannot.
---@param player Player
---@param craftingStationId string
---@return boolean
---@return string
function API.CanCollect(player, craftingStationId)
    local state
    if craftingStationId then
        state = API.GetCraftingStationState(craftingStationId)
    else
        if API.GetSetting(API.Setting.AllowGlobalCrafting) then
            state = API.GetCraftingState(player.id)
        else
            return false, "Crafting must be done at a Crafting Station"
        end
    end

    if not state.isReadyForCollect then
        return false, "Crafting is not finished"
    end

    if craftingStationId and not API.IsPlayerUsing(player, craftingStationId) then
        return false, "Someone else is using this"
    end

    local recipeData = API.GetRecipeData(state.recipeId)
    local potentialDrops = DROPS.CalculateDrops(recipeData.Drops, state.amountToCraft, nil, true)
    if not INVENTORY.CanAddToInventoryFromDrops(player, nil, potentialDrops, false) then
        return false, "Not enough room in Inventory"
    end

    return true
end

---Collect a finished Recipe.
---@param player Player
---@param craftingStationId string
function API.Collect(player, craftingStationId)
    if not API.CanCollect(player, craftingStationId) then
        return
    end

    -- Drops must be calculated on the server
    if Environment.IsServer() then
        local state
        if craftingStationId then
            state = API.GetCraftingStationState(craftingStationId)
        else
            if API.GetSetting(API.Setting.AllowGlobalCrafting) then
                state = API.GetCraftingState(player.id)
            else
                return
            end
        end

        local recipeData = API.GetRecipeData(state.recipeId)
        if recipeData.Drops then
            local calculatedDrops = DROPS.CalculateDrops(recipeData.Drops, state.amountToCraft, nil, false)

            -- Only Crafting Stations can drop into the world
            local craftingStationData = DATABASE.CraftingStations[state.craftingStationDataId]
            if craftingStationId and craftingStationData.DropInWorld then
                ITEM_PICKUPS.CreateItemPickupsForDrops(
                    player,
                    calculatedDrops,
                    craftingStationData.DropItemPickupTemplate,
                    state.dropPosition,
                    craftingStationData.DropMinDistance,
                    craftingStationData.DropMaxDistance,
                    craftingStationData.DropForAllPlayers,
                    craftingStationData.SinglePlayerDrops,
                    craftingStationData.DropTimeoutSeconds,
                    craftingStationData.MaxPickupsPerDrop
                )
            else
                for itemId, dropAmount in pairs(calculatedDrops.Items) do
                    INVENTORY.AddToInventory(player, nil, INVENTORY.ItemType.Item, itemId, dropAmount, 0, false, true)
                end

                for currencyId, dropAmount in pairs(calculatedDrops.Currencies) do
                    CURRENCY.AddCurrencyAmount(player, currencyId, dropAmount, true)
                end
            end

            for upgradeId, _ in pairs(calculatedDrops.Upgrades) do
                UPGRADES.AddUpgrade(player, upgradeId)
            end
        end

        if craftingStationId then
            local key = GetCraftingStationKey(craftingStationId)

            craftingStations[craftingStationId].CollectCrafting()
            craftingState[player.id][key] = nil

            -- Save
            if not SaveCraftingStationState(player, key, false) then
                warn(string.format("Could not save Crafting Station state for Crafting Station: %s", craftingStationId))
                return
            end

            -- Sync with Client
            SendCraftingStateToClient(player, key)
        else
            local recipeId = craftingState[player.id][API.GLOBAL_KEY].recipeId
            local amountToCraft = craftingState[player.id][API.GLOBAL_KEY].amountToCraft

            craftingState[player.id][API.GLOBAL_KEY] = nil

            -- Save
            if not SaveCraftingStationState(player, API.GLOBAL_KEY, false) then
                warn(string.format("Could not save Crafting state"))
                return
            end

            -- Sync with Client
            SendCraftingStateToClient(player, API.GLOBAL_KEY)

            Events.Broadcast(API.Events.CraftingCollected, nil, recipeId, amountToCraft)
        end
    else
        -- Handle collection on the server
        Events.BroadcastToServer(API.Events.CollectCrafting, craftingStationId)
    end
end

---Resets Crafting state for a Player.
---@param player Player
function API.ResetCrafting(player)
    if Environment.IsServer() then
        for key, _ in pairs(craftingState[player.id]) do
            -- Reset
            craftingState[player.id][key] = nil

            if key ~= API.GLOBAL_KEY then
                local craftingStationId = GetCraftingStationIdFromKey(key)
                if craftingStationId and API.IsCraftingStationRegistered(craftingStationId) then
                    craftingStations[craftingStationId].ResetCrafting()
                end
            end

            -- Save
            if not SaveCraftingStationState(player, key, false) then
                warn(string.format("Could not save Crafting state"))
                return
            end

            -- Sync with Client
            SendCraftingStateToClient(player, key)
        end
    else
        Events.BroadcastToServer(API.Events.ResetCrafting)
    end
end

---Returns true if the Player is currently using the Crafting Station.
---@param player Player
---@param craftingStationId string
---@return boolean
function API.IsPlayerUsing(player, craftingStationId)
    local key = GetCraftingStationKey(craftingStationId)
    local craftingStationState = API.GetCraftingStationState(craftingStationId)
    if craftingStationState and craftingState[player.id] and craftingState[player.id][key] then
        return craftingStationState.uniqueId == craftingState[player.id][key].uniqueId
    end
    return false
end

---Returns the global crafting state
---@param playerId string
function API.GetCraftingState(playerId)
    local globalState = craftingState[playerId][API.GLOBAL_KEY]
    local recipeData, isReadyForCollect, craftAmount, craftTimeRemaining = nil, false, 0, 0

    if globalState then
        if globalState.recipeId then
            recipeData = API.GetRecipeData(globalState.recipeId)

            local currentTime = REALTIME.GetRealTime()
            local startTime = REALTIME.ExpandTime(globalState.startTime)
            local craftTime = recipeData.CraftSeconds * globalState.amountToCraft

            craftAmount = math.min((currentTime - startTime) / craftTime, 1)
            craftTimeRemaining = craftTime * (1 - craftAmount)
            isReadyForCollect = craftAmount == 1
        end

        return {
            hasStartedCrafting = globalState.recipeId ~= nil,
            isReadyForCollect = isReadyForCollect,
            uniqueId = nil,
            craftAmount = craftAmount,
            craftRate = 1,
            craftTimeRemaining = craftTimeRemaining,
            recipeId = globalState.recipeId,
            amountToCraft = globalState.amountToCraft
        }
    else
        return {
            hasStartedCrafting = false,
            isReadyForCollect = false,
            uniqueId = nil,
            craftAmount = 0,
            craftRate = 0,
            craftTimeRemaining = 0,
            recipeId = nil,
            amountToCraft = 0
        }
    end
end

---Returns the state of a Crafting Station
---@param craftingStationId string
---@return CraftingStationState
function API.GetCraftingStationState(craftingStationId)
    if craftingStations[craftingStationId] then
        return craftingStations[craftingStationId].GetState()
    end
    return nil
end

---Returns the craft rate for a Recipe on a Crafting Station
---@param craftingStationId string
---@return number
function API.GetCraftRate(craftingStationId)
    if craftingStationId then
        return craftingStations[craftingStationId].GetCraftRate()
    else
        return 1
    end
end

---Returns a table of recipe ids that can be crafted on the crafting station.
---@param craftingStationDataId string
function API.GetValidRecipeIds(craftingStationDataId)
    if craftingStationDataId then
        if validRecipeLookup[craftingStationDataId] then
            return validRecipeLookup[craftingStationDataId]
        end
    else
        return validRecipeLookup[API.GLOBAL_KEY]
    end
end

function API.GetRecipeIdByStorageId(uniqueStorageId)
    local recipeDatas = DATABASE.Recipes:Find(function(key, value)
        if type(value) == "table" and value.UniqueStorageId == uniqueStorageId then
            return true
        end
        return false
    end)

    for id, _ in pairs(recipeDatas) do
        return id
    end
    return nil
end

function API.GetRecipeStorageIdByRecipeId(recipeId)
    local recipeData = DATABASE.Recipes[recipeId]
    if recipeData then
        return recipeData.UniqueStorageId
    end
    return nil
end

function API.GetRecipeData(recipeId)
    return DATABASE.Recipes[recipeId]
end

function API.GetCraftingStationData(craftingStationDataId)
    return DATABASE.CraftingStations[craftingStationDataId]
end

function API.GetOutputText(recipeId, amount)
    local recipeData = DATABASE.Recipes[recipeId]
    if recipeData.OutputText and recipeData.OutputText ~= "" then
        return recipeData.OutputText
    else
        -- Format the amount for the main output
        local outputText = ""
        local maxOutputs = 3
        local index = 1
        for _, dropData in pairs(recipeData.Drops) do
            local outputData
            if dropData.ItemId and dropData.ItemId ~= "" then
                outputData = DATABASE.Items[dropData.ItemId]
            elseif dropData.CurrencyId and dropData.CurrencyId ~= "" then
                outputData = DATABASE.Currencies[dropData.CurrencyId]
            elseif dropData.UpgradeId and dropData.UpgradeId ~= "" then
                outputData = DATABASE.Upgrades[outputData.UpgradeId]
            end

            if outputData then
                if index == maxOutputs then
                    outputText = outputText .. "\n..."
                    break
                end

                if index > 1 then
                    outputText = outputText .. "\n"
                end

                local minOutputAmount = dropData.MinAmount * amount
                local maxOutputAmount = dropData.MaxAmount * amount

                if minOutputAmount == maxOutputAmount then
                    outputText = string.format("%s%d x %s", outputText, maxOutputAmount, outputData.Name)
                else
                    outputText = string.format("%s%d - %d %s", outputText, minOutputAmount, maxOutputAmount, outputData.Name)
                end
                index = index + 1
            end
        end
        return outputText
    end
end

---Checks all pending crafting to see if a Player has a complete recipe but no station to claim it at. Also checks for
---and clears stations that no longer have an associated Player.
function CheckDisconnectedCrafting()
    -- Floating state (Handles players entering the game and not having a station associated with a pending recipe)
    for playerId, stateCollection in pairs(floatingCraftingState) do
        local player = Game.FindPlayer(playerId)
        if player then
            for key, savedState in pairs(stateCollection) do
                -- Manually check for completed crafts since there is no associated station
                if savedState.recipeId and DATABASE.Recipes then
                    local recipeData = DATABASE.Recipes[savedState.recipeId]
                    if recipeData then
                        local craftSeconds = recipeData.CraftSeconds * savedState.amountToCraft
                        if REALTIME.GetRealTime() >= REALTIME.ExpandTime(savedState.startTime) + craftSeconds then
                            if recipeData.Drops then
                                local calculatedDrops = DROPS.CalculateDrops(recipeData.Drops, savedState.amountToCraft, nil, false)
                                for itemId, dropAmount in pairs(calculatedDrops.Items) do
                                    INVENTORY.AddToInventory(player, nil, INVENTORY.ItemType.Item, itemId, dropAmount, 0, false, true)
                                end

                                for currencyId, dropAmount in pairs(calculatedDrops.Currencies) do
                                    CURRENCY.AddCurrencyAmount(player, currencyId, dropAmount, true)
                                end

                                for upgradeId, _ in pairs(calculatedDrops.Upgrades) do
                                    UPGRADES.AddUpgrade(player, upgradeId)
                                end
                            end

                            floatingCraftingState[player.id][key] = nil

                            SaveCraftingStationState(player, key, true)
                        end
                    end
                end
            end
        end
    end

    -- Server state (Handles stations being used by players who have logged off, or just left the station for too long
    -- without collecting from it)
    for playerId, stateCollection in pairs(craftingState) do
        for key, savedState in pairs(stateCollection) do
            -- Global state is not relevant
            if key ~= API.GLOBAL_KEY then
                local player = Game.FindPlayer(playerId)
                local craftingStationId = GetCraftingStationIdFromKey(key)
                local craftingStationState = API.GetCraftingStationState(craftingStationId)

                if craftingStationState.isReadyForCollect then
                    -- Player is offline
                    if not player then
                        -- Clear state for missing Player
                        craftingStations[craftingStationId].CollectCrafting()
                    -- Player is online
                    else
                        -- Check to see if this station is on a lot used by a non-owner, or public to use a timeout
                        local lotId = PLAYER_LOTS.FindLotByAncestors(craftingStationState.root)
                        local recipeData = API.GetRecipeData(savedState.recipeId)
                        local timeout = API.GetSetting(API.Setting.ClearAbandonedStationTimeout)

                        if lotId then
                            if playerId ~= PLAYER_LOTS.GetLotState(lotId).ownerId then
                                if REALTIME.ExpandTime(savedState.startTime) + (recipeData.CraftSeconds * savedState.amountToCraft) + timeout <= REALTIME.GetRealTime() then
                                    -- Transfer state to floating state so it gets rewarded to the user
                                    floatingCraftingState[playerId][key] = savedState
                                    -- Let the station be used by others
                                    craftingStations[craftingStationId].CollectCrafting()
                                end
                            end
                        else
                            if REALTIME.ExpandTime(savedState.startTime) + (recipeData.CraftSeconds * savedState.amountToCraft) + timeout <= REALTIME.GetRealTime() then
                                -- Transfer state to floating state so it gets rewarded to the user
                                floatingCraftingState[playerId][key] = savedState
                                -- Let the station be used by others
                                craftingStations[craftingStationId].CollectCrafting()
                            end
                        end
                    end
                end
            end
        end
    end

    -- Registered Crafting Station state missed in the above  server state
    for craftingStationId, _ in pairs(craftingStations) do
        local craftingStationState = API.GetCraftingStationState(craftingStationId)
        if craftingStationState.isReadyForCollect then
            if not DoesPlayerExistForUniqueId(craftingStationState.uniqueId) then
                craftingStations[craftingStationId].CollectCrafting()
            end
        end
    end
end

---Lets the client know when a global craft is ready for collection.
function CheckGlobalCrafting()
    if Environment.IsServer() then
        for playerId, stateCollection in pairs(craftingState) do
            if stateCollection[API.GLOBAL_KEY] then
                local globalState = API.GetCraftingState(playerId)
                if lastGlobalCraftingState[playerId] and (not lastGlobalCraftingState[playerId].isReadyForCollect) and globalState.isReadyForCollect then
                    local player = Game.FindPlayer(playerId)
                    if Object.IsValid(player) then
                        SaveCraftingStationState(player, API.GLOBAL_KEY, false)
                    end
                end

                lastGlobalCraftingState[playerId] = globalState
            end
        end
    else
        local player = Game.GetLocalPlayer()
        if craftingState[player.id] and craftingState[player.id][API.GLOBAL_KEY] then
            local globalState = API.GetCraftingState(player.id)
            if lastGlobalCraftingState[player.id] and (not lastGlobalCraftingState[player.id].isReadyForCollect) and globalState.isReadyForCollect then
                Events.Broadcast(API.Events.CraftingReadyForCollect, nil, globalState.recipeId, globalState.amountToCraft)
            end

            lastGlobalCraftingState[player.id] = globalState
        end
    end
end

---Generates an id based on a mix of the Player id and the current uuid counter.
---@param player Player
---@return string
function GenerateUUID(player)
    -- Seed random with a mix of the player id, time and increment to avoid getting the same uuid if called multiple
    -- times on the same frame / second
    local idBytes = { "0" }
    if player then
        idBytes = { string.byte(player.id, 1, 6) }
    end

    uuidNum = uuidNum + 1
    math.randomseed(tonumber(table.concat(idBytes)) + uuidNum + REALTIME.GetRealTime())

    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.sub(string.gsub(template, '[xy]', function(c)
        local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
        return string.format('%x', v)
    end), 1, 8)
end

---Server Only. Loads global crafting state and state for all registered stations.
---@param player Player
function LoadCraftingState(player)
    local storageKey = API.GetSetting(API.Setting.StorageKey)
    local playerData
    if storageKey and storageKey.isAssigned then
        playerData = Storage.GetSharedPlayerData(API.Setting.StorageKey, player)
    else
        playerData = Storage.GetPlayerData(player)
    end

    -- Load global state
    if API.GetSetting(API.Setting.AllowGlobalCrafting) then
        if playerData then
            craftingState[player.id][API.GLOBAL_KEY] = playerData[API.GLOBAL_KEY]
            SendCraftingStateToClient(player, API.GLOBAL_KEY)
        end
    end

    -- Load state for registered crafting stations, store state for missing stations
    for key, data in pairs(playerData) do
        if IsCraftingKey(key) and key ~= API.GLOBAL_KEY then
            local craftingStationId = GetCraftingStationIdFromKey(key)
            if API.IsCraftingStationRegistered(craftingStationId) then
                craftingState[player.id][key] = playerData[key]
                SendCraftingStateToClient(player, key)
            else
                -- Find a registered Crafting Station by unique crafting Id
                if data.uniqueId then
                    craftingStationId = GetCraftingStationIdByUniqueId(data.uniqueId)
                    if craftingStationId then
                        local newKey = GetCraftingStationKey(craftingStationId)
                        craftingState[player.id][newKey] = data
                        craftingStations[craftingStationId].UpdateState(data)
                        SaveCraftingStationState(player, key, false)
                        SaveCraftingStationState(player, newKey, false)
                        SendCraftingStateToClient(player, newKey)
                    else
                        floatingCraftingState[player.id][key] = data
                    end
                else
                    floatingCraftingState[player.id][key] = data
                end
            end
        end
    end
end

---Server Only. Loads crafting state for a crafting station.
function LoadCraftingStationState(player, craftingStationId)
    local key = GetCraftingStationKey(craftingStationId)
    if not craftingState[player.id] then
        craftingState[player.id] = {}
        craftingState[player.id][key] = {}
    end

    local storageKey = API.GetSetting(API.Setting.StorageKey)
    local playerData
    if storageKey and storageKey.isAssigned then
        playerData = Storage.GetSharedPlayerData(API.Setting.StorageKey, player)
    else
        playerData = Storage.GetPlayerData(player)
    end

    -- See if player is using this station
    local craftingStationState = API.GetCraftingStationState(craftingStationId)
    local didAdjustState = false
    if craftingStationState then
        for floatingKey, savedState in pairs(floatingCraftingState[player.id]) do
            -- Search for a matching unique id
            if craftingStationState.uniqueId and savedState.uniqueId and savedState.uniqueId == craftingStationState.uniqueId then
                -- Clear floating state
                craftingState[player.id][key] = floatingCraftingState[player.id][floatingKey]
                floatingCraftingState[player.id][floatingKey] = nil
                SaveCraftingStationState(player, floatingKey, true)
                SaveCraftingStationState(player, key, false)
                didAdjustState = true
                break
            end
        end
    end

    if not didAdjustState then
        craftingState[player.id][key] = playerData[key]
    end

    SendCraftingStateToClient(player, key)
end

---Server Only. Saves crafting state for a crafting station.
function SaveCraftingStationState(player, key, floatingState)
    local playerData, result
    local storageKey = API.GetSetting(API.Setting.StorageKey)

    if storageKey and storageKey.isAssigned then
        playerData = Storage.GetSharedPlayerData(API.Setting.StorageKey, player)
    else
        playerData = Storage.GetPlayerData(player)
    end

    if floatingState then
        playerData[key] = floatingCraftingState[player.id][key]
    else
        playerData[key] = craftingState[player.id][key]
    end

    if storageKey and storageKey.isAssigned then
        result = Storage.SetSharedPlayerData(API.Setting.StorageKey, player, playerData)
    else
        result = Storage.SetPlayerData(player, playerData)
    end

    return result == StorageResultCode.SUCCESS
end

---Server Only. Unloads crafting state for a crafting station.
function UnloadCraftingStationState(player, craftingStationId)
    local key = GetCraftingStationKey(craftingStationId)
    if craftingState[player.id] and craftingState[player.id][key] then
        -- Move state to floating until station is loaded again
        floatingCraftingState[player.id][key] = craftingState[player.id][key]
        SaveCraftingStationState(player, key, true)

        craftingState[player.id][key] = nil
        SendCraftingStateToClient(player, key)
    end
end

---Server Only. Sends crafting state down to the client.
---@param key string
function SendCraftingStateToClient(player, key)
    player:SetPrivateNetworkedData(key, craftingState[player.id][key])
end

---Client Only. Handles incoming state changes.
---@param player Player
---@param key string
function HandlePrivateNetworkedDataChanged(player, key)
    if IsCraftingKey(key) then
        -- Send global events
        if key == API.GLOBAL_KEY then
            local state = API.GetCraftingState(player.id)
            local hadStartedCrafting = state.hasStartedCrafting
            local wasReadyForCollect = state.isReadyForCollect
            local recipeId = state.recipeId
            local amountToCraft = state.amountToCraft

            craftingState[player.id][key] = player:GetPrivateNetworkedData(key)
            state = API.GetCraftingState(player.id)

            if not hadStartedCrafting and state.hasStartedCrafting then
                Events.Broadcast(API.Events.StartedCrafting, nil, state.recipeId, state.amountToCraft)
            elseif not wasReadyForCollect and state.isReadyForCollect then
                Events.Broadcast(API.Events.CraftingReadyForCollect, nil, state.recipeId, state.amountToCraft)
            elseif wasReadyForCollect and not state.isReadyForCollect then
                Events.Broadcast(API.Events.CraftingCollected, nil, recipeId, amountToCraft)
            end
        else
            craftingState[player.id][key] = player:GetPrivateNetworkedData(key)
        end
    end
end

---Caches recipes in a lookup for faster access. This also reformats data in related tables into a single data.
function CacheValidRecipes()
    if not DATABASE.Recipes or #DATABASE.Recipes == 0 then return end

    local allRecipeIds = {}
    for recipeId, recipeData in pairs(DATABASE.Recipes) do
        table.insert(allRecipeIds, recipeId)

        -- Format inputs if using Data Tables
        if recipeData.InputItemId1 or recipeData.InputCurrencyId1 then
            local inputs = {}
            local index = 1
            while true do
                local inputItemId = recipeData["InputItemId" .. tostring(index)] or ""
                local inputCurrencyId = recipeData["InputCurrencyId" .. tostring(index)] or ""
                local inputAmount = recipeData["InputAmount" .. tostring(index)] or 0
                if (inputItemId ~= "" or inputCurrencyId ~= "") and inputAmount > 0 then
                    table.insert(inputs, {
                        ItemId = inputItemId,
                        CurrencyId = inputCurrencyId,
                        Amount = inputAmount
                    })
                    index = index + 1
                else
                    break
                end
            end

            recipeData.Inputs = inputs
        end

        -- Format drops if using Data Tables
        if recipeData.DropIds then
            if not DATABASE.Drops then
                warn("Could not find the Drops category in the Database for Recipe: " .. recipeId)
            else
                local drops = {}
                local dropIds = { CoreString.Split(recipeData.DropIds, ",", { removeEmptyResults  = true }) }
                for _, dropId in ipairs(dropIds) do
                    dropId = CoreString.Trim(dropId)
                    local dropData = DATABASE.Drops[dropId]
                    if dropData then
                        table.insert(drops, dropData)
                    end
                end

                recipeData.Drops = drops
            end
        end
    end

    validRecipeLookup = {}

    for craftingStationId, craftingStationData in pairs(DATABASE.CraftingStations) do
        if type(craftingStationData) == "table" then
            if not validRecipeLookup[craftingStationId] then
                validRecipeLookup[craftingStationId] = {}
            end

            if craftingStationData.AllowAllRecipes then
                validRecipeLookup[craftingStationId] = allRecipeIds
            else
                local validRecipeIds = {}
                for recipeId, _ in pairs(TAGS.FindMatchingData("Recipes", craftingStationData.Recipes, false)) do
                    table.insert(validRecipeIds, recipeId)
                end
                validRecipeLookup[craftingStationId] = validRecipeIds
            end

            -- Format Drop Behavior Data if using Data Tables
            if craftingStationData.DropBehaviorId and craftingStationData.DropBehaviorId ~= "" then
                if DATABASE.DropBehaviors then
                    local dropBehaviorData = DATABASE.DropBehaviors[craftingStationData.DropBehaviorId]
                    if dropBehaviorData then
                        craftingStationData.DropForAllPlayers = dropBehaviorData.DropForAllPlayers
                        craftingStationData.SinglePlayerDrops = dropBehaviorData.SinglePlayerDrops
                        craftingStationData.MaxPickupsPerDrop = dropBehaviorData.MaxPickupsPerDrop
                        craftingStationData.DropMinDistance = dropBehaviorData.DropMinDistance
                        craftingStationData.DropMaxDistance = dropBehaviorData.DropMaxDistance
                        craftingStationData.DropTimeoutSeconds = dropBehaviorData.DropTimeoutSeconds
                        craftingStationData.DropItemPickupTemplate = dropBehaviorData.DropItemPickupTemplate
                    else
                        warn("Could not find DropBehaviors data in Database for Crafting Station: " .. craftingStationId)
                    end
                else
                    warn("Could not find DropBehaviors category in Database")
                end
            end
        end
    end

    if API.GetSetting(API.Setting.GlobalAllowAllRecipes) then
        validRecipeLookup[API.GLOBAL_KEY] = allRecipeIds
    else
        local validRecipeIds = {}
        for recipeId, _ in pairs(TAGS.FindMatchingData("Recipes", API.GetSetting(API.Setting.GlobalRecipes), false)) do
            table.insert(validRecipeIds, recipeId)
        end
        validRecipeLookup[API.GLOBAL_KEY] = validRecipeIds
    end
end

function IsCraftingKey(key)
    return string.find(key, "^" .. CRAFTING_TAG) ~= nil
end

function GetCraftingStationKey(craftingStationId)
    return CRAFTING_TAG .. craftingStationId
end

function GetCraftingStationIdFromKey(key)
    return string.sub(key, #CRAFTING_TAG + 1)
end

function GetCraftingStationIdByUniqueId(uniqueId)
    for craftingStationId, _ in pairs(craftingStations) do
        local craftingStationState = API.GetCraftingStationState(craftingStationId)
        if craftingStationState.uniqueId and craftingStationState.uniqueId == uniqueId then
            return craftingStationId
        end
    end
    return nil
end

function DoesPlayerExistForUniqueId(uniqueId)
    for playerId, stateCollection in pairs(craftingState) do
        for _, state in pairs(stateCollection) do
            if state.uniqueId == uniqueId and Game.FindPlayer(playerId) ~= nil then
                return true
            end
        end
    end
    return false
end

-- Server Only. Handles client request.
function OnLoadCraftingStations(player)
    LoadCraftingState(player)
end

-- Server Only. Handles client request.
function OnStartCrafting(player, craftingStationId, recipeId, amountToCraft)
    API.StartCrafting(player, craftingStationId, recipeId, amountToCraft)
end

-- Server Only. Handles client request.
function OnCollectCrafting(player, craftingStationId)
    API.Collect(player, craftingStationId)
end

-- Server Only. Handles client request.
function OnResetCrafting(player)
    API.ResetCrafting(player)
end

function OnPlayerJoined(player)
    if not craftingState[player.id] then
        craftingState[player.id] = {}
        craftingState[player.id][API.GLOBAL_KEY] = {}
    end

    if not floatingCraftingState[player.id] then
        floatingCraftingState[player.id] = {}
    end

    if Environment.IsClient() then
        if player == Game.GetLocalPlayer() then
            player.privateNetworkedDataChangedEvent:Connect(HandlePrivateNetworkedDataChanged)

            Events.BroadcastToServer(API.Events.LoadCraftingStations)
        end
    end
end

function OnPlayerLeft(player)
    -- Do not clear state for the Player to keep Crafting Stations active.
    -- State will be handled by CheckDisconnectedCrafting()

    lastGlobalCraftingState[player.id] = nil
end

---Refreshes the cached lookup if any new data is added.
function OnDataChanged()
    if not cacheValidRecipesTask then
        cacheValidRecipesTask = Task.Spawn(CacheValidRecipesTask)
    end
end

function CacheValidRecipesTask()
    while not DATABASE.Recipes or not DATABASE.CraftingStations or not DATABASE.Drops or not DATABASE.DropBehaviors do
        Task.Wait()
    end

    CacheValidRecipes()
    cacheValidRecipesTask = nil
end

if Environment.IsServer() then
    Events.ConnectForPlayer(API.Events.LoadCraftingStations, OnLoadCraftingStations)
    Events.ConnectForPlayer(API.Events.StartCrafting, OnStartCrafting)
    Events.ConnectForPlayer(API.Events.CollectCrafting, OnCollectCrafting)
    Events.ConnectForPlayer(API.Events.ResetCrafting, OnResetCrafting)

    Task.Spawn(function()
        -- Initial wait
        Task.Wait(1)

        -- Wait for replicators
        while true do
            local pendingInstances = 0
            for _, replicatorId in ipairs(REPLICATOR.GetReplicators()) do
                pendingInstances = pendingInstances + REPLICATOR.CountPendingServerInstancesToSpawn(replicatorId)
            end

            if pendingInstances > 0 then
                Task.Wait()
            else
                break
            end
        end

        while true do
            CheckDisconnectedCrafting()
            Task.Wait(1)
        end
    end)
end

Task.Spawn(function()
    while true do
        CheckGlobalCrafting()
        Task.Wait()
    end
end)

Game.playerJoinedEvent:Connect(OnPlayerJoined)
Game.playerLeftEvent:Connect(OnPlayerLeft)

OnDataChanged()

DATABASE.RegisterDataChangeHandler(OnDataChanged, "Recipes")
DATABASE.RegisterDataChangeHandler(OnDataChanged, "CraftingStations")

return API