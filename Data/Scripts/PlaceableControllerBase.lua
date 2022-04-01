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
    This is the base class for any Placeable object controller type.
--]]

-- Required APIs
---@type APIClass
local CLASS = require(script:GetCustomProperty("APIClass"))
---@type APIPlaceables
local PLACEABLES = require(script:GetCustomProperty("APIPlaceables"))
---@type APIReplicator
local REPLICATOR = require(script:GetCustomProperty("APIReplicator"))
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APIRealTime
local REALTIME = require(script:GetCustomProperty("APIRealTime"))
---@type APIEquipment
local EQUIPMENT = require(script:GetCustomProperty("APIEquipment"))
---@type APIBuffs
local BUFFS = require(script:GetCustomProperty("APIBuffs"))
---@type APITimeSimulator
local TIME_SIMULATOR = require(script:GetCustomProperty("APITimeSimulator"))
---@type APITags
local TAGS = require(script:GetCustomProperty("APITags"))
---@type APISerializer
local SERIALIZER = require(script:GetCustomProperty("APISerializer"))
---@type APIInventory
local INVENTORY = require(script:GetCustomProperty("APIInventory"))
---@type APICurrency
local CURRENCY = require(script:GetCustomProperty("APICurrency"))
---@type APIItemPickups
local ITEM_PICKUPS = require(script:GetCustomProperty("APIItemPickups"))

---@class PlaceableControllerBase
local PlaceableControllerBase = CLASS:extend()

function PlaceableControllerBase:New(rootObject)
    local controller = PlaceableControllerBase:new()
    controller:InitializePlaceable(rootObject)
    return controller
end

function PlaceableControllerBase:InitializePlaceable(rootObject)
    self.ComponentRoot = rootObject
	self.Instance = REPLICATOR.GetCurrentInstance()

    -- If there's no instance, it was spawned for a preview
    if self.Instance == nil then
        return
    end

    self.PlaceableId = self.Instance.placeableId
    self.PlaceableData = DATABASE.Placeables[self.PlaceableId]

    if self.PlaceableData == nil then
        error(string.format("Unable to find Placeable Data in the Database for Id: %s", self.PlaceableId))
    end

    self.HasCaughtUp = false
    self.RuntimeState = self:InitializeRuntimeState()
    self.EquipmentInteractions = self:InitializeEquipmentInteractions()
    self.BuffData = self:InitializeBuffData()
    self.ActiveProximityBuffs = {}

    PLACEABLES.RegisterPlaceable(self.ComponentRoot.id, {
        GetState = function(...) return self:GetState(...) end,
        OnRemovePlaceable = function(...) return self:OnRemovePlaceable(...) end,
        OnBuffAdded = function(...) return self:OnBuffAdded(...) end,
        OnBuffRemoved = function(...) return self:OnBuffRemoved(...) end,
        OnBuffRelinked = function(...) return self:OnBuffRelinked(...) end,
        OnHandleBuffs = function(...) return self:OnHandleBuffs(...) end
    })

    EQUIPMENT.RegisterEquipmentTarget(self.ComponentRoot, {
        CanEquipmentInteract = function(...) return self:CanEquipmentInteract(...) end,
        EquipmentInteract = function(...) return self:EquipmentInteract(...) end
    })

    BUFFS.RegisterTarget(self.ComponentRoot.id, {
        GetPosition = function(...) return self:GetPosition(...) end
    })

    TIME_SIMULATOR.RegisterSystem(self.ComponentRoot.id, {
        GetStartTime = function(...) return self:GetStartTime(...) end,
        GetNextTime = function(...) return self:GetNextTime(...) end,
        OnStepTime = function(...) return self:OnStepTime(...) end,
        OnStepTimeEnd = function(...) return self:OnStepTimeEnd(...) end
    })

    self.Listeners = {
        Events.Connect(BUFFS.Events.PrepareLinkedBuffs, function(...) return self:OnPrepareLinkedBuffs(...) end),
        self.Instance.modifiedEvent:Connect(function(...) return self:OnInstanceModified(...) end),
        self.ComponentRoot.destroyEvent:Connect(function(...) return self:Destroy(...) end)
    }
end

function PlaceableControllerBase:Initialize()
    self:ClearBuffData()
    self:InstanceToRuntimeState()
    self:UpdateLinkedBuffs()
    self:RuntimeStateToInstance()
end

function PlaceableControllerBase:PreDestroy()
    -- Derived controllers can handle custom destroy logic here
end

function PlaceableControllerBase:Destroy()
    self:PreDestroy()

    PLACEABLES.UnregisterPlaceable(self.ComponentRoot.id)
    EQUIPMENT.UnregisterEquipmentTarget(self.ComponentRoot)
    BUFFS.UnregisterTarget(self.ComponentRoot.id)
    TIME_SIMULATOR.UnregisterSystem(self.ComponentRoot.id)

    for _, listener in pairs(self.Listeners) do
        listener:Disconnect()
    end

    self.Listeners = nil
    self.ComponentRoot = nil
    self.Instance = nil
    self.BuffData = nil
    self.ActiveProximityBuffs = nil
    self.RuntimeState = nil

    self:UpdateLinkedBuffs()

    self:PostDestroy()
end

function PlaceableControllerBase:PostDestroy()
    -- Derived controllers can handle custom destroy logic here
end

--- Instance ---

function PlaceableControllerBase:InitializeRuntimeState()
    return {
        position = self.ComponentRoot:GetWorldPosition(),
        rotation = self.ComponentRoot:GetWorldRotation(),
        placeableId = self.Instance.placeableId,
        time = REALTIME.GetRealTime(),
    }
end

function PlaceableControllerBase:InstanceToRuntimeState(allowPrediction)
    local buffState = {}
    if self.Instance.state and self.Instance.state ~= "" then
        buffState = SERIALIZER.ReadString(self.Instance.state)
    end

    self.RuntimeState.time = self.Instance.serverTime

    self:UpdateBuffData()

    BUFFS.ReadBuffsFromTable(self.ComponentRoot.id, buffState or {}, function() return self:GetTime() end)

    self:UpdateLinkedBuffs()
end

function PlaceableControllerBase:RuntimeStateToInstance()
    local buffState = BUFFS.WriteBuffsToTable(self.ComponentRoot.id, self:GetTime())
    self.Instance.state = SERIALIZER.WriteString(buffState)
    self.Instance.serverTime = self.RuntimeState.time
end

function PlaceableControllerBase:OnInstanceModified()
    self:InstanceToRuntimeState(true)
    self.RuntimeState.position = self.ComponentRoot:GetWorldPosition()
    self.RuntimeState.rotation = self.ComponentRoot:GetWorldRotation()
    self:RuntimeStateToInstance()
end

function PlaceableControllerBase:GetState()
    ---@class PlaceableState
    local result = {
        placeableId = self.RuntimeState.placeableId,
        replicatorId = self.Instance.replicatorId,
        instance = self.Instance,
        position = self.RuntimeState.position,
        rotation = self.RuntimeState.rotation,
        buffData = self.BuffData,
        buffTargetId = self.ComponentRoot.id
    }
    return result
end

--- Interaction ---

function PlaceableControllerBase:InitializeEquipmentInteractions()
    return {
        self:NewBuffPlaceableInteraction(),
        self:NewRemovePlaceableInteraction()
    }
end

function PlaceableControllerBase:TryEquipmentInteract(player, target, toolType, equipmentSettings, doInteract)
    local errorMessage
    if target == self.ComponentRoot then
        -- Run the interactions in order of priority
        for _, interaction in ipairs(self.EquipmentInteractions) do
            local interactionCompleted, interactionError = interaction(player, target, toolType, equipmentSettings, doInteract)
            if interactionCompleted then
                -- Exit early if an interaction happens
                return true, nil
            elseif not errorMessage then
                -- Save first interaction error
                errorMessage = interactionError
            end
        end

        -- Update Interaction Display
        Events.Broadcast("CanEquipmentInteract", "NoInteraction", target, toolType, equipmentSettings)
    end
    return false, errorMessage
end

function PlaceableControllerBase:CanEquipmentInteract(player, target, toolType, equipmentSettings)
    return self:TryEquipmentInteract(player, target, toolType, equipmentSettings, false)
end

function PlaceableControllerBase:EquipmentInteract(player, target, toolType, equipmentSettings)
    return self:TryEquipmentInteract(player, target, toolType, equipmentSettings, true)
end

function PlaceableControllerBase:NewBuffPlaceableInteraction()
    return function(player, target, toolType, equipmentSettings, doInteract)
        local canBuff, canBuffError = self:CanBuffPlaceable(toolType, equipmentSettings)
        if canBuff then
            if self:HasRequiredToolsToBuffPlaceable(player, toolType, equipmentSettings) then
                Events.Broadcast("CanEquipmentInteract", "BuffPlaceable", target, toolType, equipmentSettings)

                if doInteract then
                    self:BuffPlaceableWithTool(player, toolType, equipmentSettings)
                end
                return true, nil
            else
                return false, self:GetMissingRequirementsMessage(equipmentSettings.ItemId)
            end
        end
        return false, canBuffError
    end
end

function PlaceableControllerBase:NewRemovePlaceableInteraction()
    return function(player, target, toolType, equipmentSettings, doInteract)
        local canRemove, canRemoveError = self:CanRemovePlaceable(player, toolType, equipmentSettings)
        if canRemove then
            Events.Broadcast("CanEquipmentInteract", "RemovePlaceable", target, toolType, equipmentSettings)
            if doInteract then
                PLACEABLES.HandlePlaceableDrops(player, self.ComponentRoot.id)
                self:RemovePlaceable(player)
            end
            return true, nil
        end
        return false, canRemoveError
    end
end

function PlaceableControllerBase:CanBuffPlaceable(toolType, equipmentSettings)
    for buffId, buffValidToolTypes in pairs(self.BuffData.buffValidToolTypes) do
        if buffValidToolTypes[toolType] or buffValidToolTypes[equipmentSettings.ItemId] then
            -- If we already have the buff, check how much of this buff we have
            if BUFFS.HasBuff(self.ComponentRoot.id) then
                local minAllowedBuffConsumption = self.BuffData.minAllowedBuffConsumption[buffId] or 0
                local maxAmount = BUFFS.GetBuffSetting(buffId, BUFFS.Settings.MaxStacks)
                local remainingAmount = BUFFS.GetBuffRemainingAmount(self.ComponentRoot.id, buffId)
                if maxAmount - remainingAmount > minAllowedBuffConsumption then
                    return false, "Not enough room"
                end
            end
            return true
        end
    end
    return false
end

function PlaceableControllerBase:HasRequiredToolsToBuffPlaceable(player, toolType, equipmentSettings)
    for buffId, buffValidToolTypes in pairs(self.BuffData.buffValidToolTypes) do
        if buffValidToolTypes[toolType] or buffValidToolTypes[equipmentSettings.ItemId] then
            if not self:HasRequiredItems(player, self.BuffData.toolsConsumedWhenAdded[buffId], equipmentSettings) then
                return false
            end
        end
    end
    return true
end

function PlaceableControllerBase:BuffPlaceableWithTool(player, toolType, equipmentSettings)
    for buffId, buffValidToolTypes in pairs(self.BuffData.buffValidToolTypes) do
        if buffValidToolTypes[toolType] or buffValidToolTypes[equipmentSettings.ItemId] then
            self:ConsumeTool(player, equipmentSettings, self.BuffData.toolsConsumedWhenAdded[buffId])
            BUFFS.AddBuff(self.ComponentRoot.id, buffId, function() return self:GetTime() end)
            self:SpawnEffects(self.BuffData.addBuffEffect[buffId], self.BuffData.addBuffEffectOffset[buffId] or Vector3.ZERO)

            -- Exit after applying buff
            return
        end
    end

    self:RuntimeStateToInstance()
    REPLICATOR.ModifyInstance(self.Instance)
end


function PlaceableControllerBase:OnRemovePlaceable(player)
    self:RemovePlaceable(player)
end

function PlaceableControllerBase:CanRemovePlaceable(player, toolType, equipmentSettings)
    if not EQUIPMENT.IsValidToolType(self.PlaceableData.ValidRemoveToolTypes, toolType, equipmentSettings)  then
        return false
    end

    if not self.PlaceableData.DestroyOnRemove then
        -- Ensure all potential drops can fit into Inventory
        local itemId = self.Instance.placeableId
        local itemData = DATABASE.Items[itemId]
        local itemsToCheck = {}
        local currenciesToCheck = {}

        if itemData then
            if itemData.IsInventory then
                -- TODO: Figure out why state is not serialized for newly placed containers
                self:RuntimeStateToInstance()
                local inventoryId, _ = SERIALIZER.ReadString(self.Instance.state)
                itemId = inventoryId
            end
            itemsToCheck[itemId] = 1
        end

        if self.PlaceableData.DropPlacementCostsOnRemove and self.PlaceableData.Costs and #self.PlaceableData.Costs > 0 then
            for _, costData in pairs(self.PlaceableData.Costs) do
                if costData.ItemId and costData.ItemId ~= "" then
                    itemsToCheck[costData.ItemId] = (itemsToCheck[costData.ItemId] or 0) + costData.Amount
                elseif costData.CurrencyId and costData.CurrencyId ~= "" then
                    currenciesToCheck[costData.CurrencyId] = (currenciesToCheck[costData.CurrencyId] or 0) + costData.Amount
                end
            end
        end

        local canRemove = INVENTORY.CanAddItemsToInventory(player, nil, itemsToCheck, false)
        if canRemove then
            canRemove = CURRENCY.HasRoomForCurrencies(player, currenciesToCheck)
            if not canRemove then
                return false, string.format("Can't remove %s. No room for Currency", itemData.Name)
            end
        else
            return false, string.format("Can't remove %s. No room in Inventory", itemData.Name)
        end
    end

    local canRemoveDerived, canRemoveDerivedError = self:CanRemovePlaceableDerived(player, toolType, equipmentSettings)
    if not canRemoveDerived then
        return false, canRemoveDerivedError
    end

    return true
end

function PlaceableControllerBase:CanRemovePlaceableDerived(player, toolType, equipmentSettings)
    return true
end

function PlaceableControllerBase:PreRemove(player)
    -- Derived controllers can handle custom removal logic here
end

function PlaceableControllerBase:RemovePlaceable(player)
    self:PreRemove(player)

    local itemData, itemType, itemId
    if DATABASE.Items then
        itemData = DATABASE.Items[self.PlaceableId]
        itemId = self.PlaceableId
        itemType = INVENTORY.ItemType.Item

        if itemData and itemData.IsInventory then
            local inventoryId, _ = SERIALIZER.ReadString(self.Instance.state)
            itemId = inventoryId
            itemType = INVENTORY.ItemType.Inventory
        end
    end

    if not self.PlaceableData.DestroyOnRemove then
        if self.PlaceableData.DropInWorldOnRemove then
            if itemData then
                ITEM_PICKUPS.CreateItemPickup(player, self.PlaceableData.DropItemPickupTemplate, self.RuntimeState.position, self.RuntimeState.position, ITEM_PICKUPS.PickupType.Item, itemType, itemId, 1, self.PlaceableData.DropsForAllPlayers, true, self.PlaceableData.DropTimeoutSeconds)
            end

            if self.PlaceableData.DropPlacementCostsOnRemove and self.PlaceableData.Costs then
                local pickupData = {}
                for _, costData in pairs(self.PlaceableData.Costs) do
                    if costData.ItemId and costData.ItemId ~= "" then
                        table.insert(pickupData, ITEM_PICKUPS.CreatePickupData(ITEM_PICKUPS.PickupType.Item, INVENTORY.ItemType.Item, costData.ItemId, costData.Amount, 0))
                    elseif costData.CurrencyId and costData.CurrencyId ~= "" then
                        table.insert(pickupData, ITEM_PICKUPS.CreatePickupData(ITEM_PICKUPS.PickupType.Currency, nil, costData.CurrencyId, costData.Amount, 0))
                    end
                end

                if #pickupData > 0 then
                    ITEM_PICKUPS.CreateItemPickups(player, self.PlaceableData.DropItemPickupTemplate, self.RuntimeState.position, 0, pickupData, self.PlaceableData.DropsForAllPlayers, true, self.PlaceableData.DropTimeoutSeconds)
                end
            end
        else
            INVENTORY.AddToInventory(player, nil, itemType, itemId, 1, 0, false)
            if self.PlaceableData.DropPlacementCostsOnRemove and self.PlaceableData.Costs then
                for _, costData in pairs(self.PlaceableData.Costs) do
                    if costData.ItemId and costData.ItemId ~= "" then
                        INVENTORY.AddToInventory(player, nil, INVENTORY.ItemType.Item, costData.ItemId, costData.Amount, 0, false)
                    elseif costData.CurrencyId and costData.CurrencyId ~= "" then
                        CURRENCY.AddCurrencyAmount(player, costData.CurrencyId, costData.Amount)
                    end
                end
            end
        end
    end

    self:SpawnEffects(self.PlaceableData.RemoveEffects, self.PlaceableData.RemoveEffectsOffset)

    Events.Broadcast(PLACEABLES.Events.PlaceableRemoved, self.ComponentRoot.id, self.PlaceableId)

    REPLICATOR.DestroyInstance(self.Instance, false)

    self:UpdateLinkedBuffs()
end

function PlaceableControllerBase:ConsumeTool(player, equipmentSettings, amount)
    -- Handle tool consumption
    if amount > 0 and equipmentSettings.InventoryId and equipmentSettings.InventoryId ~= "" then
        INVENTORY.RemoveFromInventory(player, equipmentSettings.InventoryId, INVENTORY.ItemType.Item, equipmentSettings.ItemId, amount, equipmentSettings.SlotIndex)
    end
end

function PlaceableControllerBase:SpawnEffects(effectsAsset, offset)
    if Environment.IsClient() then
        if effectsAsset and effectsAsset ~= "" then
            local params = { position = self.ComponentRoot:GetWorldPosition() + offset }
            local effects = World.SpawnAsset(effectsAsset, params)

            -- Ensure these don't stack up
            if effects.lifeSpan == 0 then
                effects.lifeSpan = 5
            end
        end
    end
end

function PlaceableControllerBase:HasRequiredItems(player, requiredToolAmount, equipmentSettings)
    if requiredToolAmount and requiredToolAmount > 0 then
        if equipmentSettings.InventoryId and equipmentSettings.InventoryId ~= "" then
            if not INVENTORY.HasAmountInInventory(player, equipmentSettings.InventoryId, INVENTORY.ItemType.Item, equipmentSettings.ItemId, requiredToolAmount, equipmentSettings.SlotIndex) then
                return false
            end
        end
    end
    return true
end

function PlaceableControllerBase:GetMissingRequirementsMessage(itemId)
    local message = "Not enough items"
    if DATABASE.Items then
        local itemData = DATABASE.Items[itemId]
        message = string.format("Not enough %s", itemData.Name)
    end
    return message
end

--- Buffs ---

function PlaceableControllerBase:GetPosition()
    return self.RuntimeState.position
end

function PlaceableControllerBase:OnBuffAdded(buffId)
    BUFFS.SetBuffTimeFunction(self.ComponentRoot.id, buffId, function() return self:GetTime() end)
    local overrideDuration = self.BuffData.overrideBuffDurations[buffId]
    if overrideDuration then
        BUFFS.SetBuffDuration(self.ComponentRoot.id, buffId, overrideDuration)
    end
end

function PlaceableControllerBase:OnBuffRemoved(buffId)
end

function PlaceableControllerBase:OnBuffRelinked(buffId)
    self:DoProximityBuffs()
end

function PlaceableControllerBase:OnHandleBuffs()
    self:DoProximityBuffs()
end

function PlaceableControllerBase:InitializeBuffData()
    return {
        receiveableBuffs = {},
        proximityBuffs = {},
        buffValidToolTypes = {},
        toolsConsumedWhenAdded = {},
        proximityBuffsRadius = {},
        overrideBuffDurations = {},
        proximityBuffsRequired = {},
        addBuffEffect = {},
        addBuffEffectOffset = {},
        proximityBuffsAddAmount = {},
    }
end

function PlaceableControllerBase:ProcessBuffData(buffs)
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
        if data.OverrideBuffDuration then
            self.BuffData.overrideBuffDurations[buffId] = data.BuffDuration
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
    end
end

function PlaceableControllerBase:ClearBuffData()
    for key in pairs(self.BuffData) do
        if next( self.BuffData[key]) then
            self.BuffData[key] = {}
        end
    end
end

function PlaceableControllerBase:UpdateBuffData()
    self:ClearBuffData()

    if self.PlaceableData then
        self:ProcessBuffData(self.PlaceableData.InputBuffs)
        self:ProcessBuffData(self.PlaceableData.OutputBuffs)
    end

    BUFFS.ClearTargetRecieveBuffs(self.ComponentRoot.id)

    for buffId in pairs(self.BuffData.receiveableBuffs) do
        BUFFS.AddTargetRecieveBuff(self.ComponentRoot.id,buffId)
    end
end

function PlaceableControllerBase:DoProximityBuffs()
    if self.Instance.isDestroyed then
        return
    end

    local proximityBuffs = self.BuffData.proximityBuffs
    local sourcePosition = BUFFS.GetTargetPosition(self.ComponentRoot.id)
    -- Add any new buffs
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

function PlaceableControllerBase:CheckHasAllBuffs(buffs)
    for buffId in pairs(buffs) do
        if BUFFS.HasBuff(self.ComponentRoot.id, buffId) == false then
            return false
        end
    end
    return true
end

function PlaceableControllerBase:CheckHasAnyBuffs(buffs)
    for buffId in pairs(buffs) do
        if BUFFS.HasBuff(self.ComponentRoot.id, buffId) then
            return true
        end
    end
    return false
end

function PlaceableControllerBase:OnPrepareLinkedBuffs()
    if next(self.ActiveProximityBuffs) then
        self.ActiveProximityBuffs = {}
    end
end

function PlaceableControllerBase:UpdateLinkedBuffs()
    BUFFS.RequestLinkedBuffsUpdate()
end

--- Time ---

function PlaceableControllerBase:GetTime()
    return self.RuntimeState.time
end

function PlaceableControllerBase:GetStartTime()
    return self.RuntimeState.time
end

function PlaceableControllerBase:GetNextTime(prevTime)
    local minRemainingTime = nil
    for _, buffId in ipairs(BUFFS.GetBuffs(self.ComponentRoot.id)) do
        local buffRemainingTime = self:nil_zero_or_less(BUFFS.GetBuffRemainingTime(self.ComponentRoot.id, buffId, prevTime))
        minRemainingTime = self:safe_min(buffRemainingTime, minRemainingTime)
    end

    if minRemainingTime then
        return minRemainingTime + prevTime
    end
end

function PlaceableControllerBase:OnStepTime(currentTime)
    -- If the step time was in the past, do nothing
    if currentTime < self.RuntimeState.time then
        return
    end

    self.RuntimeState.time = currentTime
    BUFFS.HandleFinishedTimedBuffs(self.ComponentRoot.id)
end

function PlaceableControllerBase:OnStepTimeEnd()
    if not self.HasCaughtUp then
        self.HasCaughtUp = true
        self.RuntimeState.time = REALTIME.GetRealTime()

        self:RuntimeStateToInstance()
        REPLICATOR.ModifyInstance(self.Instance)
    end
end

--- Utility ---

function PlaceableControllerBase:IsTableEmpty(tbl)
    return next(tbl) == nil
end

function PlaceableControllerBase:safe_min(a,b)
    if a == nil and b == nil then return nil end
    if a == nil then return b end
    if b == nil then return a end
    if a < b then return a end
    return b
end

function PlaceableControllerBase:nil_zero_or_less(a)
    if a == nil then return nil end
    if a <= 0 then return nil end
    return a
end

return PlaceableControllerBase