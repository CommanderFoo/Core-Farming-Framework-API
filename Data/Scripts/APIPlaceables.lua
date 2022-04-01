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
    This script handles all client and server placeable interactions. Each Plot should register with this API on the
    client and the server to ensure state and interaction can occur in either context.
--]]

---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APIInventory
local INVENTORY = require(script:GetCustomProperty("APIInventory"))
---@type APIItemPickups
local ITEM_PICKUPS = require(script:GetCustomProperty("APIItemPickups"))
---@type APIBuffs
local BUFFS = require(script:GetCustomProperty("APIBuffs"))
---@type APISerializer
local SERIALIZER = require(script:GetCustomProperty("APISerializer"))
---@type APIReplicator
local REPLICATOR = require(script:GetCustomProperty("APIReplicator"))
---@type APITags
local TAGS = require(script:GetCustomProperty("APITags"))

-- Constants
local PLACEABLES_TAG = "PBL_"
local PLACEABLE_TYPE = {
    None = "",
    ProducerBase = "ProducerBase",
    Inventory = "Inventory",
    CraftingStation = "CraftingStation"
}

-- Private Variables
local placeables = {}

---@class APIPlaceables
local API = {}

API.Events = {
    PlaceablePlaced = PLACEABLES_TAG .. "Placed",
    PlaceableRemoved = PLACEABLES_TAG .. "Removed",
    RemovePlaceable = PLACEABLES_TAG .. "Remove",
}

---Registers a Placeable so that interactions on it can occur.
---@param placeableId string
---@param functionTable table
function API.RegisterPlaceable(placeableId, functionTable)
    placeables[placeableId] = functionTable
end

---Unregisters a Placeable and stops any further interactions from being allowed. This should be called when the
---Placeable is destroyed.
---@param placeableId string
function API.UnregisterPlaceable(placeableId)
    placeables[placeableId] = nil
end

---Returns true if the placeable id has been registered.
---@param placeableId string
---@return boolean
function API.IsPlaceableRegistered(placeableId)
    return placeables[placeableId] ~= nil and placeables[placeableId] ~= nil
end

---Finds a Placeable Id by searching upward through the hierarchy.
---@param target CoreObject
---@return string
function API.FindPlaceableIdByAncestors(target)
    while Object.IsValid(target) do
        if API.IsPlaceableRegistered(target.id) then
            return target.id
        end
        target = target.parent
    end
    return nil
end

---Returns the current state for a Placeable.
---@param placeableId string
---@return PlaceableState
function API.GetPlaceableState(placeableId)
	local placeable = placeables[placeableId]
    if placeable then
        return placeable.GetState()
    end
	return nil
end

---Returns true if drops are successful.
---@param instance table
---@param position Vector3
---@param player Player
---@return boolean
function API.HandlePlaceableDrops(instance, position, player)
    local placeableId = instance.placeableId
    local success = true

    if placeableId then
        local placeableData = DATABASE.Placeables[placeableId]
        local itemData = DATABASE.Items[placeableId]
        if placeableData and itemData then
            local itemId = placeableId
            local itemType = INVENTORY.ItemType.Item
            if itemData.IsInventory then
                local inventoryId, _ = SERIALIZER.ReadString(instance.state)
                itemId = inventoryId
                itemType = INVENTORY.ItemType.Inventory
            end

            if placeableData.DropsOnRemove then
                ITEM_PICKUPS.CreateItemPickup(player,
                placeableData.DropItemPickupTemplate,
                position,
                position,
                ITEM_PICKUPS.PickupType.Item,
                itemType,
                itemId,
                1,
                placeableData.DropsForAllPlayers,
                true,
                placeableData.DropTimeoutSeconds
            )
            else
                if INVENTORY.CanAddToInventory(player, nil, itemType, itemId, 1, 0, false) then
                    INVENTORY.AddToInventory(player, nil, itemType, itemId, 1, 0, false)
                else
                    success = false
                end
            end
        end
    end
    return success
end

function API.GetPlacementLimitInfo(replicatorId, replicatorIdentifier, placeableId)
    local hasHitLimit = false
    local totalAmount = 0
    local currentAmount = 0
    local placeableMax = 0
    local totalMax = 0

    if DATABASE.PlaceableLimits then
        local placeableLimitsData = DATABASE.PlaceableLimits[replicatorIdentifier]
        local placeableLimitDatas = {}

        if placeableLimitsData and placeableId then
            -- Check for Data Table format
            if placeableLimitsData.PerPlaceableLimitIds then
                if DATABASE.PerPlaceableLimits then
                    local placeableLimitIds = { CoreString.Split(placeableLimitsData.PerPlaceableLimitIds, ",", { removeEmptyResults  = true }) }
                    for _, placeableLimitId in ipairs(placeableLimitIds) do
                        placeableLimitId = CoreString.Trim(placeableLimitId)
                        local placeableLimitData = DATABASE.PerPlaceableLimits[placeableLimitId]
                        if placeableLimitData and placeableLimitData.Placeables and placeableLimitData.Placeables ~= "" then
                            local tags = TAGS.SplitTagsString(placeableLimitData.Placeables)
                            local matchingPlaceables = TAGS.FindMatchingData("Placeables", tags, false)
                            if matchingPlaceables[placeableId] then
                                table.insert(placeableLimitDatas, placeableLimitData)
                            end
                        end
                    end
                end
            else
                -- Old format
                placeableLimitDatas = DATABASE.PlaceableLimits[replicatorIdentifier]:Find(function(key, value)
                    if value and value.PlaceableId and value.PlaceableId == placeableId then
                        return true
                    end
                end)
            end
        end

        local placeableLimitData
        for _, value in pairs(placeableLimitDatas) do
            placeableLimitData = value
            break
        end

        if placeableLimitsData then
            if placeableId then
                local matchingPlaceables = { [placeableId] = true }
                if placeableLimitData then
                    local tags = TAGS.SplitTagsString(placeableLimitData.Placeables)
                    matchingPlaceables = TAGS.FindMatchingData("Placeables", tags, false)
                end

                for _, instance in pairs(REPLICATOR.GetInstances(replicatorId)) do
                    if matchingPlaceables[instance.placeableId] then
                        currentAmount = currentAmount + 1
                    end
                    totalAmount = totalAmount + 1
                end
            else
                for _, instance in pairs(REPLICATOR.GetInstances(replicatorId)) do
                    totalAmount = totalAmount + 1
                end
            end

            if placeableLimitsData.MaxAmount and placeableLimitsData.MaxAmount > 0 then
                totalMax = placeableLimitsData.MaxAmount
                if totalAmount >= totalMax then
                    hasHitLimit = true
                end
            end

            if placeableLimitData and placeableLimitData.MaxAmount and placeableLimitData.MaxAmount > 0 then
                placeableMax = placeableLimitData.MaxAmount
                if currentAmount >= placeableMax then
                    hasHitLimit = true
                end
            end
        end
    end
    return hasHitLimit, currentAmount, totalAmount, placeableMax, totalMax
end

function OnRemovePlaceable(targetId, player)
    local placeable = placeables[targetId]
    if placeable then
        placeable.OnRemovePlaceable(player)
    end
end

function OnBuffAdded(targetId, buffId)
    local placeable = placeables[targetId]
    if placeable then
        placeable.OnBuffAdded(buffId)
    end
end

function OnBuffRemoved(targetId, buffId)
    local placeable = placeables[targetId]
    if placeable then
        placeable.OnBuffRemoved(buffId)
    end
end

function OnBuffRelinked(targetId, buffId)
    local placeable = placeables[targetId]
    if placeable then
        placeable.OnBuffRelinked(buffId)
    end
end

function OnHandleBuffs()
    for produerBaseId, placeable in pairs(placeables) do
        placeable.OnHandleBuffs()
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

function GetBuffDatas(buffDataIds, tableName, inputBuffs, outputBuffs)
    if DATABASE[tableName] then
        if buffDataIds and buffDataIds ~= "" then
            local buffIds = { CoreString.Split(buffDataIds, ",", { removeEmptyResults = true }) }
            for _, buffId in ipairs(buffIds) do
                buffId = CoreString.Trim(buffId)
                local buffData = DATABASE[tableName][buffId]
                if buffData then
                    if buffData.CanReceive then
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
                    if buffData.CanOutput then
                        outputBuffs[buffData.BuffId] = buffData
                    end
                end
            end
        end
    else
        warn(string.format("Could not find %s category in Database", tableName))
    end
end

---Formats data to ensure Data Tables work with older data format
function FormatData()
    if not DATABASE.Placeables or #DATABASE.Placeables == 0 then return end

    for placeableId, placeableData in pairs(DATABASE.Placeables) do
        -- Handle Data Table Costs
        if placeableData.CostItemId1 or placeableData.CostCurrencyId1 then
            local costs = {}
            local index = 1
            while true do
                local costItemId = placeableData["CostItemId" .. tostring(index)] or ""
                local costCurrencyId = placeableData["CostCurrencyId" .. tostring(index)] or ""
                local costAmount = placeableData["CostAmount" .. tostring(index)] or 0
                if (costItemId ~= "" or costCurrencyId ~= "") and costAmount > 0 then
                    table.insert(costs, {
                        ItemId = costItemId,
                        CurrencyId = costCurrencyId,
                        Amount = costAmount
                    })
                    index = index + 1
                else
                    break
                end
            end

            placeableData.Costs = costs
        end

        -- Handle Data Table Buffs
        local inputBuffs = placeableData.InputBuffs or {}
        local outputBuffs = placeableData.OutputBuffs or {}

        GetBuffDatas(placeableData.PlaceableBuffIds, "PlaceableBuffs", inputBuffs, outputBuffs)
        GetBuffDatas(placeableData.ProducerBuffIds, "ProducerBuffs", inputBuffs, outputBuffs)
        GetBuffDatas(placeableData.CraftingStationBuffIds, "CraftingStationBuffs", inputBuffs, outputBuffs)

        placeableData.InputBuffs = inputBuffs
        placeableData.OutputBuffs = outputBuffs

        -- Handle Data Table Drop Behavior
        if placeableData.DropBehaviorId and placeableData.DropBehaviorId ~= "" then
            if DATABASE.DropBehaviors then
                local dropBehaviorData = DATABASE.DropBehaviors[placeableData.DropBehaviorId]
                if dropBehaviorData then
                    placeableData.DropForAllPlayers = dropBehaviorData.DropForAllPlayers
                    placeableData.SinglePlayerDrops = dropBehaviorData.SinglePlayerDrops
                    placeableData.MaxPickupsPerDrop = dropBehaviorData.MaxPickupsPerDrop
                    placeableData.DropMinDistance = dropBehaviorData.DropMinDistance
                    placeableData.DropMaxDistance = dropBehaviorData.DropMaxDistance
                    placeableData.DropTimeoutSeconds = dropBehaviorData.DropTimeoutSeconds
                    placeableData.DropItemPickupTemplate = dropBehaviorData.DropItemPickupTemplate
                else
                    warn("Could not find DropBehaviors data in Database for Placeable: " .. placeableId)
                end
            else
                warn("Could not find DropBehaviors category in Database")
            end
        end

        placeableData.IsFormatted = true
    end
end

function OnDataChanged()
    FormatData()
end

FormatData()

DATABASE.RegisterDataChangeHandler(OnDataChanged, "Placeables")
DATABASE.RegisterDataChangeHandler(OnDataChanged, "PlaceableBuffs")
DATABASE.RegisterDataChangeHandler(OnDataChanged, "ProducerBuffs")
DATABASE.RegisterDataChangeHandler(OnDataChanged, "CraftingStationBuffs")
DATABASE.RegisterDataChangeHandler(OnDataChanged, "Drops")
DATABASE.RegisterDataChangeHandler(OnDataChanged, "DropModifiers")

Events.Connect(API.Events.RemovePlaceable, OnRemovePlaceable)
Events.Connect(BUFFS.Events.BuffAdded, OnBuffAdded)
Events.Connect(BUFFS.Events.BuffRemoved, OnBuffRemoved)
Events.Connect(BUFFS.Events.BuffRelinked, OnBuffRelinked)
Events.Connect(BUFFS.Events.HandleBuffs, OnHandleBuffs)

return API