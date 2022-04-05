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

---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APIDataMigration
local DATA_MIGRATION = require(script:GetCustomProperty("APIDataMigration"))

-- Constants
local UPGRADES_TAG = "UPG_"
local UPGRADES_TAG_CURRENT = "UPGC_"

-- List of all registered upgrades. On client the upgrades will only appear after syncing with the server
local upgrades = {}

-- List of all the upgrade collections
local upgradeCollections = {}

-- A table that finds the upgrade collection id for an upgradeId
local upgradeIdToUpgradeCollectionId = {}

local ADDED_UPGRADES_STORAGE_KEY = UPGRADES_TAG .. "AddedUpgrades"

---@class APIPlayerUpgrades
local API = {}

API.Events = {
    AddUpgrade = UPGRADES_TAG .. "Add",
    RemoveUpgrade = UPGRADES_TAG .. "Remove",
    LoadUpgrades = UPGRADES_TAG .. "Load",
    UpgradeAdded = UPGRADES_TAG .. "Added",
    UpgradeRemoved = UPGRADES_TAG .. "Removed",
    UpgradeLoaded = UPGRADES_TAG .. "Loaded",
    UpgradeSaved = UPGRADES_TAG .. "Saved"
}

function API.RegisterUpgradeCollection(upgradeCollectionId)
    if upgradeCollections[upgradeCollectionId] then return end

    local upgradeCollectionData = DATABASE.UpgradeCollections[upgradeCollectionId]

    ---@class UpgradeCollection
    local upgradeCollection  = {
        isLinear = upgradeCollectionData.IsLinear,
        upgradeCollectionId = upgradeCollectionId,
        storageKey = upgradeCollectionData.StorageKey,
        upgrades = {},
        upgradeIds = {},
    }

    -- Support Data Tables and older approach
    if upgradeCollectionData.UpgradeIds then
        if DATABASE.Upgrades then
            local upgradeIds = { CoreString.Split(upgradeCollectionData.UpgradeIds, ",", { removeEmptyResults  = true }) }
            for _, upgradeId in ipairs(upgradeIds) do
                upgradeId = CoreString.Trim(upgradeId)
                local upgradeData = DATABASE.Upgrades[upgradeId]
                if upgradeData then
                    local templateSets = {}
                    if DATABASE.UpgradeTemplateSets then
                        local upgradeTemplateSetIds = { CoreString.Split(upgradeData.UpgradeTemplateSetIds, ",", { removeEmptyResults  = true }) }
                        for _, upgradeTemplateSetId in ipairs(upgradeTemplateSetIds) do
                            upgradeTemplateSetId = CoreString.Trim(upgradeTemplateSetId)
                            local upgradeTemplateSetData = DATABASE.UpgradeTemplateSets[upgradeTemplateSetId]
                            if upgradeTemplateSetData then
                                templateSets[upgradeTemplateSetData.Group] = {
                                    serverAsset = upgradeTemplateSetData.ServerAsset,
                                    clientAsset = upgradeTemplateSetData.ClientAsset,
                                    staticAsset = upgradeTemplateSetData.StaticAsset
                                }
                            end
                        end
                    end

                    table.insert(upgradeCollection.upgrades, {
                        upgradeId = upgradeId,
                        name = upgradeData.Name,
                        playerStartsWith = upgradeData.PlayerStartsWith,
                        templateSets = templateSets
                    })

                    upgradeCollection.upgradeIds[upgradeId] = true

                    upgradeIdToUpgradeCollectionId[upgradeId] = upgradeCollectionId
                    upgrades[upgradeId] = {}
                end
            end
        else
            warn("Could not find Upgrades category in Database")
        end
    else
        for upgradeId, upgradeData in pairs(upgradeCollectionData) do
            upgradeCollection.upgrades[upgradeData.__Index] = {
                upgradeId = upgradeId,
                name = upgradeData.Name,
                playerStartsWith = upgradeData.PlayerStartsWith,
                templateSets = {}
            }

            for templateSetId, templateSetData in pairs(upgradeData) do
                if type(templateSetData) == "table" then
                    upgradeCollection.upgrades[upgradeData.__Index].templateSets[templateSetId] = {
                        serverAsset = templateSetData.ServerAsset,
                        clientAsset = templateSetData.ClientAsset,
                        staticAsset = templateSetData.StaticAsset
                    }
                end
            end

            upgradeCollection.upgradeIds[upgradeId] = true

            upgradeIdToUpgradeCollectionId[upgradeId] = upgradeCollectionId
            upgrades[upgradeId] = {}
        end
    end

    -- Add table to store player current upgrade ids
    upgradeCollection.currentUpgradeIds = {}

    -- Add this collection to our table
    upgradeCollections[upgradeCollectionId] = upgradeCollection
end

function API.UnregisterUpgradeCollection(upgradeCollectionId)
    upgradeCollections[upgradeCollectionId] = nil
end

function API.GetUpgradeCollectionId(upgradeId)
    return upgradeIdToUpgradeCollectionId[upgradeId]
end

function API.GetUpgradeCollection(upgradeCollectionId)
    return upgradeCollections[upgradeCollectionId]
end

function API.GetUpgradeData(upgradeId)
    local upgradeCollectionId = API.GetUpgradeCollectionId(upgradeId)
    if upgradeCollectionId then
        for _, upgradeData in ipairs(API.GetUpgradeCollection(upgradeCollectionId).upgrades) do
            if upgradeData.upgradeId == upgradeId then
                return upgradeData
            end
        end
    end
    return nil
end

function API.GetPlayerUpgradeData(playerId, upgradeCollectionId)
    local upgradeCollection = API.GetUpgradeCollection(upgradeCollectionId)
    if upgradeCollection then
        local upgradeData
        if upgradeCollection.isLinear then
            for _, data in ipairs(upgradeCollection.upgrades) do
                if API.HasUpgrade(playerId, data.upgradeId) then
                    upgradeData = data
                else
                    break
                end
            end
        else
            local currentUpgradeId = upgradeCollection.currentUpgradeIds[playerId]
            for _, data in pairs(upgradeCollection.upgrades) do
                if API.HasUpgrade(playerId, data.upgradeId) and (currentUpgradeId == nil or currentUpgradeId == data.upgradeId) then
                    upgradeData = data
                    break
                end
            end
        end
        return upgradeData
    end
    return nil
end

function API.IsPrerequisitesMet(player, upgradeId)
    local upgradeCollectionId = API.GetUpgradeCollectionId(upgradeId)
    local upgradeCollection = upgradeCollections[upgradeCollectionId]

    -- We already have this upgrade, so we must have the prereqs
    if upgrades[upgradeId][player.id] == true then
        return true
    end

    -- Non-linear collection upgrades don't have prerequisites
    if not upgradeCollection.isLinear then
        return true
    end

    -- Check all previous upgrades to detect any missing ones
    for _, upgradeData in ipairs(upgradeCollection.upgrades) do
        local id = upgradeData.upgradeId
        if id == upgradeId then
            return true
        end

        if upgrades[id][player.id] ~= true then
            return false
        end
    end
end

function API.AddUpgrade(player, upgradeId)
    if not API.IsUpgradeRegistered(upgradeId) then
        warn (upgradeId .. " is not a registered upgrade.")
        return false
    end

    local upgradeCollectionId = API.GetUpgradeCollectionId(upgradeId)
    local upgradeCollection = upgradeCollections[upgradeCollectionId]
    assert(upgradeCollection)

    -- We already have this upgrade, set it to current
    if upgrades[upgradeId][player.id] == true then
        upgradeCollection.currentUpgradeIds[player.id] = upgradeId
        if Environment.IsServer() then
            SaveCurrentUpgrade(player, upgradeCollectionId)
        end
        return
    end

    if upgradeCollection.isLinear then
        for _, upgradeData in ipairs(upgradeCollection.upgrades) do
            local id = upgradeData.upgradeId
            -- Add all previous upgrades
            if upgrades[id][player.id] ~= true then
                upgrades[id][player.id] = true

                Events.Broadcast(API.Events.UpgradeAdded, player, id)

                if Environment.IsServer() then
                    SaveUpgrade(player, id)
                end
            end
            if upgradeId == id then
                upgradeCollection.currentUpgradeIds[player.id] = upgradeId
                if Environment.IsServer() then
                    SaveCurrentUpgrade(player, upgradeCollectionId)
                end
                break
            end
        end
    else
        upgrades[upgradeId][player.id] = true
        upgradeCollection.currentUpgradeIds[player.id] = upgradeId

        Events.Broadcast(API.Events.UpgradeAdded, player, upgradeId)

        if Environment.IsServer() then
            SaveUpgrade(player, upgradeId)
            SaveCurrentUpgrade(player, upgradeCollectionId)
        end
    end

    if Environment.IsServer() then
        SendUpgradeCollectionToClient(player, upgradeCollectionId)
    elseif Environment.IsClient() then
        Events.BroadcastToServer(API.Events.AddUpgrade, upgradeId)
    end
end

function API.RemoveUpgrade(player, upgradeId)
    if not API.IsUpgradeRegistered(upgradeId) then
        warn (upgradeId .. " not registered")
        return false
    end

    local upgradeCollectionId = API.GetUpgradeCollectionId(upgradeId)
    local upgradeCollection = upgradeCollections[upgradeCollectionId]
    assert(upgradeCollection)

    -- This upgrade is already removed
    if upgrades[upgradeId][player.id] == false then
        return
    end

    if upgradeCollection.isLinear then
        local lastUpgradeId = nil
        local removeUpgrades = false
        for _, upgradeData in ipairs(upgradeCollection.upgrades) do
            local id = upgradeData.upgradeId
            if not removeUpgrades then
                if id == upgradeId then
                    -- remove all upgrades from this point onward
                    removeUpgrades = true
                else
                    -- track the last upgrade ID to set as current
                    lastUpgradeId = id
                end
            end

            if removeUpgrades then
                if upgrades[id][player.id] == true then
                    upgrades[id][player.id] = false

                    Events.Broadcast(API.Events.UpgradeRemoved, player, id)

                    if Environment.IsServer() then
                        SaveUpgrade(player, id)
                    end
                end
            end
        end

        upgradeCollection.currentUpgradeIds[player.id] = lastUpgradeId
        if Environment.IsServer() then
            SaveCurrentUpgrade(player, upgradeCollectionId)
        end
    else
        upgrades[upgradeId][player.id] = false
        Events.Broadcast(API.Events.UpgradeRemoved, player, upgradeId)

        -- Set another upgrade in this set as current
        for id, _ in ipairs(upgradeCollection.upgrades) do
            if upgrades[id][player.id] == true then
                upgradeCollection.currentUpgradeIds[player.id] = id
                if Environment.IsServer() then
                    SaveCurrentUpgrade(player, upgradeCollectionId)
                end
                break
            end
        end

        if Environment.IsServer() then
            SaveUpgrade(player, upgradeId)
        end
    end

    if Environment.IsServer() then
        SendUpgradeCollectionToClient(player, upgradeCollection)
    elseif Environment.IsClient() then
        Events.BroadcastToServer(API.Events.RemoveUpgrade, upgradeId)
    end
end

---Upgrade is registered with the system.
---@param upgradeId string
---@return boolean
function API.IsUpgradeRegistered(upgradeId)
    return upgrades[upgradeId] ~= nil
end

---Upgrade is loaded for the player.
---@param playerId string
---@param upgradeId string
---@return boolean
function API.IsUpgradeLoaded(playerId, upgradeId)
    if not API.IsUpgradeRegistered(upgradeId) then return false end
    return upgrades[upgradeId][playerId] ~= nil
end

function API.HasUpgrade(playerId, upgradeId)
    if API.IsUpgradeLoaded(playerId, upgradeId) then
        return upgrades[upgradeId][playerId]
    else
        return false
    end
end

------------------------------------------

function GetUpgradeCollectionResourceKey(upgradeCollectionId)
    return UPGRADES_TAG .. upgradeCollectionId
end

function GetUpgradeCollectionCurrentResourceKey(upgradeCollectionId)
    return UPGRADES_TAG_CURRENT .. upgradeCollectionId
end

function IsUpgradeResourceKey(key)
    return string.find(key, "^" .. UPGRADES_TAG) ~= nil
end

function IsCurrentUpgradeResourceKey(key)
    return string.find(key, "^" .. UPGRADES_TAG_CURRENT) ~= nil
end

---Returns the Currency id associated with a Currency key.
---@param key string
---@return string
function GetUpgradeCollectionIdFromResourceKey(key)
    return string.sub(key, #UPGRADES_TAG + 1)
end

---Returns the Currency id associated with a Currency key.
---@param key string
---@return string
function GetUpgradeCollectionIdFromCurrentResourceKey(key)
    return string.sub(key, #UPGRADES_TAG_CURRENT + 1)
end

---Sends a upgrade collection to a Player.
---@param player Player
---@param upgradeCollectionId string
function SendUpgradeCollectionToClient(player, upgradeCollectionId)
    if not Environment.IsServer() then return end

    local key = GetUpgradeCollectionResourceKey(upgradeCollectionId)
    local value = UpgradeCollectionToResourceValue(upgradeCollectionId, player)
    local currentKey = GetUpgradeCollectionCurrentResourceKey(upgradeCollectionId)
    local currentValue = CurrentUpgradeToResourceValue(upgradeCollectionId, player)

    player:SetResource(key, value)
    player:SetResource(currentKey, currentValue)
end

---Client Only. Recieves the UpgradeCollection value from the server.
---@param player Player
---@param key string
---@param value integer
function HandleResourceChanged(player, key, value)
    if IsUpgradeResourceKey(key) then
        local upgradeCollectionId = GetUpgradeCollectionIdFromResourceKey(key)
        local resourceValue = player:GetResource(key)
        local upgradeCollection = upgradeCollections[upgradeCollectionId]
        local upgradeIds = ResourceValueToUpgradeIds(resourceValue, upgradeCollection)

        for _, upgradeData in ipairs(upgradeCollection.upgrades) do
            local upgradeId = upgradeData.upgradeId
            local hasUpgrade = false
            if upgradeIds[upgradeId] then
                hasUpgrade = true
            end

            if not API.IsUpgradeLoaded(player.id, upgradeId) then
                upgrades[upgradeId] = upgrades[upgradeId] or {}
                upgrades[upgradeId][player.id] = hasUpgrade
                Events.Broadcast(API.Events.UpgradeLoaded, player, upgradeId)
            else
                local hadUpgrade = upgrades[upgradeId][player.id]
                if hasUpgrade ~= hadUpgrade then
                    upgrades[upgradeId][player.id] = hasUpgrade
                    if hasUpgrade then
                        Events.Broadcast(API.Events.UpgradeAdded, player, upgradeId)
                    else
                        Events.Broadcast(API.Events.UpgradeRemoved, player, upgradeId)
                    end
                end
            end
        end
    elseif IsCurrentUpgradeResourceKey(key) then
        local upgradeCollectionId = GetUpgradeCollectionIdFromCurrentResourceKey(key)
        local resourceValue = player:GetResource(key)
        local upgradeCollection = upgradeCollections[upgradeCollectionId]

        upgradeCollection.currentUpgradeIds[player.id] = ResourceValueToCurrentUpgradeId(resourceValue, upgradeCollection)
    end
end

---Given an integer value and an upgrade collection, work out which upgrades we have
---@param value integer
---@param upgradeCollection UpgradeCollection
---@return table<string, boolean>
function ResourceValueToUpgradeIds(value, upgradeCollection)
    local upgradeIds = {}
    if upgradeCollection.isLinear then
        for i = 1, value do
            local upgradeId = upgradeCollection.upgrades[i].upgradeId
            upgradeIds[upgradeId] = true
        end
        return upgradeIds
    else
        for i, upgradeData in ipairs(upgradeCollection.upgrades) do
            local bitValue = (value >> (i-1)) % 2
            if bitValue == 1 then
                upgradeIds[upgradeData.upgradeId] = true
            end
        end
    end
    return upgradeIds
end

---Finds an integer value representing all the upgrades in a collection
---@param upgradeCollectionId string
---@param player Player
---@return number
function UpgradeCollectionToResourceValue(upgradeCollectionId, player)
    local upgradeCollection = upgradeCollections[upgradeCollectionId]
    assert(upgradeCollection)

    local value = 0
    if upgradeCollection.isLinear then
        for i, upgradeData in ipairs(upgradeCollection.upgrades) do
            if upgrades[upgradeData.upgradeId][player.id] then
                value = i
            end
        end
    else
        for i, upgradeData in ipairs(upgradeCollection.upgrades) do
            if upgrades[upgradeData.upgradeId][player.id] then
                value = value + (1 << (i-1))
            end
        end
    end
    return value
end

---Given an integer value and an upgrade collection, work out which upgradeId is current
---@param value integer
---@param upgradeCollection UpgradeCollection
---@return string
function ResourceValueToCurrentUpgradeId(value, upgradeCollection)
    if upgradeCollection.upgrades[value] then
        return upgradeCollection.upgrades[value].upgradeId
    end
    return nil
end

---Finds an integer value representing the current upgrade in a collection
---@param upgradeCollectionId any
---@param player any
function CurrentUpgradeToResourceValue(upgradeCollectionId, player)
    local upgradeCollection = upgradeCollections[upgradeCollectionId]
    assert(upgradeCollection)

    local currentUpgradeId = upgradeCollection.currentUpgradeIds[player.id]
    if currentUpgradeId then
        for i, upgradeData in ipairs(upgradeCollection.upgrades) do
            if upgradeData.upgradeId == currentUpgradeId then
                return i
            end
        end
    end
    return 0
end

function LoadUpgradeCollection(player, upgradeCollectionId)
    if not Environment.IsServer() then return false end

    assert(upgradeCollectionId)
    local upgradeCollection = upgradeCollections[upgradeCollectionId]

    LoadCurrentUpgrade(player, upgradeCollectionId)

    for _, upgradeData in ipairs(upgradeCollection.upgrades) do
        local upgradeId = upgradeData.upgradeId
        upgrades[upgradeId] = upgrades[upgradeId] or {}
        upgrades[upgradeId][player.id] = LoadUpgrade(player, upgradeId)

        -- Check if the upgade is defined in player storage todo
        Events.Broadcast(API.Events.UpgradeLoaded, player, upgradeId)
    end

    SendUpgradeCollectionToClient(player, upgradeCollectionId)
end

function ReadUpgradeFromPlayerData(playerData, upgradeId)
    local upgradesString
    local upgrades

    upgradesString = playerData[ADDED_UPGRADES_STORAGE_KEY] or ""
    upgrades = SplitUpgradesString(upgradesString)
    return ContainsUpgradeId(upgrades, upgradeId)
end

function WriteUpgradeToPlayerData(player, playerData, upgradeId)
    local hasUpgrade = API.HasUpgrade(player.id, upgradeId)
    local upgradesString
    local upgrades

    -- Added upgrades
    upgradesString = playerData[ADDED_UPGRADES_STORAGE_KEY] or ""
    upgrades = SplitUpgradesString(upgradesString)

    if hasUpgrade then
        AddUpgradeId(upgrades, upgradeId)
    else
        RemoveUpgradeId(upgrades, upgradeId)
    end

    upgradesString = PackUpgradesString(upgrades)
    playerData[ADDED_UPGRADES_STORAGE_KEY] = upgradesString
end

function LoadUpgrade(player, upgradeId)
    if not Environment.IsServer() then return false end

    local upgradeCollectionId = API.GetUpgradeCollectionId(upgradeId)
    local storageKey = upgradeCollections[upgradeCollectionId].storageKey
    local hasUpgrade = nil

    if storageKey and storageKey.isAssigned then
        local playerData = Storage.GetSharedPlayerData(storageKey, player)
        if DATA_MIGRATION.MigrateUpgradeData(player, playerData, upgradeId, ADDED_UPGRADES_STORAGE_KEY) then
            Storage.SetSharedPlayerData(storageKey, player, playerData)
        end

        hasUpgrade = ReadUpgradeFromPlayerData(playerData, upgradeId)
    else
        local playerData = Storage.GetPlayerData(player)
        if DATA_MIGRATION.MigrateUpgradeData(player, playerData, upgradeId, ADDED_UPGRADES_STORAGE_KEY) then
            Storage.SetPlayerData(player, playerData)
        end

        hasUpgrade = ReadUpgradeFromPlayerData(playerData, upgradeId)
    end

    if hasUpgrade == nil then
        hasUpgrade = false
    end

    return hasUpgrade
end

function LoadCurrentUpgrade(player, upgradeCollectionId)
    if not Environment.IsServer() then return false end

    local upgradeCollection = upgradeCollections[upgradeCollectionId]
    local storageKey = upgradeCollection.storageKey
    local key = GetUpgradeCollectionCurrentResourceKey(upgradeCollectionId)

    if storageKey and storageKey.isAssigned then
        local playerData = Storage.GetSharedPlayerData(storageKey, player)
        upgradeCollection.currentUpgradeIds[player.id] = playerData[key]
    else
        local playerData = Storage.GetPlayerData(player)
        upgradeCollection.currentUpgradeIds[player.id] = playerData[key]
    end
end

function SaveUpgrade(player, upgradeId)
    if not Environment.IsServer() then return false end

    local upgradeCollectionId = API.GetUpgradeCollectionId(upgradeId)
    local storageKey = upgradeCollections[upgradeCollectionId].storageKey

    if storageKey and storageKey.isAssigned then
        local playerData = Storage.GetSharedPlayerData(storageKey, player)
        WriteUpgradeToPlayerData(player, playerData, upgradeId)
        local result = Storage.SetSharedPlayerData(storageKey, player, playerData)
        if result ~= StorageResultCode.SUCCESS then
            warn(string.format("Could not save Upgrade: %s for Player: %s (%s) - Result: %s", upgradeId, player.name, player.id, result))
            return false
        end
    else
        local playerData = Storage.GetPlayerData(player)
        WriteUpgradeToPlayerData(player, playerData, upgradeId)
        local result = Storage.SetPlayerData(player, playerData)
        if result ~= StorageResultCode.SUCCESS then
            warn(string.format("Could not save Upgrade: %s for Player: %s (%s) - Result: %s", upgradeId, player.name, player.id, result))
            return false
        end
    end

    Events.Broadcast(API.Events.UpgradeSaved, player, upgradeId)

    return true
end

function SaveCurrentUpgrade(player, upgradeCollectionId)
    if not Environment.IsServer() then return false end

    local upgradeCollection = upgradeCollections[upgradeCollectionId]
    local storageKey = upgradeCollection.storageKey
    local key = GetUpgradeCollectionCurrentResourceKey(upgradeCollectionId)

    if storageKey and storageKey.isAssigned then
        local playerData = Storage.GetSharedPlayerData(storageKey, player)
        playerData[key] = upgradeCollection.currentUpgradeIds[player.id]
        local result = Storage.SetSharedPlayerData(storageKey, player, playerData)
        if result ~= StorageResultCode.SUCCESS then
            warn(string.format("Could not save Current Upgrade in: %s for Player: %s (%s) - Result: %s", upgradeCollectionId, player.name, player.id, result))
            return false
        end
    else
        local playerData = Storage.GetPlayerData(player)
        playerData[key] = upgradeCollection.currentUpgradeIds[player.id]
        local result = Storage.SetPlayerData(player, playerData)
        if result ~= StorageResultCode.SUCCESS then
            warn(string.format("Could not save Current Upgrade in: %s for Player: %s (%s) - Result: %s", upgradeCollectionId, player.name, player.id, result))
            return false
        end
    end

    return true
end

function SplitUpgradesString(upgradeString)
    return {CoreString.Split(upgradeString, "%", {removeEmptyResults = true})}
end

function PackUpgradesString(upgradeIds)
    return table.concat(upgradeIds, "%")
end

function ContainsUpgradeId(upgrades, upgradeId)
    for _, upgrade in pairs(upgrades) do
        if upgrade == upgradeId then
            return true
        end
    end
    return false
end

function AddUpgradeId(upgrades, upgradeId)
    if not ContainsUpgradeId(upgrades) then
        table.insert(upgrades, upgradeId)
    end
end

function RemoveUpgradeId(upgrades, upgradeId)
    for i, v in pairs(upgrades) do
        if v == upgradeId then
            table.remove(upgrades, i)
            return
        end
    end
end

function HandleLoadUpgrades(player)
    if not Environment.IsServer() then return end

    for upgradeCollectionId in pairs(upgradeCollections) do
        LoadUpgradeCollection(player, upgradeCollectionId)
    end
end

function API.ResetUpgrades(player)
    if not Environment.IsServer() then return end

    for id, upgradeCollection in pairs(upgradeCollections) do
        upgradeCollection.currentUpgradeIds[player.id] = nil
        SaveCurrentUpgrade(player, id)
        for _, upgradeData in ipairs(upgradeCollection.upgrades) do
            if upgrades[upgradeData.upgradeId][player.id] ~= nil then
                upgrades[upgradeData.upgradeId][player.id] = nil
                SaveUpgrade(player, upgradeData.upgradeId)
            end
        end
    end

    SetInitialUpgrades(player)
end

function SetInitialUpgrades(player)
    if not Environment.IsServer() then return end

    for _, upgradeCollection in pairs(upgradeCollections) do
        for _, upgradeData in ipairs(upgradeCollection.upgrades) do
            if upgradeData.playerStartsWith and not API.HasUpgrade(player.id, upgradeData.upgradeId) then
                API.AddUpgrade(player, upgradeData.upgradeId)
            end
        end
    end
end

---Runs when a Player joins the game and loads all registered Upgrades.
---@param player Player
function OnPlayerJoined(player)
    if Environment.IsClient() then
        -- Listen for data coming from the server
        player.resourceChangedEvent:Connect(HandleResourceChanged)

        local resources = player:GetResources()
        for key, amount in pairs(resources) do
            if IsUpgradeResourceKey(key) then
                HandleResourceChanged(player, key, amount)
            end
        end

        Task.Spawn(function()
            -- Single Player Preview load issue needs this
            Task.Wait()
            Task.Wait()

            if not Object.IsValid(player) then return end

            if player == Game.GetLocalPlayer() then
                Events.BroadcastToServer(API.Events.LoadUpgrades)
            end
        end)
    end
end

---Server Only. Handles relays from the client.
---@param player Player
function HandleLoadUpgradesRequest(player)
    if not Environment.IsServer() then return end

    HandleLoadUpgrades(player)
    SetInitialUpgrades(player)
end

---Server Only. Handles relays from the client.
---@param player Player
---@param upgradeId string
function HandleUpgradeAddRequest(player, upgradeId)
    if not Environment.IsServer() then return end
    API.AddUpgrade(player, upgradeId)
end

---Server Only. Handles relays from the client.
---@param player Player
---@param upgradeId string
function HandleUpgradeRemoveRequest(player, upgradeId)
    if not Environment.IsServer() then return end
    API.RemoveUpgrade(player, upgradeId)
end

-- Handle client requests
if Environment.IsServer() then
    Events.ConnectForPlayer(API.Events.LoadUpgrades, HandleLoadUpgradesRequest)
    Events.ConnectForPlayer(API.Events.AddUpgrade, HandleUpgradeAddRequest)
    Events.ConnectForPlayer(API.Events.RemoveUpgrade, HandleUpgradeRemoveRequest)
end

if Environment.IsClient() then
    Game.playerJoinedEvent:Connect(OnPlayerJoined)
end

return API