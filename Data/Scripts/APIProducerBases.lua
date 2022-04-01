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
    This script handles all client and server Producer interactions. Each Producer should register with this API on the client
    and the server to ensure state and interaction can occur in either context.
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
---@type APIBuffs
local BUFFS = require(script:GetCustomProperty("APIBuffs"))
---@type APIModifyDrops
local MODIFY_DROPS = require(script:GetCustomProperty("APIModifyDrops"))
---@type APIRealTime
local REALTIME = require(script:GetCustomProperty("APIRealTime"))

---@class PlaceableData
---@field InitialProducerId string
---@field ValidToolTypes string
---@field ProducerBaseType string
---@field AllowExpiry boolean
---@field BuildRate number
---@field ReceiveableBuffs string
---@field ResetExpiryBuffs string
---@field ActiveBuffsWhileEmpty string
---@field ActiveBuffsWhilePlaced string
---@field ActiveBuffsWhileBuilding string
---@field ActiveBuffsWhileReady string
---@field ActiveBuffsWhileExpired string

---@class ProducerData
---@field UniqueStorageId integer
---@field NumberOfSeeds integer
---@field ValidProducerBaseTypes string
---@field BuildSeconds number
---@field NumberOfCollects integer
---@field RebuildSeconds number
---@field AutoBuild boolean
---@field AutoCollect boolean
---@field ReplaceProducerOnFinalCollect boolean
---@field ReplacementProducerId string
---@field CanExpire boolean
---@field ExpireSeconds number
---@field CanExpireInPlacedState boolean
---@field CanExpireInBuldingState boolean
---@field CanExpireInReadyState boolean
---@field ValidPlaceToolTypes string
---@field ValidBuildToolTypes string
---@field ValidDestroyToolTypes string
---@field ValidCollectToolTypes string
---@field PlaceEffects string
---@field CollectEffects string
---@field PlaceEffectsOffset Vector3
---@field CollectEffectsOffset Vector3
---@field DropOnCollect boolean
---@field DropTimeoutSeconds number
---@field DropItemPickupTemplate string
---@field DropMaxDistance number
---@field MaxPickupsPerDrop integer
---@field DropMinDistance number
---@field SinglePlayerDrops boolean
---@field DropForAllPlayers boolean

-- Private Variables
local producerBases = {}
local producersBySourceItem = {}

-- Constants
local PRODUCER_BASES_TAG = "PRD_"

---@class APIProducers
local API = {}

API.Events = {
    ProducerPlaced = PRODUCER_BASES_TAG .. "Placed",
    ProducerStartedBuilding = PRODUCER_BASES_TAG .. "StartedBuilding",
    ProducerReadyForCollect = PRODUCER_BASES_TAG .. "Ready",
    ProducerCollected = PRODUCER_BASES_TAG .. "Collected",
    ProducerRemoved = PRODUCER_BASES_TAG .. "Removed",
    ProducerExpired = PRODUCER_BASES_TAG .. "Expired",
    PlaceProducer = PRODUCER_BASES_TAG .. "Place",
    BuildProducer = PRODUCER_BASES_TAG .. "Build",
    ReadyProducer = PRODUCER_BASES_TAG .. "SetReady",
    CollectProducer = PRODUCER_BASES_TAG .. "Collect",
    ExpireProducer = PRODUCER_BASES_TAG .. "Expire",
    RemoveProducer = PRODUCER_BASES_TAG .. "Remove",
}

---Registers a Producer so that interactions on it can occur.
---@param producerBaseId string
---@param functionTable table
function API.RegisterProducerBase(producerBaseId, functionTable)
    producerBases[producerBaseId] = functionTable
end

---Unregisters a Producer and stops any further interactions from being allowed. This should be called when the Producer is destroyed.
---@param producerBaseId string
function API.UnregisterProducerBase(producerBaseId)
    producerBases[producerBaseId] = nil
end

---Returns true if the producer id has been registered.
---@param producerBaseId string
---@return boolean
function API.IsProducerBaseRegistered(producerBaseId)
    return producerBases[producerBaseId] ~= nil
end

---Finds a producer base
---@param target CoreObject
---@return any
function API.FindProducerBaseIdByAncestors(target)
    while Object.IsValid(target) do
        if API.IsProducerBaseRegistered(target.id) then
            return target.id
        end
        target = target.parent
    end
    return nil
end

---Returns the current state for a Producer.
---@param producerBaseId string
---@return ProducerBaseState
function API.GetProducerBaseState(producerBaseId)
	local producerBase = producerBases[producerBaseId]
    if producerBase then
        return producerBase.GetState()
    end
	return nil
end

---Returns a Producer Id based on the passed in Equipment settings.
---@param producerBaseId string
---@param toolType string
---@param equipmentSettings table
---@return string
function API.FindProducerIdFromEquipment(producerBaseId, toolType, equipmentSettings)
    local producerBase = producerBases[producerBaseId]
    if producerBase then
        return producerBase.FindProducerIdFromEquipment(toolType, equipmentSettings)
    end
end

---Returns true if the given Tool type can Place a Producer in this base.
---@param producerBaseId string
---@param producerId string
---@param toolType string
---@return boolean
function API.CanPlaceProducer(producerBaseId, producerId, toolType, equipmentSettings)
    local producerBase = producerBases[producerBaseId]
    if producerBase then
        return producerBase.CanPlaceProducer(producerId, toolType, equipmentSettings)
    end
end

---Places a producer on a producer base.
---@param producerBaseId string
---@param producerId string
function API.PlaceProducer(producerBaseId, producerId)
    local producerBase = producerBases[producerBaseId]
    if producerBase then
        producerBase.PlaceProducer(producerId)
    end
end

---Removes a producer from a prooducer base.
---@param producerBaseId string
function API.RemoveProducer(producerBaseId)
    local producerBase = producerBases[producerBaseId]
    if producerBase then
        producerBase.RemoveProducer()
    end
end

---Collects a Producer.
---@param player Player|nil
---@param producerBaseId string
function API.Collect(player, producerBaseId)
    local producerBase = producerBases[producerBaseId]
    if producerBase then
        API.HandleProducerDrops(player, producerBaseId)
        producerBase.Collect()
    end
end

function API.CollectDropResults(player, producerBaseId, dropResults)
    local producerBase = producerBases[producerBaseId]
    if producerBase then
        dropResults = dropResults or producerBase.GetDropResults(player)
        HandleCollectDrops(player, producerBaseId, dropResults)
    end
end

function API.HandleProducerDrops(player, producerBaseId, collectDrops)
    local producerBase = producerBases[producerBaseId]

    if producerBase then
        local dropResults = producerBase.GetDropResults(player)
        local state = API.GetProducerBaseState(producerBaseId)
        local producerId = state.producerId
        if producerId then
            local producerData = DATABASE.Producers[producerId]
            if producerData then
                local dropType = ""
                if state.hasExpired then
                    dropType = "ExpiredDrops"
                elseif state.isReadyForCollect then
                    dropType = "Drops"
                elseif not state.hasStartedBuilding then
                    dropType = "PlacedDrops"
                elseif state.isRebuilding then
                    dropType = "RebuildingDrops"
                else
                    dropType = "BuildingDrops"
                end

                local hasAppendedDrops = false
                local function GetModifiedDrops(data, appendDrops, dropModifiers)
                    local buffTargetId = producerBase.GetState().buffTargetId
                    for _, buffId in pairs(BUFFS.GetBuffs(buffTargetId)) do
                        local inputBuffData = data[buffId]
                        if inputBuffData then
                            local modifyBuffs = inputBuffData[dropType]
                            if modifyBuffs then
                                for dropName, dropData in pairs(modifyBuffs) do
                                    if dropData.ItemId or dropData.CurrencyId then
                                        appendDrops[dropName] = dropData
                                        hasAppendedDrops = true
                                    else
                                        table.insert(dropModifiers, {
                                            Data = dropData,
                                            Stacks = math.ceil(BUFFS.GetBuffRemainingAmount(buffTargetId, buffId, REALTIME.GetRealTime()))
                                        })
                                    end
                                end
                            end
                        end
                    end
                end

                local drops = producerData[dropType]
                drops = drops or {}

                local placeableData = DATABASE.Placeables[state.placeableId]
                local dropModifiers = {}
                local appendDrops = {}

                GetModifiedDrops(placeableData.InputBuffs or {}, appendDrops, dropModifiers)
                GetModifiedDrops(producerData.InputBuffs or {}, appendDrops, dropModifiers)

                if hasAppendedDrops or #dropModifiers > 0 then
                    drops = MODIFY_DROPS.ApplyDropModifiers(drops, appendDrops, dropModifiers)
                end

                HandleDrops(player, producerBaseId, drops, dropResults, collectDrops)
            end
        end
    end
end

---Tells a Producer to start building regardless of if it can
---@param producerBaseId string
function API.StartBuildingProducer(producerBaseId)
    local producerBase = producerBases[producerBaseId]
    if producerBase then
        producerBase.StartBuildingProducer()
    end
end

---Returns the Id of the first Producer that uses the provided source item, or nil if none are found.
---@param sourceItemId string
---@return string|nil
function API.GetProducerIdForSourceItem(sourceItemId)
    return producersBySourceItem[sourceItemId]
end

---Returns Product data based on a producerId.
---@param producerId string
---@return ProducerData
function API.GetProducerData(producerId)
    return DATABASE.Producers[producerId]
end

---Returns a Product data based on a number.
---@param uniqueStorageId integer
---@return table
function API.GetProducerIdByStorageId(uniqueStorageId)
    for producerId, producerData in pairs(DATABASE.Producers) do
        if type(producerData) == "table" then
            if producerData.UniqueStorageId == uniqueStorageId then
                return producerId
            end
        end
    end
end

---Returns a number based on a producerId
---@param producerId string
---@return integer
function API.GetProducerStorageIdByProducerId(producerId)
    local producerData = DATABASE.Producers[producerId]
    if producerData then
        return producerData.UniqueStorageId
    end
end

---comment
---@param placeableId string
---@return PlaceableData
function API.GetPlaceableData(placeableId)
    return DATABASE.Placeables[placeableId]
end

function API.CheckHasAllBuffs(producerBaseId, buffs)
    local producerBase = producerBases[producerBaseId]
    if producerBase then
        producerBase.CheckHasAllBuffs(buffs)
    end
end

function API.CheckHasAnyBuffs(producerBaseId, buffs)
    local producerBase = producerBases[producerBaseId]
    if producerBase then
        producerBase.CheckHasAnyBuffs(buffs)
    end
end

function HandleDrops(player, producerBaseId, dropTable, dropResults, collectDrops)
    if dropTable == nil then
        return
    end

    local producerBaseState = API.GetProducerBaseState(producerBaseId)
    local producerId = producerBaseState.producerId
    local producerData = DATABASE.Producers[producerId]

    if producerData then
        dropResults = DROPS.CalculateDrops(dropTable,1, dropResults)
        dropResults.producerData = producerData
    end

    if collectDrops then
        HandleCollectDrops(player, producerBaseId, dropResults)
    end
end

function HandleCollectDrops(player, producerBaseId, dropResults)
    local drops = dropResults
    if drops == nil then
        return
    end

    local producerBaseState = API.GetProducerBaseState(producerBaseId)
    local producerData = dropResults.producerData

    if producerData then
        -- If Player is nil we have to drop the item in world
        if producerData.DropOnCollect or not player then
            ITEM_PICKUPS.CreateItemPickupsForDrops(
                player,
                drops,
                producerData.DropItemPickupTemplate,
                producerBaseState.dropPosition,
                producerData.DropMinDistance,
                producerData.DropMaxDistance,
                producerData.DropForAllPlayers,
                producerData.SinglePlayerDrops,
                producerData.DropTimeoutSeconds,
                producerData.MaxPickupsPerDrop
            )
        else
            for itemId, amount in pairs(drops.Items) do
                INVENTORY.AddToInventory(player, nil, INVENTORY.ItemType.Item, itemId, amount, 0, false)
            end

            for currencyId, amount in pairs(drops.Currencies) do
                CURRENCY.AddCurrencyAmount(player, currencyId, amount)
            end
        end

        for upgradeId, _ in pairs(drops.Upgrades) do
            UPGRADES.AddUpgrade(player, upgradeId)
        end

        if producerData.CollectEffects and producerData.CollectEffects ~= "" then
            local params = { position = producerBaseState.position + producerData.CollectEffectsOffset }
            local effects = World.SpawnAsset(producerData.CollectEffects, params)

            -- Ensure these don't stack up
            if effects.lifeSpan == 0 then
                effects.lifeSpan = 5
            end
        end
    end
end

--- Validate the database data
Task.Spawn(function()
    if Environment.IsServer() or DATABASE.Producers == nil or #DATABASE.Producers == 0 then
        return
    end

    local usedStorageIds = {}
    for producerId, producerData in pairs(DATABASE.Producers) do
        if string.sub(producerId, 1, 2) ~= "--" then
            local uniqueStorageId = producerData.UniqueStorageId
            if uniqueStorageId == nil then
                error (producerId .. " is missing a UniqueStorageId custom property in the database")
            end
            if usedStorageIds[uniqueStorageId] then
                error ("Both '" .. producerId .. "' and '" .. usedStorageIds[uniqueStorageId]
                .. "' are using the same storage id of: " .. tostring(uniqueStorageId)  )
            end
            usedStorageIds[uniqueStorageId] = producerId
        end
    end
end)

function OnPlaceProducer(targetId, producerId)
    local producerBase = producerBases[targetId]
    if producerBase then
        producerBase.OnPlaceProducer(producerId)
    end
end

function OnBuildProducer(targetId, force, growth)
    local producerBase = producerBases[targetId]
    if producerBase then
        producerBase.OnBuildProducer(force, growth)
    end
end

function OnReadyProducer(targetId, force)
    local producerBase = producerBases[targetId]
    if producerBase then
        producerBase.OnReadyProducer(force)
    end
end

function OnCollectProducer(targetId, force)
    local producerBase = producerBases[targetId]
    if producerBase then
        producerBase.OnCollectProducer(force)
    end
end

function OnExpireProducer(targetId, force)
    local producerBase = producerBases[targetId]
    if producerBase then
        producerBase.OnExpireProducer(force)
    end
end

function OnRemoveProducer(targetId, player)
    local producerBase = producerBases[targetId]
    if producerBase then
        producerBase.OnRemoveProducer(player)
    end
end

---Populates a table with Drop Modifier Datas
---@param dropModifierIdsString string
---@param result table
function GetDropModifiers(dropModifierIdsString, result)
    if dropModifierIdsString and dropModifierIdsString ~= "" then
        if DATABASE.DropModifiers then
            local dropModifierIds = { CoreString.Split(dropModifierIdsString, ",", { removeEmptyResults = true }) }
            for _, dropModifierId in ipairs(dropModifierIds) do
                dropModifierId = CoreString.Trim(dropModifierId)
                local dropModifierData = DATABASE.DropModifiers[dropModifierId]
                if dropModifierData then
                    dropModifierData.Drops = dropModifierData.DropId
                    result[dropModifierId] = dropModifierData
                end
            end
        else
            warn("Could not find DropModifiers category in Database")
        end
    end
end

function GetAdditionalDrops(additionalDropIdsString, result)
    if additionalDropIdsString and additionalDropIdsString ~= "" then
        if DATABASE.Drops then
            local additionalDropIds = { CoreString.Split(additionalDropIdsString, ",", { removeEmptyResults = true }) }
            for _, additionalDropId in ipairs(additionalDropIds) do
                additionalDropId = CoreString.Trim(additionalDropId)
                local additionalDropData = DATABASE.Drops[additionalDropId]
                if additionalDropData then
                    result[additionalDropId] = additionalDropData
                end
            end
        else
            warn("Could not find Drops category in Database")
        end
    end
end

---Adds Buff Datas from Data Tables.
---@param buffIdString string
---@param inputBuffs table
---@param outputBuffs table
function GetBuffDatas(buffIdString, inputBuffs, outputBuffs)
    if buffIdString and buffIdString ~= "" then
        if DATABASE.ProducerBuffs then
            local buffIds = { CoreString.Split(buffIdString, ",", { removeEmptyResults = true }) }
            for _, buffId in ipairs(buffIds) do
                buffId = CoreString.Trim(buffId)
                local buffData = DATABASE.ProducerBuffs[buffId]
                if buffData then
                    if buffData.CanReceive == true then
                        inputBuffs[buffData.BuffId] = buffData

                        -- Handle Drop Modifiers and additional Drops
                        local placedDrops = buffData.PlacedDrops or {}
                        local buildingDrops = buffData.BuildingDrops or {}
                        local rebuildingDrops = buffData.RebuildingDrops or {}
                        local readyDrops = buffData.Drops or {}
                        local expiredDrops = buffData.ExpiredDrops or {}

                        GetDropModifiers(buffData.PlacedDropModifierIds, placedDrops)
                        GetDropModifiers(buffData.BuildingDropModifierIds, buildingDrops)
                        GetDropModifiers(buffData.RebuildingDropModifierIds, rebuildingDrops)
                        GetDropModifiers(buffData.DropModifierIds, readyDrops)
                        GetDropModifiers(buffData.ExpiredDropModifierIds, expiredDrops)

                        GetAdditionalDrops(buffData.PlacedAdditionalDropIds, placedDrops)
                        GetAdditionalDrops(buffData.BuildingAdditionalDropIds, buildingDrops)
                        GetAdditionalDrops(buffData.RebuildingAdditionalDropIds, rebuildingDrops)
                        GetAdditionalDrops(buffData.AdditionalDropIds, readyDrops)
                        GetAdditionalDrops(buffData.ExpiredAdditionalDropIds, expiredDrops)

                        buffData.PlacedDrops = placedDrops
                        buffData.BuildingDrops = buildingDrops
                        buffData.RebuildingDrops = rebuildingDrops
                        buffData.Drops = readyDrops
                        buffData.ExpiredDrops = expiredDrops
                    end

                    if buffData.CanOutput == true then
                        outputBuffs[buffData.BuffId] = buffData
                    end
                end
            end
        else
            warn("Could not find ProducerBuffs category in Database")
        end
    end
end

---Returns a table of Drop Datas or nil
---@param dropIdString string
---@return table|nil
function GetDropDatas(dropIdString)
    if dropIdString and dropIdString ~= "" then
        local drops = {}
        local dropIds = { CoreString.Split(dropIdString, ",", { removeEmptyResults  = true }) }
        for _, dropId in ipairs(dropIds) do
            dropId = CoreString.Trim(dropId)
            local dropData = DATABASE.Drops[dropId]
            if dropData then
                drops[dropId] = dropData
            end
        end
        return drops
    end
    return nil
end

---Formats data to ensure Data Tables work with older data format
function FormatData()
    if not DATABASE.Producers or #DATABASE.Producers == 0 or not DATABASE.ProducerStates or #DATABASE.ProducerStates == 0 then return end

    for producerId, producerData in pairs(DATABASE.Producers) do
        -- Handle Data Table Drop Behavior
        if producerData.DropBehaviorId and producerData.DropBehaviorId ~= "" then
            if DATABASE.DropBehaviors then
                local dropBehaviorData = DATABASE.DropBehaviors[producerData.DropBehaviorId]
                if dropBehaviorData then
                    producerData.DropForAllPlayers = dropBehaviorData.DropForAllPlayers
                    producerData.SinglePlayerDrops = dropBehaviorData.SinglePlayerDrops
                    producerData.MaxPickupsPerDrop = dropBehaviorData.MaxPickupsPerDrop
                    producerData.DropMinDistance = dropBehaviorData.DropMinDistance
                    producerData.DropMaxDistance = dropBehaviorData.DropMaxDistance
                    producerData.DropTimeoutSeconds = dropBehaviorData.DropTimeoutSeconds
                    producerData.DropItemPickupTemplate = dropBehaviorData.DropItemPickupTemplate
                else
                    warn("Could not find DropBehaviors data in Database for Producer: " .. producerId)
                end
            else
                warn("Could not find DropBehaviors category in Database")
            end
        end

        -- Handle Missing Columns
        producerData.ToolsConsumedWhenPlaced = producerData.ToolsConsumedWhenPlaced or 0
        producerData.ToolsConsumedWhenBuilt = producerData.ToolsConsumedWhenBuilt or 0
        producerData.ToolsConsumedWhenRebuilt = producerData.ToolsConsumedWhenRebuilt or 0
        producerData.ToolsConsumedWhenDestroyed = producerData.ToolsConsumedWhenDestroyed or 0
        producerData.ToolsConsumedWhenCollected = producerData.ToolsConsumedWhenCollected or 0
        producerData.ValidBuildToolTypes = producerData.ValidBuildToolTypes or ""
        producerData.ValidRebuildToolTypes = producerData.ValidRebuildToolTypes or ""
        producerData.BuildInteractionText = producerData.BuildInteractionText or ""
        producerData.ValidDestroyToolTypes = producerData.ValidDestroyToolTypes or ""
        producerData.DestroyInteractionText = producerData.DestroyInteractionText or ""
        producerData.ValidCollectToolTypes = producerData.ValidCollectToolTypes or ""
        producerData.PlaceEffectsOffset = producerData.PlaceEffectsOffset or Vector3.ZERO
        producerData.CollectEffectsOffset = producerData.CollectEffectsOffset or Vector3.ZERO
        producerData.RemoveEffectsOffset = producerData.RemoveEffectsOffset or Vector3.ZERO

        -- Handle Data Table Drops
        producerData.Drops = GetDropDatas(producerData.DropIds) or producerData.Drops
        producerData.PlacedDrops = GetDropDatas(producerData.PlacedDropIds) or producerData.PlacedDrops
        producerData.BuildingDrops = GetDropDatas(producerData.BuildingDropIds) or producerData.BuildingDrops
        producerData.RebuildingDrops = GetDropDatas(producerData.RebuildingDropIds) or producerData.RebuildingDrops
        producerData.ExpiredDrops = GetDropDatas(producerData.ExpiredDropIds) or producerData.ExpiredDrops

        -- Handle Data Table Buffs
        local inputBuffs = producerData.InputBuffs or {}
        local outputBuffs = producerData.OutputBuffs or {}

        GetBuffDatas(producerData.ProducerBuffIds, inputBuffs, outputBuffs)

        producerData.InputBuffs = inputBuffs
        producerData.OutputBuffs = outputBuffs

        -- Handle Data Table States
        if producerData.ProducerStatesId and producerData.ProducerStatesId ~= "" then
            if DATABASE.ProducerStates then
                local producerStatesData = DATABASE.ProducerStates[producerData.ProducerStatesId]
                if producerStatesData then
                    producerData.PlacedState_Client = producerStatesData.PlacedState_Client
                    producerData.PlacedState_Server = producerStatesData.PlacedState_Server
                    producerData.PlacedState_Static = producerStatesData.PlacedState_Static

                    producerData.ReadyState_Client = producerStatesData.ReadyState_Client
                    producerData.ReadyState_Server = producerStatesData.ReadyState_Server
                    producerData.ReadyState_Static = producerStatesData.ReadyState_Static

                    producerData.ExpiredState_Client = producerStatesData.ExpiredState_Client
                    producerData.ExpiredState_Server = producerStatesData.ExpiredState_Server
                    producerData.ExpiredState_Static = producerStatesData.ExpiredState_Static

                    local index = 1
                    while true do
                        local stateClient = producerStatesData["BuildingState" .. tostring(index) .. "_Client"]
                        local stateServer = producerStatesData["BuildingState" .. tostring(index) .. "_Server"]
                        local stateStatic = producerStatesData["BuildingState" .. tostring(index) .. "_Static"]
                        if stateClient or stateServer or stateStatic then
                            producerData["State" .. tostring(index) .. "_Client"] = stateClient
                            producerData["State" .. tostring(index) .. "_Server"] = stateServer
                            producerData["State" .. tostring(index) .. "_Static"] = stateStatic

                            index = index + 1
                        else
                            break
                        end
                    end

                    index = 1
                    while true do
                        local stateClient = producerStatesData["RebuildingState" .. tostring(index) .. "_Client"]
                        local stateServer = producerStatesData["RebuildingState" .. tostring(index) .. "_Server"]
                        local stateStatic = producerStatesData["RebuildingState" .. tostring(index) .. "_Static"]
                        if stateClient or stateServer or stateStatic then
                            producerData["RebuildingState" .. tostring(index) .. "_Client"] = stateClient
                            producerData["RebuildingState" .. tostring(index) .. "_Server"] = stateServer
                            producerData["RebuildingState" .. tostring(index) .. "_Static"] = stateStatic

                            index = index + 1
                        else
                            break
                        end
                    end
                else
                    warn("Could not find ProducerStates data in Database for Producer: " .. producerId)
                end
            else
                warn("Could not find ProducerStates category in Database")
            end
        end
    end
end

---Caches a lookup of source item ids to producer ids.
function CacheProducersBySourceItem()
    if not DATABASE.Producers or #DATABASE.Producers == 0 then return end

    for id, data in pairs(DATABASE.Producers) do
        if data.SourceItemId and data.SourceItemId ~= "" and not producersBySourceItem[data.SourceItemId] then
            producersBySourceItem[data.SourceItemId] = id
        end
    end
end

function OnDataChanged()
    FormatData()
    CacheProducersBySourceItem()
end

FormatData()

DATABASE.RegisterDataChangeHandler(OnDataChanged, "Producers")
CacheProducersBySourceItem()

Events.Connect(API.Events.PlaceProducer, OnPlaceProducer)
Events.Connect(API.Events.BuildProducer, OnBuildProducer)
Events.Connect(API.Events.ReadyProducer, OnReadyProducer)
Events.Connect(API.Events.CollectProducer, OnCollectProducer)
Events.Connect(API.Events.ExpireProducer, OnExpireProducer)
Events.Connect(API.Events.RemoveProducer, OnRemoveProducer)

return API