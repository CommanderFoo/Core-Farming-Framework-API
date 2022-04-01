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
    This script runs on each Producer on the client and the server. APIProducers can be called in either context to direct
    interactions to these individual Producers.
--]]

local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

-- Required APIs
---@type APIProducers
local PRODUCER_BASES = require(script:GetCustomProperty("APIProducers"))
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APIReplicator
local REPLICATOR = require(script:GetCustomProperty("APIReplicator"))
---@type APIBuffs
local BUFFS = require(script:GetCustomProperty("APIBuffs"))
---@type APIEquipment
local EQUIPMENT = require(script:GetCustomProperty("APIEquipment"))
---@type APIInventory
local INVENTORY = require(script:GetCustomProperty("APIInventory"))
---@type APIRealTime
local REALTIME = require(script:GetCustomProperty("APIRealTime"))
---@type APICounter
local COUNTER = require(script:GetCustomProperty("APICounter"))
---@type APITags
local TAGS = require(script:GetCustomProperty("APITags"))
---@type APISerializer
local SERIALIZER = require(script:GetCustomProperty("APISerializer"))
---@type APIPlayerLots
local PLAYER_LOTS = require(script:GetCustomProperty("APIPlayerLots"))
---@type Attribute
local Attribute = require(script:GetCustomProperty("APIAttribute"))

---@type PlaceableControllerBase
local PlaceableControllerBase = require(script:GetCustomProperty("PlaceableControllerBase"))

---@class ProducerBaseController
local ProducerBaseController = PlaceableControllerBase:extend()

function ProducerBaseController:New(rootObject)
    local controller = ProducerBaseController:new()
    controller:InitializePlaceable(rootObject)
    controller:InitializeProducerBase()
    return controller
end

function ProducerBaseController:InitializeProducerBase()
    self.InstanceNeedsEncoding = false
    self.InstanceNeedsModification = false
    self.PlayerDropResults = {}
    self.GlobalDropResults = nil
    self.DropsNeedCollecting = false
    self.ProducerGroup = self.ComponentRoot
    self.DropPosition = self.RuntimeState.position

    table.insert(self.Listeners,
    self.ComponentRoot.childAddedEvent:Connect(function(parent, child)
        self.ProducerGroup = self.ComponentRoot
        if child:GetCustomProperty("ProducerGroup") then
            self.ProducerGroup = child:GetCustomProperty("ProducerGroup"):WaitForObject() or self.ProducerGroup
        end

        if child:GetCustomProperty("DropPosition") then
            local dropPosObject = child:GetCustomProperty("DropPosition"):WaitForObject()
            if dropPosObject then
                self.DropPosition = dropPosObject:GetWorldPosition()
            end
        end
    end))

    -- Counters are used to calculate a new value of build and expire
    function GetTime() return self:GetTime() end
    self.BuildCounter = COUNTER.New(0, 0, 1, 1, 0, GetTime)
    self.ExpireCounter = COUNTER.New(0, 0, 1, 1, 0, GetTime)

    self.ProducerTemplateData = {
        placed = {},
        building = {},
        ready = {},
        expired = {},
        rebuilding = {},
    }

    self.ProducerClientCoreObject = nil
    self.ProducerClientTemplate = nil
    self.ProducerServerCoreObject = nil
    self.ProducerServerTemplate = nil
    self.ProducerStaticCoreObject = nil
    self.ProducerStaticTemplate = nil

    self.ProducerPreviewTask = nil
    self.ProducerPreviewTemplate = nil
    self.ProducerPreview = nil

    PRODUCER_BASES.RegisterProducerBase(self.ComponentRoot.id, {
        Collect = function(...) return self:Collect(...) end,
        GetState = function(...) return self:GetState(...) end,
        CanPlaceProducer = function(...) return self:CanPlaceProducer(...) end,
        PlaceProducer = function(...) return self:PlaceProducer(...) end,
        RemoveProducer = function(...) return self:RemoveProducer(...) end,
        StartBuildingProducer = function(...) return self:StartBuildingProducer(...) end,
        HasProducerExpired = function(...) return self:HasProducerExpired(...) end,
        FindProducerIdFromEquipment = function(...) return self:FindProducerIdFromEquipment(...) end,
        CheckHasAllBuffs = function(...) return self:CheckHasAllBuffs(...) end,
        CheckHasAnyBuffs = function(...) return self:CheckHasAnyBuffs(...) end,
        GetDropResults = function(...) return self:GetDropResults(...) end,
        OnPlaceProducer = function(...) return self:OnPlaceProducer(...) end,
        OnBuildProducer = function (...) return self:OnBuildProducer(...) end,
        OnReadyProducer = function (...) return self:OnReadyProducer(...) end,
        OnCollectProducer = function (...) return self:OnCollectProducer(...) end,
        OnExpireProducer = function (...) return self:OnExpireProducer(...) end,
        OnRemoveProducer = function (...) return self:OnRemoveProducer(...) end,
    })
end

function ProducerBaseController:Initialize()
    self:ClearBuffData()
    self:InstanceToRuntimeState()
    self:HandleAutoBuild()
    self:UpdateProducerTemplateData()
    self:UpdateLinkedBuffs()
    self:RuntimeStateToInstance()
end

function ProducerBaseController:PreDestroy()
    PRODUCER_BASES.UnregisterProducerBase(self.ComponentRoot.id)
end

--- Instance ---

---Override to include additional producer state
function ProducerBaseController:InitializeRuntimeState()
    return {
        position = self.ComponentRoot:GetWorldPosition(),
        rotation = self.ComponentRoot:GetWorldRotation(),
        placeableId = self.PlaceableId,
        placeableData = self.PlaceableData,
        producerId = nil,
        producerData = nil,
        numCollects = 0,
        time = REALTIME.GetRealTime(),
        isReadyForCollect = false,
        hasStartedBuilding = false,
        hasExpired = false,
        isRebuilding = false,
        buildAmount = 0,
        expireAmount = 0
    }
end

---Override to include additional producer state
function ProducerBaseController:InstanceToRuntimeState(allowPrediction)
    local producerUniqueStorageId, buildAmount, numCollects, expireAmount, buffState
    if self.Instance.state == "" then
        producerUniqueStorageId, buildAmount, numCollects, expireAmount, buffState = self:GetDefaultState()
    else
        producerUniqueStorageId, buildAmount, numCollects, expireAmount, buffState = SERIALIZER.ReadString(self.Instance.state)

        numCollects = numCollects or 0
        expireAmount = expireAmount or 0.0
    end

    local producerId = nil
    if producerUniqueStorageId then
        producerId = PRODUCER_BASES.GetProducerIdByStorageId(producerUniqueStorageId)
    end

    local currentTime = self.Instance.serverTime
    local previousTime = self.RuntimeState.time

    self:SetProducerId(producerId)

    self.RuntimeState.time = currentTime
    self.RuntimeState.numCollects = numCollects
    self.RuntimeState.isReadyForCollect = buildAmount ~= nil and buildAmount > 0.99999
    self.RuntimeState.hasExpired = expireAmount > 0.99999
    self.RuntimeState.hasStartedBuilding = buildAmount ~= nil
    self.RuntimeState.buildAmount = buildAmount or 0
    self.RuntimeState.expireAmount = expireAmount
    self.RuntimeState.isRebuilding = numCollects > 0

    self.BuildCounter:SetValue(buildAmount or 0)
    self.ExpireCounter:SetValue(expireAmount)

    self:UpdateBuffData()

    BUFFS.ReadBuffsFromTable(self.ComponentRoot.id, buffState or {}, function() return self:GetTime() end)

    self:UpdateLinkedBuffs()
    self:UpdateBuildRate()
    self:UpdateExpireRate()
    self:UpdateBuffRates()
    self:HandleAutoBuild()

    if allowPrediction then
        -- If we recieved stuff in the past, run this forward to the time we were at
        if previousTime > currentTime then
            self.RuntimeState.time = currentTime
            self:UpdateRuntimeState()
        end
    end
end

---Handles build and expiry changes
function ProducerBaseController:UpdateRuntimeState()
    self.RuntimeState.buildAmount = self.BuildCounter:GetValue()
    self.RuntimeState.expireAmount = self.ExpireCounter:GetValue()

    local hasExpired = self.RuntimeState.expireAmount > 0.99999
    local isReadyForCollect = self.RuntimeState.buildAmount > 0.99999

    if self.RuntimeState.hasExpired ~= hasExpired then
        self.RuntimeState.hasExpired = hasExpired
        self.InstanceNeedsEncoding = true

        self:UpdateLinkedBuffs()

        if hasExpired then
            Events.Broadcast(PRODUCER_BASES.Events.ProducerExpired, self.ComponentRoot.id, self.RuntimeState.placeableId, self.RuntimeState.producerId)
        end
    end

    if self.RuntimeState.isReadyForCollect ~= isReadyForCollect then
        self.RuntimeState.isReadyForCollect = isReadyForCollect
        self.InstanceNeedsEncoding = true

        self:UpdateLinkedBuffs()

        if isReadyForCollect then
            Events.Broadcast(PRODUCER_BASES.Events.ProducerReadyForCollect, self.ComponentRoot.id, self.RuntimeState.placeableId, self.RuntimeState.producerId)
        end
    end

    self:UpdateBuildRate()
    self:UpdateExpireRate()
    self:UpdateBuffRates()
end

---Returns the default state for this Producer base
---@return string|nil   - producerUniqueStorageId
---@return number|nil   - buildAmount
---@return integer      - numCollects
---@return number       - expireAmount
---@return table        - buffState
function ProducerBaseController:GetDefaultState()
    local producerId = self.PlaceableData.InitialProducerId

    -- If we defined a custom property on a placeholder in the scene
    if self.Instance.existingCoreObject then
        local placeholderProducerId = self.Instance.existingCoreObject:GetCustomProperty("ProducerId")
        if placeholderProducerId and placeholderProducerId ~= "" then
            producerId = placeholderProducerId
        end
    end

    return PRODUCER_BASES.GetProducerStorageIdByProducerId(producerId), nil, 0, 0.0, {}
end

---Override to include additional producer state
function ProducerBaseController:RuntimeStateToInstance()
    local producerUniqueStorageId = PRODUCER_BASES.GetProducerStorageIdByProducerId(self.RuntimeState.producerId)
    local buildAmount = self.RuntimeState.buildAmount
    local numCollects = self.RuntimeState.numCollects
    local expiredAmount = self.RuntimeState.expireAmount

    if self.RuntimeState.hasExpired then
        expiredAmount = 1
    end
    if self.RuntimeState.isReadyForCollect then
        buildAmount = 1
    end
    if not self.RuntimeState.hasStartedBuilding then
        buildAmount = nil
    end

    local buffState = BUFFS.WriteBuffsToTable(self.ComponentRoot.id, self:GetTime())
    self.Instance.state = SERIALIZER.WriteString(producerUniqueStorageId, buildAmount, numCollects, expiredAmount, buffState)
    self.Instance.serverTime = self.RuntimeState.time
end

function ProducerBaseController:OnInstanceModified()
    self:InstanceToRuntimeState(true)
    self.RuntimeState.position = self.ComponentRoot:GetWorldPosition()
    self.RuntimeState.rotation = self.ComponentRoot:GetWorldRotation()

    self:UpdateProducerTemplateData()
    self:HandleAutoBuild()
end

---Override to include additional producer state
function ProducerBaseController:GetState()
    ---@class ProducerBaseState
    local result = {
        placeableId = self.RuntimeState.placeableId,
        replicatorId = self.Instance.replicatorId,
        instance = self.Instance,
        position = self.RuntimeState.position,
        rotation = self.RuntimeState.rotation,
        buildAmount = self.RuntimeState.buildAmount,
        numCollects = self.RuntimeState.numCollects,
        producerId = self.RuntimeState.producerId,
        expireAmount = self.RuntimeState.expireAmount,
        hasExpired = self.RuntimeState.hasExpired,
        hasStartedBuilding = self.RuntimeState.hasStartedBuilding,
        isReadyForCollect = self.RuntimeState.isReadyForCollect,
        isRebuilding = self.RuntimeState.isRebuilding,
        hasProducer = self:HasProducer(),
        buffData = self.BuffData,
        buildRate = self.BuildCounter.rateOfChange,
        expireRate = self.ExpireCounter.rateOfChange,
        buildTimeRemaining = self.BuildCounter:GetRemainingTimeToMax(self.RuntimeState.time),
        expireTimeRemaining = self.ExpireCounter:GetRemainingTimeToMax(self.RuntimeState.time),
        buffTargetId = self.ComponentRoot.id,
        dropPosition = self.DropPosition
    }
    return result
end

--- Interaction ---

---Override to include producer interactions
function ProducerBaseController:InitializeEquipmentInteractions()
    return {
        self:NewPlaceProducerInteraction(),
        self:NewBuffProducerInteraction(),
        self:NewStartBuildingProducerInteraction(),
        self:NewCollectProducerInteraction(),
        self:NewRemoveProducerInteraction(),
        self:NewBuffPlaceableInteraction(),
        self:NewRemovePlaceableInteraction(),
        self:NewProducerInteractionError()
    }
end

function ProducerBaseController:OnPlaceProducer(producerId)
    local producerData = PRODUCER_BASES.GetProducerData(producerId)
    if not producerData then
        warn("Unable to find any data for producer id: " .. producerId)
        return
    end

    PRODUCER_BASES.PlaceProducer(self.ComponentRoot.id, producerId)
    self:ProducerPlacementEffects(producerId)
end

function ProducerBaseController:CanPlaceProducer(producerId, toolType, equipmentSettings)
    if not self:HasProducer() then
        if not producerId then
            return false, "Missing item to place"
        end

        local producerData = PRODUCER_BASES.GetProducerData(producerId)
        if producerData then
            -- Check that the tool is valid
            if EQUIPMENT.IsValidToolType(producerData.ValidPlaceToolTypes, toolType, equipmentSettings)  then
                -- Check that the seed can be produced in this base
                local producerBaseTypes = TAGS.SplitTagsString(producerData.ValidProducerBaseTypes)
                if #producerBaseTypes == 0 then
                    return true
                else
                    for _, producerBaseType in pairs(producerBaseTypes) do
                        if CoreString.Trim(producerBaseType) == CoreString.Trim(self.PlaceableData.ProducerBaseType) then
                            return true
                        end
                    end
                end
            end
        end
        return false, "This can't be used here"
    end
    return false, "This is not empty"
end

function ProducerBaseController:NewPlaceProducerInteraction()
    return function(player, target, toolType, equipmentSettings, doInteract)
        local itemId = equipmentSettings.ItemId
        local producerId, canPlaceError = self:FindProducerIdFromEquipment(toolType, equipmentSettings)

        if producerId then
            local producerData = PRODUCER_BASES.GetProducerData(producerId)
            if producerData then
                if self:HasRequiredItems(player, producerData.ToolsConsumedWhenPlaced, equipmentSettings) then
                    Events.Broadcast("CanEquipmentInteract", "PlaceProducer", target, toolType, equipmentSettings)

                    local inventoryId = equipmentSettings.InventoryId
                    local slotIndex = equipmentSettings.SlotIndex
                    local itemData = DATABASE.Items[itemId]

                    self:ShowProducerPreview(producerId)

                    if itemData and producerData then
                        local amountLeft = INVENTORY.GetAmountInInventory(player, inventoryId, INVENTORY.ItemType.Item, itemId, slotIndex)
                        if amountLeft >= producerData.NumberOfSeeds then
                            if doInteract then
                                PRODUCER_BASES.PlaceProducer(self.ComponentRoot.id, producerId)
                                self:ProducerPlacementEffects(producerId)

                                INVENTORY.RemoveFromInventory(player, inventoryId, INVENTORY.ItemType.Item, itemId, producerData.NumberOfSeeds, slotIndex)
                                amountLeft = amountLeft - producerData.NumberOfSeeds

                                -- Handle tool consumption
                                if producerData.ToolsConsumedWhenPlaced and producerData.ToolsConsumedWhenPlaced > 0 then
                                    if equipmentSettings.InventoryId and equipmentSettings.InventoryId ~= "" then
                                        INVENTORY.RemoveFromInventory(player, equipmentSettings.InventoryId, INVENTORY.ItemType.Item, itemId, producerData.ToolsConsumedWhenPlaced, equipmentSettings.SlotIndex)
                                    end
                                end
                                return true, nil
                            end
                        else
                            canPlaceError = self:GetMissingRequirementsMessage(itemId)
                        end
                    else
                        canPlaceError = self:GetMissingRequirementsMessage(itemId)
                    end
                    return true, nil
                else
                    canPlaceError = self:GetMissingRequirementsMessage(itemId)
                end
            end
        end
        return false, canPlaceError
    end
end

function ProducerBaseController:ProducerPlacementEffects(producerId)
    if Environment.IsClient() then
        local producerData = PRODUCER_BASES.GetProducerData(producerId)

        if producerData.PlaceEffects and producerData.PlaceEffects ~= "" then
            local params = { position = self.ComponentRoot:GetWorldPosition() + producerData.PlaceEffectsOffset }
            local effects = World.SpawnAsset(producerData.PlaceEffects, params)

            -- Ensure these don't stack up
            if effects.lifeSpan == 0 then
                effects.lifeSpan = 5
            end
        end
    end
end

function ProducerBaseController:OnReadyProducer(force)
    if force or self.RuntimeState.hasStartedBuilding then
        self.RuntimeState.hasStartedBuilding = true
        self.BuildCounter:SetValue(1)
        self.RuntimeState.isReadyForCollect = true

        self:RuntimeStateToInstance()
        REPLICATOR.ModifyInstance(self.Instance)
        self.InstanceNeedsModification = false
    end
end

function ProducerBaseController:FindProducerIdFromEquipment(toolType, equipmentSettings)
    local itemId = equipmentSettings.ItemId
    local canPlace, canPlaceError
    if itemId and DATABASE.Producers and #DATABASE.Producers ~= 0 then
        local producerData = DATABASE.Producers[itemId]
        if producerData then
            if producerData.SourceItemId and producerData.SourceItemId ~= "" then
                canPlace, canPlaceError = self:CanPlaceProducer(producerData.SourceItemId, toolType, equipmentSettings)
            else
                canPlace, canPlaceError = self:CanPlaceProducer(itemId, toolType, equipmentSettings)
            end
            if canPlace then
                return itemId
            end
        end
        for producerId, producerData in pairs(DATABASE.Producers) do
            if producerData.SourceItemId == itemId then
                canPlace, canPlaceError = self:CanPlaceProducer(producerId, toolType, equipmentSettings)
                if canPlace then
                    return producerId
                end
            end
        end
    end
    return false, canPlaceError
end

function ProducerBaseController:NewBuffProducerInteraction()
    return function(player, target, toolType, equipmentSettings, doInteract)
        local itemId = equipmentSettings.ItemId
        local canBuffError
        if self:CanBuffProducer(toolType, equipmentSettings) then
            local hasRequiredTools = true
            for buffId, buffValidToolTypes in pairs(self.BuffData.buffValidToolTypes) do
                if buffValidToolTypes[toolType] or buffValidToolTypes[itemId] then
                    if not self:HasRequiredItems(player, self.BuffData.toolsConsumedWhenAdded[buffId], equipmentSettings) then
                        hasRequiredTools = false
                        break
                    end
                end
            end

            if hasRequiredTools then
                Events.Broadcast("CanEquipmentInteract", "BuffProducer", target, toolType, equipmentSettings)

                if doInteract then
                    self:BuffProducerWithTool(player, toolType, equipmentSettings)
                end
                return true, nil
            else
                canBuffError = self:GetMissingRequirementsMessage(itemId)
            end
        end
        return false, canBuffError
    end
end

function ProducerBaseController:CanBuffProducer(toolType, equipmentSettings)
    for buffId, buffValidToolTypes in pairs(self.BuffData.buffValidToolTypes) do
        if buffValidToolTypes[toolType] or buffValidToolTypes[equipmentSettings.ItemId] then
            -- If we already have the buff, check how much of this buff we have
            if BUFFS.HasBuff(self.ComponentRoot.id) then
                local minAllowedBuffConsumption = self.BuffData.MinAllowedBuffConsumption[buffId] or 0
                local maxAmount = BUFFS.GetBuffSetting(buffId, BUFFS.Settings.MaxStacks) 
                local remainingAmount = BUFFS.GetBuffRemainingAmount(self.ComponentRoot.id, buffId)            
                if maxAmount - remainingAmount > minAllowedBuffConsumption then
                    return false
                end
            end
            return true
        end
    end
    return false
end

function ProducerBaseController:BuffProducerWithTool(player, toolType, equipmentSettings)
    for buffId, buffValidToolTypes in pairs(self.BuffData.buffValidToolTypes) do
        if buffValidToolTypes[toolType] or buffValidToolTypes[equipmentSettings.ItemId] then
            self:ConsumeTool(player, equipmentSettings, self.BuffData.toolsConsumedWhenAdded[buffId])
            BUFFS.AddBuff(self.ComponentRoot.id, buffId, function() return self:GetTime() end)
            self:SpawnEffects(self.BuffData.addBuffEffect[buffId], self.BuffData.addBuffEffectOffset[buffId] or Vector3.ZERO)

            -- Exit after applying buff
            break
        end
    end

    self:RuntimeStateToInstance()
    REPLICATOR.ModifyInstance(self.Instance)
    self.InstanceNeedsModification = false
end

function ProducerBaseController:OnBuildProducer(force, growth)
    if force then
        self:StartBuildingProducer()
        self.BuildCounter:SetValue(growth)
        self:UpdateRuntimeState()
        self:RuntimeStateToInstance()
        REPLICATOR.ModifyInstance(self.Instance)
        self.InstanceNeedsModification = false
    elseif self:HasProducer() and not self:HasStartedBuilding() then
        PRODUCER_BASES.StartBuildingProducer(self.ComponentRoot.id)
    end
end

function ProducerBaseController:NewStartBuildingProducerInteraction()
    return function(player, target, toolType, equipmentSettings, doInteract)
        local canBuildError
        if self:CanStartBuildingProducer(toolType, equipmentSettings) then
            local producerData = self.RuntimeState.producerData
            if producerData then
                local toolsConsumed = self:IsProducerRebuilding() and producerData.ToolsConsumedWhenRebuilt or producerData.ToolsConsumedWhenBuilt
                if self:HasRequiredItems(player, toolsConsumed, equipmentSettings) then
                    Events.Broadcast("CanEquipmentInteract", "BuildProducer", target, toolType, equipmentSettings)

                    if doInteract then
                        PRODUCER_BASES.StartBuildingProducer(self.ComponentRoot.id)
                        self:ConsumeTool(player, equipmentSettings, toolsConsumed)
                    end
                    return true, nil
                else
                    canBuildError = self:GetMissingRequirementsMessage(equipmentSettings.ItemId)
                end
            end
        end
        return false, canBuildError
    end
end

function ProducerBaseController:CanStartBuildingProducer(toolType, equipmentSettings)
    if self:HasProducer() and not self:HasStartedBuilding() then
        local producerData = self.RuntimeState.producerData
        if producerData then
            if self:CheckHasAllBuffs(self.BuffData.requireToStartBuildingBuffs) then
                local autoBuild = producerData.AutoBuild
                if self:IsProducerRebuilding() then
                    autoBuild = producerData.AutoRebuild
                end
                if autoBuild then
                    return true
                end
                if toolType then
                    local validBuildToolTypes = self:IsProducerRebuilding() and producerData.ValidRebuildToolTypes or producerData.ValidBuildToolTypes
                    if EQUIPMENT.IsValidToolType(validBuildToolTypes, toolType, equipmentSettings) then
                        return true
                    end
                end
            end
        end
    end
    return false
end

function ProducerBaseController:OnCollectProducer(force)
    if force == true or self:IsProducerReady() then
        self.RuntimeState.isReadyForCollect = true
        self:BeginCollectProcess()
    end
end

function ProducerBaseController:BeginCollectProcess()
    -- See if this Producer is on a Player Lot to derive an owner
    local player
    local playerLotId = PLAYER_LOTS.FindLotByAncestors(self.ComponentRoot)
    if playerLotId then
        player = PLAYER_LOTS.GetOwner(playerLotId)
    end

    PRODUCER_BASES.Collect(player, self.ComponentRoot.id)
    self.DropsNeedCollecting = true

    self:RuntimeStateToInstance()
    self.InstanceNeedsModification = true

    return true
end

function ProducerBaseController:NewCollectProducerInteraction()
    return function(player, target, toolType, equipmentSettings, doInteract)
        local canCollectError
        if self:CanCollectProducer(toolType, equipmentSettings) then
            local producerData = self.RuntimeState.producerData
            if producerData then
                local toolsConsumed = producerData.ToolsConsumedWhenCollected or 0
                if self:HasRequiredItems(player, toolsConsumed, equipmentSettings) then
                    Events.Broadcast("CanEquipmentInteract", "CollectProducer", target, toolType, equipmentSettings)
                    if doInteract then
                        PRODUCER_BASES.Collect(player, self.ComponentRoot.id)
                        self.DropsNeedCollecting = true
                        self:RuntimeStateToInstance()
                        self:ConsumeTool(player, equipmentSettings, toolsConsumed)

                        REPLICATOR.ModifyInstance(self.Instance)
                        self.InstanceNeedsModification = false
                    end
                    return true, nil
                else
                    canCollectError = self:GetMissingRequirementsMessage(equipmentSettings.ItemId)
                end
            end
        end
        return false, canCollectError
    end
end

function ProducerBaseController:CanCollectProducer(toolType, equipmentSettings)
    if self:HasProducer() and self:IsProducerReady() then
        if EQUIPMENT.IsValidToolType(self.RuntimeState.producerData.ValidCollectToolTypes, toolType, equipmentSettings) then
            return true
        end
    end
    return false
end

function ProducerBaseController:OnExpireProducer(force)
    if force or self:CanExpire() then
        self.ExpireCounter:SetValue(1)
        self.RuntimeState.hasExpired = true

        self:RuntimeStateToInstance()
        REPLICATOR.ModifyInstance(self.Instance)
        self.InstanceNeedsModification = false
    end
end

function ProducerBaseController:OnRemoveProducer(player)
    self:RemoveProducerByPlayer(player)
end

function ProducerBaseController:RemoveProducerByPlayer(player)
    if player and Object.IsValid(player) then
        -- Give any drops we might have
        PRODUCER_BASES.HandleProducerDrops(player, self.ComponentRoot.id, true)
    end

    -- Remove the producer
    PRODUCER_BASES.RemoveProducer(self.ComponentRoot.id)
end

function ProducerBaseController:NewRemoveProducerInteraction()
    return function(player, target, toolType, equipmentSettings, doInteract)
        local canRemoveError
        if self:CanRemoveProducer(toolType, equipmentSettings) then
            local producerData = self.RuntimeState.producerData
            if producerData then
                local toolsConsumed = producerData.ToolsConsumedWhenDestroyed or 0
                if self:HasRequiredItems(player, toolsConsumed, equipmentSettings) then
                    Events.Broadcast("CanEquipmentInteract", "RemoveProducer", target, toolType, equipmentSettings)
                    if doInteract then
                        self:RemoveProducerByPlayer(player)
                        self:ConsumeTool(player, equipmentSettings, toolsConsumed)
                    end
                    return true, nil
                else
                    canRemoveError = self:GetMissingRequirementsMessage(equipmentSettings.ItemId)
                end
            end
        end
        return false, canRemoveError
    end
end

function ProducerBaseController:CanRemoveProducer(toolType, equipmentSettings)
    if self:HasProducer() then
        local placeableData = self.PlaceableData
        if placeableData.AllowProducerRemoval == false then
            return false
        end
        local producerData = self.RuntimeState.producerData
        if EQUIPMENT.IsValidToolType(producerData.ValidDestroyToolTypes, toolType, equipmentSettings) then
            return true
        end
    end
    return false
end

function ProducerBaseController:NewProducerInteractionError()
    return function(player, target, toolType, equipmentSettings, doInteract)
        -- Find an appropriate error message
        local errorMessage
        if doInteract then
            if self:HasProducer() then
                local function GetBuffInteractionText(producerData, buffs)
                    local placeableData = self.PlaceableData
                    for buffId, _ in pairs(buffs) do
                        if not BUFFS.HasBuff(self.PlaceableId, buffId) then
                            local data
                            if producerData and producerData.InputBuffs and producerData.InputBuffs[buffId] then
                                data = producerData.InputBuffs[buffId]
                            elseif placeableData and placeableData.InputBuffs and placeableData.InputBuffs[buffId] then
                                data = placeableData.InputBuffs[buffId]
                            end

                            if data and data.InteractionText and data.InteractionText ~= "" then
                                return data.InteractionText
                            end
                        end
                    end
                    return nil
                end

                local producerData = self.RuntimeState.producerData
                if self.RuntimeState.isReadyForCollect and producerData.CollectInteractionText and producerData.CollectInteractionText ~= "" then
                    errorMessage = producerData.CollectInteractionText
                elseif not self:HasStartedBuilding() then
                    if producerData.BuildInteractionText and producerData.BuildInteractionText ~= "" then
                        errorMessage = producerData.BuildInteractionText
                    elseif not self:CheckHasAllBuffs(self.BuffData.requireToStartBuildingBuffs) then
                        errorMessage = GetBuffInteractionText(producerData, self.BuffData.requireToStartBuildingBuffs)
                    elseif not self:IsProducerRebuilding() and not self:CheckHasAllBuffs(self.BuffData.requireWhileBuildingBuffs) then
                        errorMessage = GetBuffInteractionText(producerData, self.BuffData.requireWhileBuildingBuffs)
                    elseif self:IsProducerRebuilding() and not self:CheckHasAllBuffs(self.BuffData.requireWhileRebuildingBuffs) then
                        errorMessage = GetBuffInteractionText(producerData, self.BuffData.requireWhileRebuildingBuffs)
                    elseif producerData.DestroyInteractionText and producerData.DestroyInteractionText ~= "" then
                        errorMessage = producerData.DestroyInteractionText
                    end
                end
            else
                local placeableData = self.PlaceableData
                if placeableData and placeableData.AddProducerText and placeableData.AddProducerText ~= "" then
                    errorMessage = placeableData.AddProducerText
                end
            end
        end
        return false, errorMessage
    end
end

function ProducerBaseController:PlaceProducer(producerId)
    self:UpdateRuntimeState()
    self:SetProducerId(producerId)
    self:UpdateBuffData()
    self:UpdateLinkedBuffs()
    self:UpdateProducerTemplateData()
    self:HandleAutoBuild()
    self:RuntimeStateToInstance()

    REPLICATOR.ModifyInstance(self.Instance)
    self.InstanceNeedsModification = false

    self:UpdateProducerTemplates()
end

function ProducerBaseController:StartBuildingProducer()
    self:UpdateRuntimeState()

    self.RuntimeState.hasStartedBuilding = true

    self:UpdateBuildRate()
    self:UpdateExpireRate()
    self:UpdateProducerTemplates()
    self:UpdateLinkedBuffs()
    self:RuntimeStateToInstance()

    REPLICATOR.ModifyInstance(self.Instance)
    self.InstanceNeedsModification = false

    Events.Broadcast(PRODUCER_BASES.Events.ProducerStartedBuilding, self.ComponentRoot.id, self.RuntimeState.placeableId, self.RuntimeState.producerId)
end

function ProducerBaseController:Collect()
    self:UpdateRuntimeState()

    local producerData = self.RuntimeState.producerData
    if self:HasProducerExpired() then
        self:SetProducerId(nil)

        self.RuntimeState.numCollects = 0
        self.RuntimeState.isRebuilding = false
    else
        if self:IsMultipleCollects() and (producerData.NumberOfCollects == 0 or self.RuntimeState.numCollects + 1 < producerData.NumberOfCollects) then
            self.RuntimeState.numCollects = self.RuntimeState.numCollects + 1
            self.RuntimeState.isRebuilding = true
        else
            if producerData.ReplaceProducerOnFinalCollect then
                local nextProducers = SplitStringByCommas(producerData.ReplacementProducerId)
                local i = math.random(#nextProducers)
                local nextProducer = nextProducers[i]

                self:SetProducerId(nextProducer)

                self.RuntimeState.numCollects = 0
                self.RuntimeState.isRebuilding = false
            else
                self:SetProducerId(nil)

                self.RuntimeState.numCollects = 0
                self.RuntimeState.isRebuilding = false
            end
        end
    end

    self.BuildCounter:SetValue(0)
    self.BuildCounter:SetRateOfChange(0)
    self.ExpireCounter:SetValue(0)
    self.ExpireCounter:SetRateOfChange(0)

    self.RuntimeState.buildAmount = 0
    self.RuntimeState.expireAmount = 0
    self.RuntimeState.hasExpired = false
    self.RuntimeState.isReadyForCollect = false
    self.RuntimeState.hasStartedBuilding = false

    self:RemoveBuffsOnCollect()

    if self:CanStartBuildingProducer() then
        self.RuntimeState.hasStartedBuilding = true
    end

    self:UpdateBuffData()
    self:UpdateLinkedBuffs()
    self:UpdateProducerTemplateData()
    self:UpdateProducerTemplates()
    self:UpdateBuildRate()
    self:UpdateExpireRate()

    self.InstanceNeedsEncoding = true

    Events.Broadcast(PRODUCER_BASES.Events.ProducerCollected, self.ComponentRoot.id, self.RuntimeState.placeableId, self.RuntimeState.producerId)
end

function ProducerBaseController:RemoveProducer()
    self:RemoveProducerVfx()
    self:UpdateRuntimeState()

    self.ExpireCounter:SetValue(0)
    self.ExpireCounter:SetRateOfChange(0)
    self.BuildCounter:SetValue(0)
    self.BuildCounter:SetRateOfChange(0)

    local oldProducerId = self.RuntimeState.producerId

    self:SetProducerId(nil)

    self.RuntimeState.numCollects = 0
    self.RuntimeState.buildAmount = 0
    self.RuntimeState.expireAmount = 0
    self.RuntimeState.hasExpired = false
    self.RuntimeState.isReadyForCollect = false
    self.RuntimeState.hasStartedBuilding = false
    self.RuntimeState.isRebuilding = false

    self:RemoveBuffsOnRemoveProducer()
    self:RuntimeStateToInstance()

    REPLICATOR.ModifyInstance(self.Instance)
    self.InstanceNeedsModification = false

    self:UpdateBuffData()
    self:UpdateLinkedBuffs()
    self:UpdateProducerTemplateData()
    self:UpdateProducerTemplates()

    Events.Broadcast(PRODUCER_BASES.Events.ProducerRemoved, self.ComponentRoot.id, self.RuntimeState.placeableId, oldProducerId)
end

--- Buffs ---

---Override to include producer specific buff data
function ProducerBaseController:InitializeBuffData()
    return {
        receiveableBuffs = {},
        resetsExpiryBuffs = {},
        requireToAllowExpiringBuffs = {},
        requireToStartBuildingBuffs = {},
        requireWhileBuildingBuffs = {},
        requireWhileRebuildingBuffs = {},
        proximityBuffsWhileEmpty = {},
        proximityBuffsWhilePlaced = {},
        proximityBuffsWhileBuilding = {},
        proximityBuffsWhileReady = {},
        proximityBuffsWhileExpired = {},
        buffBuildRateAddMultipliers = {},
        buffExpireRateAddMultipliers = {},
        buffValidToolTypes = {},
        toolsConsumedWhenAdded = {},
        proximityBuffs = {},
        proximityBuffsRadius = {},
        proximityBuffsAddAmount = {},
        overrideBuffDurations = {},
        proximityBuffsRequired = {},
        drainWhileEmpty = {},
        drainWhilePlaced = {},
        drainWhileBuilding = {},
        drainWhileReady = {},
        drainWhileExpired = {},
        drainWhileRebuilding = {},
        removeOnCollect = {},
        removeOnProducerRemoved = {},
        addBuffEffect = {},
        addBuffEffectOffset = {},
        minAllowedBuffConsumption = {}
    }
end

---Override to include producer specific buff data
function ProducerBaseController:ProcessBuffData(buffs)
    if buffs == nil then
        return
    end

    for buffId, data in pairs(buffs) do
        if data.Radius and data.Radius > 0 then
            self.BuffData.proximityBuffsRadius[buffId] = data.Radius
            self.BuffData.proximityBuffsAddAmount[buffId] = data.AddAmount

            if data.Radius then
                self.BuffData.proximityBuffs[buffId] = true
            end
        end
        if data.CanReceive then
            self.BuffData.receiveableBuffs[buffId] = true
        end
        if data.ResetsExpiry then
            self.BuffData.resetsExpiryBuffs[buffId] = true
        end
        if data.RequireToAllowExpiring or data.RequiredToAllowExpiring then
            self.BuffData.requireToAllowExpiringBuffs[buffId] = true
        end
        if data.RequireToStartBuilding then
            self.BuffData.requireToStartBuildingBuffs[buffId] = true
        end
        if data.RequireWhileBuilding then
            self.BuffData.requireWhileBuildingBuffs[buffId] = true
        end
        if data.RequireWhileRebuilding then
            self.BuffData.requireWhileRebuildingBuffs[buffId] = true
        end
        if data.ActiveWhileEmpty then
            self.BuffData.proximityBuffsWhileEmpty[buffId] = true
        end
        if data.ActiveWhilePlaced then
            self.BuffData.proximityBuffsWhilePlaced[buffId] = true
        end
        if data.ActiveWhileBuilding then
            self.BuffData.proximityBuffsWhileBuilding[buffId] = true
        end
        if data.ActiveWhileReady then
            self.BuffData.proximityBuffsWhileReady[buffId] = true
        end
        if data.ActiveWhileExpired then
            self.BuffData.proximityBuffsWhileExpired[buffId] = true
        end
        if data.AffectsBuildRate then
            self.BuffData.buffBuildRateAddMultipliers[buffId] = data.BuildRateMultiplierPercent / 100 or 0
        end
        if data.AffectsExpireRate then
            self.BuffData.buffExpireRateAddMultipliers[buffId] = data.ExpireRateMultiplierPercent / -100 or 0
        end
        if data.OverrideBuffDuration then
            self.BuffData.overrideBuffDurations[buffId] = data.BuffDuration
        end
        if data.DrainWhileEmpty then
            self.BuffData.drainWhileEmpty[buffId] = true
        end
        if data.DrainWhilePlaced then
            self.BuffData.drainWhilePlaced[buffId] = true
        end
        if data.DrainWhileBuilding then
            self.BuffData.drainWhileBuilding[buffId] = true
        end
        if data.DrainWhileReady then
            self.BuffData.drainWhileReady[buffId] = true
        end
        if data.DrainWhileRebuilding then
            self.BuffData.drainWhileRebuilding[buffId] = true
        end
        if data.DrainWhileExpired then
            self.BuffData.drainWhileExpired[buffId] = true
        end
        if data.RemoveOnCollect then
            self.BuffData.removeOnCollect[buffId] = true
        end
        if data.RemoveOnProducerRemoved then
            self.BuffData.removeOnProducerRemoved[buffId] = true
        end
        if data.ValidAddBuffToolTypes then
            local toolTypes = self.BuffData.buffValidToolTypes[buffId] or {}
            self.BuffData.toolsConsumedWhenAdded[buffId] = data.ToolsConsumedWhenAdded or 0
            self.BuffData.buffValidToolTypes[buffId] = toolTypes
            for _, toolType in pairs(TAGS.SplitTagsString(data.ValidAddBuffToolTypes)) do
                toolTypes[toolType] = true
            end
        end
        if data.RequiredBuffs then
            if data.RequiredBuffs ~= "" then
                local proximityBuffs = self.BuffData.proximityBuffsRequired[buffId] or {}
                self.BuffData.proximityBuffsRequired[buffId] = proximityBuffs
                for _, proximityBuffId in pairs(TAGS.SplitTagsString(data.RequiredBuffs)) do
                    proximityBuffs[proximityBuffId] = true
                end
            end
        end
        if data.AddBuffEffect then
            self.BuffData.addBuffEffect[buffId] = data.AddBuffEffect
            self.BuffData.addBuffEffectOffset[buffId]  = data.AddBuffEffectOffset
        end
        if data.MinAllowedBuffConsumption then
            self.BuffData.minAllowedBuffConsumption[buffId] = data.MinAllowedBuffConsumption
        end
    end
end

function ProducerBaseController:UpdateBuffData()
    self:ClearBuffData()

    if self.PlaceableData then
        self:ProcessBuffData(self.PlaceableData.InputBuffs)
        self:ProcessBuffData(self.PlaceableData.OutputBuffs)
    end

    if self.RuntimeState.producerData then
        self:ProcessBuffData(self.RuntimeState.producerData.InputBuffs)
        self:ProcessBuffData(self.RuntimeState.producerData.OutputBuffs)
    end

    BUFFS.ClearTargetRecieveBuffs(self.ComponentRoot.id)

    for buffId in pairs(self.BuffData.receiveableBuffs) do
        BUFFS.AddTargetRecieveBuff(self.ComponentRoot.id,buffId)
    end
end

function ProducerBaseController:UpdateBuffRates()
    local activeBuffs = BUFFS.GetBuffs(self.ComponentRoot.id)
    local hasProducer = self:HasProducer()
    local isReady = self:IsProducerReady()
    local isRebuilding = self:IsProducerRebuilding()
    local hasStartedBuilding = self:HasStartedBuilding()
    local hasExpired = self:HasProducerExpired()
    local drainBuffs = {}

    if not hasProducer then
        drainBuffs = self.BuffData.drainWhileEmpty
    elseif hasExpired then
        drainBuffs = self.BuffData.drainWhileExpired
    elseif isReady then
        drainBuffs = self.BuffData.drainWhileReady
    elseif not hasStartedBuilding then
        drainBuffs = self.BuffData.drainWhilePlaced
    elseif isRebuilding then
        drainBuffs = self.BuffData.drainWhileRebuilding
    else
        drainBuffs = self.BuffData.drainWhileBuilding
    end

    for _, buffId in ipairs(activeBuffs) do
        local rate = 0
        if drainBuffs[buffId] then
            rate = -1
        end

        BUFFS.SetBuffRate(self.ComponentRoot.id, buffId, rate)
    end
end

function ProducerBaseController:DoProximityBuffs()
    if self.Instance.isDestroyed then
        return
    end

    local proximityBuffs = {}
    if self:HasProducer() then
        local isReady = self:IsProducerReady()
        local hasStartedBuilding = self:HasStartedBuilding()
        local hasExpired = self:HasProducerExpired()

        if not hasStartedBuilding then
            proximityBuffs = self.BuffData.proximityBuffsWhilePlaced
        elseif hasExpired then
            proximityBuffs = self.BuffData.proximityBuffsWhileExpired
        elseif isReady then
            proximityBuffs = self.BuffData.proximityBuffsWhileReady
        else
            proximityBuffs = self.BuffData.proximityBuffsWhileBuilding
        end
    else
        proximityBuffs = self.BuffData.proximityBuffsWhileEmpty
    end

    -- Add placeable proximity buffs
    for buffId in pairs(self.BuffData.proximityBuffs) do
        proximityBuffs[buffId] = true
    end

    -- Add any new buffs
    local sourcePosition = BUFFS.GetTargetPosition(self.ComponentRoot.id)
    for buffId in pairs(proximityBuffs) do
        if self.ActiveProximityBuffs[buffId] then
            -- This proximity buff is already active
        else
            local radius = self.BuffData.proximityBuffsRadius[buffId]
            local requiredBuffs = self.BuffData.proximityBuffsRequired[buffId]
            if requiredBuffs == nil or self:CheckHasAllBuffs(requiredBuffs) then
                self.ActiveProximityBuffs[buffId] = true
                local amount = self.BuffData.proximityBuffsAddAmount[buffId]
                BUFFS.AddBuffsInRadius( self.ComponentRoot.id, sourcePosition, radius, buffId, function() return self:GetTime() end, nil, { amount = amount })
            end
        end
    end
end

function ProducerBaseController:RemoveBuffsOnCollect()
    local buffs = BUFFS.GetBuffs(self.ComponentRoot.id)
    for _, buffId in pairs(buffs) do
        if self.BuffData.removeOnCollect[buffId] then
            BUFFS.RemoveBuff(self.ComponentRoot.id, buffId)
        end
    end
end

function ProducerBaseController:RemoveBuffsOnRemoveProducer()
    local buffs = BUFFS.GetBuffs(self.ComponentRoot.id)
    for _, buffId in pairs(buffs) do
        if self.BuffData.removeOnProducerRemoved[buffId] then
            BUFFS.RemoveBuff(self.ComponentRoot.id, buffId)
        end
    end
end

function ProducerBaseController:OnBuffAdded(buffId)
    BUFFS.SetBuffTimeFunction(self.ComponentRoot.id, buffId, function() return self:GetTime() end)

    local overrideDuration = self.BuffData.overrideBuffDurations[buffId]
    if overrideDuration then
        BUFFS.SetBuffDuration(self.ComponentRoot.id, buffId, overrideDuration)
    end

    self:HandleAutoBuild()
    self:UpdateBuildRate()
    self:UpdateExpireRate()

    self.InstanceNeedsEncoding = true
end

function ProducerBaseController:OnBuffRemoved(buffId)
    self:HandleAutoBuild()
    self:UpdateBuildRate()
    self:UpdateExpireRate()

    self.InstanceNeedsEncoding = true
end

function ProducerBaseController:OnBuffRelinked(buffId)
    self:HandleAutoBuild()
    self:UpdateBuildRate()
    self:DoProximityBuffs()

    self.InstanceNeedsEncoding = true
end

--- Producers ---

function ProducerBaseController:SetProducerId(producerId)
    local oldProducerId = self.RuntimeState.producerId
    self.RuntimeState.producerId = producerId
    self.RuntimeState.producerData = PRODUCER_BASES.GetProducerData(self.RuntimeState.producerId)

    if oldProducerId ~= producerId then
        Events.Broadcast(PRODUCER_BASES.Events.ProducerPlaced, self.ComponentRoot.id, self.RuntimeState.placeableId, producerId)
    end
end

function ProducerBaseController:HasProducer()
    return self.RuntimeState.producerId ~= nil
end

function ProducerBaseController:IsProducerReady()
    return self.RuntimeState.isReadyForCollect
end

function ProducerBaseController:IsProducerRebuilding()
    return self.RuntimeState.isRebuilding
end

function ProducerBaseController:HasStartedBuilding()
    return self.RuntimeState.hasStartedBuilding
end

function ProducerBaseController:HasProducerExpired()
    return self.RuntimeState.hasExpired
end

function ProducerBaseController:CanKeepBuildingProducer()
    if self.RuntimeState.producerData then
        if self:IsProducerRebuilding() then
            return self:CheckHasAllBuffs(self.BuffData.requireWhileRebuildingBuffs)
        else
            return self:CheckHasAllBuffs(self.BuffData.requireWhileBuildingBuffs)
        end
    end
    return false
end

function ProducerBaseController:IsMultipleCollects()
    local producerData = self.RuntimeState.producerData
    if producerData then
        return producerData.NumberOfCollects and (producerData.NumberOfCollects == 0 or producerData.NumberOfCollects > 1)
    end
    return false
end

function ProducerBaseController:UpdateBuildRate()
    local buildRate = 0
    if self.RuntimeState.hasStartedBuilding then
        if self:CanKeepBuildingProducer() then
            local buildSeconds = self.RuntimeState.producerData.BuildSeconds
            if self.RuntimeState.isRebuilding then
                buildSeconds = self.RuntimeState.producerData.RebuildSeconds
            end

            -- Avoid dividing by 0
            buildSeconds = math.max(buildSeconds, 0.001)

            local attribute = Attribute.New(self.PlaceableData.BuildRate / buildSeconds)
            for _, buffId in pairs(BUFFS.GetBuffs(self.ComponentRoot.id)) do
                local multiplier = self.BuffData.buffBuildRateAddMultipliers[buffId]
                if multiplier then
                    attribute:IncreaseMultiplier(multiplier)
                end
            end
            buildRate = attribute:GetTotal()
        end
    end

    self.BuildCounter:SetRateOfChange(buildRate)
end

function ProducerBaseController:CanExpire()
    if not self:HasProducer() then
        return false
    end

    local producerData = self.RuntimeState.producerData
    if producerData == nil or self.PlaceableData.AllowExpiry == false then
        return false
    end

    local canExpire = false
    if self:IsProducerReady() and producerData.CanExpireInReadyState then
        canExpire = true
    elseif not self:HasStartedBuilding() and producerData.CanExpireInPlacedState then
        canExpire = true
    elseif producerData.CanExpireInBuldingState then
        canExpire = true
    end
    if canExpire == false then
        return false
    end

    local buffs = self.BuffData.requireToAllowExpiringBuffs
    return self:CheckHasAnyBuffs(buffs) or self:IsTableEmpty(buffs)
end

function ProducerBaseController:UpdateExpireRate()
    local expireRate = 0
    if self:CanExpire() then
        local producerData = self.RuntimeState.producerData
        local attribute = Attribute.New(self.PlaceableData.ExpireRate / math.max(producerData.ExpireSeconds, 1))

        -- Apply buffs
        for _, buffId in pairs(BUFFS.GetBuffs(self.ComponentRoot.id)) do
            local multiplier = self.BuffData.buffExpireRateAddMultipliers[buffId]
            if multiplier then
                attribute:IncreaseMultiplier(multiplier)
            end
        end
        expireRate = attribute:GetTotal()
    end

    self.ExpireCounter:SetRateOfChange(expireRate)
end

function ProducerBaseController:RemoveProducerVfx()
    if Environment.IsClient() then
        local producerData = self.RuntimeState.producerData
        if producerData.RemoveEffects and producerData.RemoveEffects ~= "" then
            local params = { position = self.ComponentRoot:GetWorldPosition() + producerData.RemoveEffectsOffset }
            local effects = World.SpawnAsset(producerData.RemoveEffects, params)

            -- Ensure these don't stack up
            if effects.lifeSpan == 0 then
                effects.lifeSpan = 5
            end
        end
    end
end

function ProducerBaseController:HandleAutoCollect()
    if self:IsProducerReady() and self.RuntimeState.producerData.AutoCollect then
        if Environment.IsServer() then
            self:Collect()
            return
        end

        return self:BeginCollectProcess()
    end
    return false
end

function ProducerBaseController:HandleAutoBuild()
    if self.RuntimeState.producerData == nil then return false end

    if self:CanStartBuildingProducer() then
        self.RuntimeState.hasStartedBuilding = true

        self:UpdateBuildRate()
        self:UpdateExpireRate()
        self:UpdateBuffRates()
        self:UpdateLinkedBuffs()

        self.InstanceNeedsEncoding = true

        Events.Broadcast(PRODUCER_BASES.Events.ProducerStartedBuilding, self.ComponentRoot.id, self.RuntimeState.placeableId, self.RuntimeState.producerId)
        return true
    end
    return false
end

---Updates the lua table of all the template references for the producer
function ProducerBaseController:UpdateProducerTemplateData()
    self.ProducerTemplateData.placed = {}
    self.ProducerTemplateData.building = {}
    self.ProducerTemplateData.ready = {}
    self.ProducerTemplateData.expired = {}
    self.ProducerTemplateData.rebuilding = {}

    if self.RuntimeState.producerData then
        local producerData = self.RuntimeState.producerData

        self.ProducerTemplateData.placed.client =  producerData.PlacedState_Client
        self.ProducerTemplateData.placed.server =  producerData.PlacedState_Server
        self.ProducerTemplateData.placed.static =  producerData.PlacedState_Static
        self.ProducerTemplateData.ready.client = producerData.ReadyState_Client
        self.ProducerTemplateData.ready.server = producerData.ReadyState_Server
        self.ProducerTemplateData.ready.static = producerData.ReadyState_Static
        self.ProducerTemplateData.expired.client = producerData.ExpiredState_Client
        self.ProducerTemplateData.expired.server = producerData.ExpiredState_Server
        self.ProducerTemplateData.expired.static = producerData.ExpiredState_Static

        -- Load building states
        for stateNum = 1, 32 do
            local stateClient = producerData["State" .. tostring(stateNum) .. "_Client"]
            local stateServer = producerData["State" .. tostring(stateNum) .. "_Server"]
            local stateStatic = producerData["State" .. tostring(stateNum) .. "_Static"]

            if (stateClient and stateClient ~= "") or (stateServer and stateServer ~= "") or (stateStatic and stateStatic ~= "") then
                local state = {}
                state.client = stateClient
                state.server = stateServer
                state.static = stateStatic
                self.ProducerTemplateData.building[stateNum] = state
            else
                break
            end
        end

        -- Hack so when auto collect is enabled we 'see' the ready state
        if producerData.AutoCollect then
            self.ProducerTemplateData.building[#self.ProducerTemplateData.building + 1] = {
                client = producerData.ReadyState_Client,
                server = producerData.ReadyState_Server,
                static = producerData.ReadyState_Static
            }
        end

        -- Load rebuilding states
        for stateNum = 1, 32 do
            local stateClient = producerData["RebuildingState" .. tostring(stateNum) .. "_Client"]
            local stateServer = producerData["RebuildingState" .. tostring(stateNum) .. "_Server"]
            local stateStatic = producerData["RebuildingState" .. tostring(stateNum) .. "_Static"]

            if (stateClient and stateClient ~= "") or (stateServer and stateServer ~= "") or (stateStatic and stateStatic ~= "") then
                local state = {}
                state.client = stateClient
                state.server = stateServer
                state.static = stateStatic
                self.ProducerTemplateData.rebuilding[stateNum] = state
            else
                break
            end
        end
    end
end

---Finds the template asset for the current state of the producer
---@return string, string
function ProducerBaseController:GetProducerTemplates()
    if not self:HasProducer() then
        return
    end

    local isReady = self:IsProducerReady()
    local isRebuilding = self:IsProducerRebuilding()
    local hasStartedBuilding = self:HasStartedBuilding()
    local hasExpired = self:HasProducerExpired()
    local state = nil

    -- Get the appropriate state
    if hasExpired then
        state = self.ProducerTemplateData.expired
    elseif hasStartedBuilding == false and not isRebuilding then
        state = self.ProducerTemplateData.placed
    elseif isReady then
        state = self.ProducerTemplateData.ready
    else
        local buildAmount = self.RuntimeState.buildAmount
        local states = self.ProducerTemplateData.building
        local numStates = #self.ProducerTemplateData.building
        if isRebuilding then
            states = self.ProducerTemplateData.rebuilding
            numStates = #self.ProducerTemplateData.rebuilding
        end
        if numStates > 0 then
            local stateIndex = math.floor(buildAmount * numStates) + 1
            stateIndex = CoreMath.Clamp(stateIndex, 1, numStates)
            state = states[stateIndex]
        end
    end

    if state then
        return state.client, state.server, state.static
    end
end

--- Destroys and spawns a new template if the template is different to whats been spawne
--- @return boolean --did a spawn happen?
function ProducerBaseController:UpdateProducerTemplates()
    local spawnHappened = false
    local clientTemplate, serverTemplate, staticTemplate = self:GetProducerTemplates()

    -- Update the client and templates... nice and simple
    if Environment.IsClient() then
        if clientTemplate ~= self.ProducerClientTemplate then
            self.ProducerClientTemplate = clientTemplate
            if Object.IsValid(self.ProducerClientCoreObject) then
                self.ProducerClientCoreObject:Destroy()
            end
            self.ProducerClientCoreObject = nil
            if self.ProducerClientTemplate and self.ProducerClientTemplate ~= "" then
                local params = { parent = self.ProducerGroup }
                self.ProducerClientCoreObject = World.SpawnAsset(self.ProducerClientTemplate, params)
                spawnHappened = true
            end
        end
    elseif Environment.IsServer() then
        if serverTemplate ~= self.ProducerServerTemplate then
            self.ProducerServerTemplate = serverTemplate
            if Object.IsValid(self.ProducerServerCoreObject) then
                self.ProducerServerCoreObject:Destroy()
            end
            self.ProducerServerCoreObject = nil
            if self.ProducerServerTemplate and self.ProducerServerTemplate ~= "" then
                local params = { parent = self.ProducerGroup }
                self.ProducerServerCoreObject = World.SpawnAsset(self.ProducerServerTemplate, params)
                spawnHappened = true
            end
        end
    end

    -- The code for static is a bit different because the static core object version of the instance might not exist yet

    -- First of all, detect if the static object was destroyed and we werent aware of it
    if self.ProducerStaticCoreObject and not Object.IsValid(self.ProducerStaticCoreObject) then
        self.ProducerStaticCoreObject = nil
        self.ProducerStaticTemplate = nil
    end

    -- Now check if the template is different
    if staticTemplate ~= self.ProducerStaticTemplate then
        if Object.IsValid(self.ProducerStaticCoreObject) then
            self.ProducerStaticCoreObject:Destroy()
        end
        self.ProducerStaticCoreObject = nil
        if staticTemplate and staticTemplate ~= "" then
            local staticObject = REPLICATOR.GetStaticCoreObject(self.Instance)
            if Object.IsValid(staticObject) then
                local staticProducerGroup = staticObject:GetCustomProperty("ProducerGroup")
                if staticProducerGroup then
                    staticProducerGroup = staticProducerGroup:WaitForObject()
                end
                if staticProducerGroup == nil then
                    staticProducerGroup = staticObject
                end
                self.ProducerStaticTemplate = staticTemplate
                local params = {
                    parent = staticProducerGroup,
                    networkContext = NetworkContextType.STATIC_CONTEXT
                }
                self.ProducerStaticCoreObject = World.SpawnAsset(self.ProducerStaticTemplate, params)
                spawnHappened = true
            end
        else
            self.ProducerStaticTemplate = staticTemplate
        end
    end

    return spawnHappened
end

function ProducerBaseController:GetDropResults(player)
    local dropResults = self.GlobalDropResults
    if Object.IsValid(player) then
        self.PlayerDropResults[player] = self.PlayerDropResults[player] or {}
        dropResults = self.PlayerDropResults[player]
    end
    return dropResults
end

function ProducerBaseController:DestroyProducerPreview()
    Task.Wait(0.1)

    if Object.IsValid(self.ProducerPreview) then
        self.ProducerPreview:Destroy()
    end

    self.ProducerPreview = nil
    self.ProducerPreviewTemplate = nil
end

function ProducerBaseController:ShowProducerPreview(producerId)
    if Environment.IsServer() then return end

    local producerData = PRODUCER_BASES.GetProducerData(producerId)
    if producerData then
        local template = producerData.PlacementPreview
        if template ~= "" and template ~= self.ProducerPreviewTemplate then
            if Object.IsValid(self.ProducerPreview) then
                self.ProducerPreview:Destroy()
            end

            self.ProducerPreview = nil
            self.ProducerPreviewTemplate = template

            if template then
                local params = { parent = self.ProducerGroup }
                self.ProducerPreview = World.SpawnAsset(template, params)
                if producerData.HologramMaterial and producerData.HologramMaterial ~= "" then
                    self:ApplyMaterial(self.ProducerPreview:FindDescendantsByType("StaticMesh"), producerData.HologramMaterial, producerData.PlacementColor)
                    self:ApplyMaterial(self.ProducerPreview:FindDescendantsByType("AnimatedMesh"), producerData.HologramMaterial, producerData.PlacementColor)
                end
            end
        end

        if self.ProducerPreviewTask then
            self.ProducerPreviewTask:Cancel()
        end

        self.ProducerPreviewTask = Task.Spawn(function() self:DestroyProducerPreview() end)
    end
end

function ProducerBaseController:ApplyMaterial(meshes, material, color)
    for _, mesh in pairs(meshes) do
        for _, materialSlot in pairs(mesh:GetMaterialSlots()) do
            if materialSlot.slotName then
                mesh:SetMaterialForSlot(material, materialSlot.slotName)
                mesh:SetColor(color)
            end
        end
    end
end

--- Time ---

function ProducerBaseController:GetNextTime(prevTime)
    -- Exit early if there is nothing to update
    if not self:HasProducer() or self.RuntimeState.hasExpired or (self.RuntimeState.isReadyForCollect and not self.RuntimeState.producerData.AutoCollect and not self.RuntimeState.producerData.CanExpire) then
        return prevTime
    end

    local minRemainingTime = nil
    for _, buffId in ipairs(BUFFS.GetBuffs(self.ComponentRoot.id)) do
        local buffRemainingTime = self:nil_zero_or_less(BUFFS.GetBuffRemainingTime(self.ComponentRoot.id, buffId, prevTime))
        minRemainingTime = self:safe_min(buffRemainingTime, minRemainingTime)
    end

    local remainingBuildTime = self:nil_zero_or_less(self.BuildCounter:GetRemainingTimeToMax(prevTime))
    local remainingExpireTime = self:nil_zero_or_less(self.ExpireCounter:GetRemainingTimeToMax(prevTime))

    minRemainingTime = self:safe_min(remainingBuildTime, minRemainingTime)
    minRemainingTime = self:safe_min(remainingExpireTime, minRemainingTime)

    if minRemainingTime then
        return minRemainingTime + prevTime
    end
end

function ProducerBaseController:OnStepTime(currentTime)
    -- If the step time was in the past, do nothing
    if currentTime < self.RuntimeState.time then
        return
    end

    self.RuntimeState.time = currentTime

    self:UpdateRuntimeState()
    self:HandleAutoCollect()

    BUFFS.HandleFinishedTimedBuffs(self.ComponentRoot.id)
end

function ProducerBaseController:OnStepTimeEnd()
    if self.DropsNeedCollecting then
        self.DropsNeedCollecting = false
        for player, dropResults in pairs(self.PlayerDropResults) do
            if Object.IsValid(player) then
                PRODUCER_BASES.CollectDropResults(player, self.ComponentRoot.id, dropResults)
            end
            -- remove it from the table
            self.PlayerDropResults[player] = nil
        end
        -- not sure how to handle drops when theres no player, check with brad
    end

    if self:UpdateProducerTemplates() then
        Task.Wait()
    end

    if not Object.IsValid(self.ComponentRoot) then return end

    if not self.HasCaughtUp then
        self.HasCaughtUp = true
        self.RuntimeState.time = REALTIME.GetRealTime()

        self:RuntimeStateToInstance()
        self.InstanceNeedsModification = true
    end

    if self.InstanceNeedsModification then
        REPLICATOR.ModifyInstance(self.Instance)
        self.InstanceNeedsModification = false
    end

    if Environment.IsServer() then
        if self.InstanceNeedsEncoding then
            self.InstanceNeedsEncoding = false
            self:RuntimeStateToInstance()
        end
    end
end

function SplitStringByCommas(s)
    local results = {}
    for _, subString in pairs( { CoreString.Split(s, ",", { removeEmptyResults = true }) }) do
        table.insert(results, CoreString.Trim(subString))
    end
    return results
end

local controller = ProducerBaseController:New(COMPONENT_ROOT)
controller:Initialize()