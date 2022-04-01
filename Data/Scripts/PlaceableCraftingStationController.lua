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
    This script runs on each Placeable Crafting Station on the client and the server.
--]]

local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

-- Required APIs
---@type APISerializer
local SERIALIZER = require(script:GetCustomProperty("APISerializer"))
---@type APIReplicator
local REPLICATOR = require(script:GetCustomProperty("APIReplicator"))
---@type APICrafting
local CRAFTING = require(script:GetCustomProperty("APICrafting"))
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APIBuffs
local BUFFS = require(script:GetCustomProperty("APIBuffs"))
---@type APIEquipment
local EQUIPMENT = require(script:GetCustomProperty("APIEquipment"))
---@type APICounter
local COUNTER = require(script:GetCustomProperty("APICounter"))
---@type APIRealTime
local REALTIME = require(script:GetCustomProperty("APIRealTime"))
---@type APITags
local TAGS = require(script:GetCustomProperty("APITags"))
---@type Attribute
local Attribute = require(script:GetCustomProperty("APIAttribute"))
---@type APICurrency
local CURRENCY = require(script:GetCustomProperty("APICurrency"))
---@type APIInventory
local INVENTORY = require(script:GetCustomProperty("APIInventory"))
---@type APIItemPickups
local ITEM_PICKUPS = require(script:GetCustomProperty("APIItemPickups"))
---@type APIDrops
local DROPS = require(script:GetCustomProperty("APIDrops"))

---@type PlaceableControllerBase
local PlaceableControllerBase = require(script:GetCustomProperty("PlaceableControllerBase"))

---@class PlaceableCraftingStationController
local PlaceableCraftingStationController = PlaceableControllerBase:extend()

-- Constants
local CRAFTING_TAG = "CFT_"
local EVENT_OPEN_CRAFTING_SCREEN = CRAFTING_TAG .. "openScreen"

function PlaceableCraftingStationController:New(rootObject)
    local controller = PlaceableCraftingStationController:new()
    controller:InitializePlaceable(rootObject)
    controller:InitializeCraftingStation()
    return controller
end

function PlaceableCraftingStationController:InitializeCraftingStation()
    self.InstanceNeedsEncoding = false
    self.CraftingStationId = CRAFTING.GetCraftingStationId(self.ComponentRoot, self.Instance)
    self.CraftCounter = COUNTER.New(0, 0, 1, 1, 0, function() return self:GetTime() end)
    self.DropPosition = self.RuntimeState.position

    table.insert(self.Listeners,
    self.ComponentRoot.childAddedEvent:Connect(function(parent, child)
        if child:GetCustomProperty("DropPosition") then
            local dropPosObject = child:GetCustomProperty("DropPosition"):WaitForObject()
            if dropPosObject then
                self.DropPosition = dropPosObject:GetWorldPosition()
            end
        end
    end))
end

---Override to register Crafting Station
function PlaceableCraftingStationController:Initialize()
    self:ClearBuffData()
    self:InstanceToRuntimeState()
    self:UpdateLinkedBuffs()
    self:RuntimeStateToInstance()

    CRAFTING.RegisterCraftingStation(self.CraftingStationId, {
        GetState = function(...) return self:GetState(...) end,
        UpdateState = function(...) return self:UpdateState(...) end,
        StartCrafting = function(...) return self:StartCrafting(...) end,
        CollectCrafting = function(...) return self:CollectCrafting(...) end,
        ResetCrafting = function(...) return self:ResetCrafting(...) end,
        GetCraftRate = function(...) return self:GetCraftRate(...) end
    })
end

---Override to unregister Crafting Station
function PlaceableCraftingStationController:PreDestroy()
    CRAFTING.UnregisterCraftingStation(self.CraftingStationId)
end

--- Instance ---

---Override to add the open Crafting Station interaction
function PlaceableCraftingStationController:InitializeEquipmentInteractions()
    return {
        self:NewBuffPlaceableInteraction(),
        self:NewRemovePlaceableInteraction(),
        self:NewOpenCraftingStationInteraction(),
        self:NewCraftingStationInteractionError()
    }
end

---Override to include Crafting Station state
function PlaceableCraftingStationController:InitializeRuntimeState()
    return {
        position = self.ComponentRoot:GetWorldPosition(),
        rotation = self.ComponentRoot:GetWorldRotation(),
        placeableId = self.PlaceableId,
        placeableData = self.PlaceableData,
        recipeId = nil,
        recipeData = nil,
        uniqueId = nil,
        time = REALTIME.GetRealTime(),
        isReadyForCollect = false,
        hasStartedCrafting = false,
        craftAmount = nil
    }
end

---Override to include Crafting Station state
function PlaceableCraftingStationController:InstanceToRuntimeState(allowPrediction)
    local recipeUniqueStorageId, uniqueId, amountToCraft, craftAmount, buffState
    if not self.Instance.state or self.Instance.state == "" then
        recipeUniqueStorageId, uniqueId, amountToCraft, craftAmount, buffState = self:GetDefaultState()
    else
        recipeUniqueStorageId, uniqueId, amountToCraft, craftAmount, buffState = SERIALIZER.ReadString(self.Instance.state)
    end

    local recipeId, recipeData
    if recipeUniqueStorageId then
        recipeId = CRAFTING.GetRecipeIdByStorageId(recipeUniqueStorageId)
        if recipeId then
            recipeData = CRAFTING.GetRecipeData(recipeId)
        end
    end

    local currentTime = self.Instance.serverTime
    local previousTime = self.RuntimeState.time

    self.RuntimeState.recipeId = recipeId
    self.RuntimeState.recipeData = recipeData
    self.RuntimeState.uniqueId = uniqueId
    self.RuntimeState.amountToCraft = amountToCraft
    self.RuntimeState.craftAmount = craftAmount or 0
    self.RuntimeState.hasStartedCrafting = craftAmount ~= nil
    self.RuntimeState.isReadyForCollect = craftAmount ~= nil and craftAmount > 0.99999
    self.RuntimeState.time = self.Instance.serverTime

    self.CraftCounter:SetValue(craftAmount)

    self:UpdateBuffData()

    BUFFS.ReadBuffsFromTable(self.ComponentRoot.id, buffState or {}, function() return self:GetTime() end)

    self:UpdateLinkedBuffs()
    self:UpdateCraftRate()
    self:UpdateBuffRates()

    if allowPrediction then
        -- If we recieved stuff in the past, run this forward to the time we were at
        if previousTime > currentTime then
            self.RuntimeState.time = currentTime
            self:UpdateRuntimeState()
        end
    end
end

function PlaceableCraftingStationController:UpdateRuntimeState()
    self.RuntimeState.craftAmount = self.CraftCounter:GetValue()

    local isReadyForCollect = self.RuntimeState.craftAmount > 0.99999

    if self.RuntimeState.isReadyForCollect ~= isReadyForCollect then
        self.RuntimeState.isReadyForCollect = isReadyForCollect
        self.InstanceNeedsEncoding = true

        self:UpdateLinkedBuffs()

        if isReadyForCollect then
            Events.Broadcast(CRAFTING.Events.CraftingReadyForCollect, self.CraftingStationId, self.RuntimeState.recipeId, self.RuntimeState.amountToCraft)
        end
    end

    self:UpdateCraftRate()
    self:UpdateBuffRates()
end

---Override to include Crafting Station state
function PlaceableCraftingStationController:RuntimeStateToInstance()
    local recipeUniqueStorageId = CRAFTING.GetRecipeStorageIdByRecipeId(self.RuntimeState.recipeId)
    local uniqueId = self.RuntimeState.uniqueId
    local amountToCraft = self.RuntimeState.amountToCraft
    local craftAmount = self.RuntimeState.craftAmount

    if self.RuntimeState.isReadyForCollect then
        craftAmount = 1
    end
    if not self.RuntimeState.hasStartedCrafting then
        craftAmount = nil
    end

    local buffState = BUFFS.WriteBuffsToTable(self.ComponentRoot.id, self:GetTime())
    self.Instance.state = SERIALIZER.WriteString(recipeUniqueStorageId, uniqueId, amountToCraft, craftAmount, buffState)
    self.Instance.serverTime = self.RuntimeState.time
end

---Returns the default state
---@return integer
---@return any
---@return integer
---@return any
---@return table
function PlaceableCraftingStationController:GetDefaultState()
    return 0, nil, 0, nil, {}
end

function PlaceableCraftingStationController:OnInstanceModified()
    local hadStartedCrafting = self.RuntimeState.hasStartedCrafting
    local wasReadyForCollect = self.RuntimeState.isReadyForCollect

    self:InstanceToRuntimeState(true)
    self.RuntimeState.position = self.ComponentRoot:GetWorldPosition()
    self.RuntimeState.rotation = self.ComponentRoot:GetWorldRotation()

    if not hadStartedCrafting and self.RuntimeState.hasStartedCrafting then
        Events.Broadcast(CRAFTING.Events.StartedCrafting, self.CraftingStationId, self.RuntimeState.recipeId, self.RuntimeState.amountToCraft)
    elseif not wasReadyForCollect and self.RuntimeState.isReadyForCollect then
        Events.Broadcast(CRAFTING.Events.CraftingReadyForCollect, self.CraftingStationId, self.RuntimeState.recipeId, self.RuntimeState.amountToCraft)
    elseif wasReadyForCollect and not self.RuntimeState.isReadyForCollect then
        Events.Broadcast(CRAFTING.Events.CraftingCollected, self.CraftingStationId, self.RuntimeState.recipeId, self.RuntimeState.amountToCraft)
    end
end

---Override to include Crafting Station state
function PlaceableCraftingStationController:GetState()
    ---@class CraftingStationState
    local result = {
        root = self.ComponentRoot,
        placeableId = self.RuntimeState.placeableId,
        replicatorId = self.Instance.replicatorId,
        instance = self.Instance,
        position = self.RuntimeState.position,
        rotation = self.RuntimeState.rotation,
        buffData = self.BuffData,
        buffTargetId = self.ComponentRoot.id,
        hasStartedCrafting = self.RuntimeState.hasStartedCrafting,
        isReadyForCollect = self.RuntimeState.isReadyForCollect,
        craftingStationId = self.CraftingStationId,
        craftingStationDataId = self.RuntimeState.placeableId,
        uniqueId = self.RuntimeState.uniqueId,
        craftAmount = self.RuntimeState.craftAmount,
        craftRate = self.CraftCounter.rateOfChange,
        craftTimeRemaining = self.CraftCounter:GetRemainingTimeToMax(self.RuntimeState.time) or 0,
        recipeId = self.RuntimeState.recipeId,
        amountToCraft = self.RuntimeState.amountToCraft,
        dropPosition = self.DropPosition
    }
    return result
end

--- Interaction ---

---Override this to disable removing while crafting.
function PlaceableCraftingStationController:CanRemovePlaceableDerived(player, toolType, equipmentSettings)
    if self.PlaceableData.AllowRemovalWhileInUse == false and CRAFTING.IsCrafting(nil, self.CraftingStationId) then
        return false, "This is currently in use"
    end
    return true
end

---Handle the contents of the station when removed.
function PlaceableCraftingStationController:PreRemove(player)
    local recipeData = self.RuntimeState.recipeData

    local drops = nil
    if self.RuntimeState.isReadyForCollect then
        drops = DROPS.CalculateDrops(recipeData.Drops, self.RuntimeState.amountToCraft, nil, true)
    elseif self.RuntimeState.hasStartedCrafting then
        drops = DROPS.CalculateDrops(recipeData.Inputs, nil, nil, true)
    else
        -- Station isn't currently processing anything
        return
    end

    if self.PlaceableData.DestroyCraftOnRemove then
        -- Default behaviour, do nothing
    elseif self.PlaceableData.DropCraftInWorldOnRemove then
        -- Drop on the ground
        ITEM_PICKUPS.CreateItemPickupsForDrops(
            player,
            drops,
            self.PlaceableData.DropItemPickupTemplate,
            self.RuntimeState.position,
            self.PlaceableData.DropMinDistance,
            self.PlaceableData.DropMaxDistance,
            self.PlaceableData.DropForAllPlayers,
            self.PlaceableData.SinglePlayerDrops,
            self.PlaceableData.DropTimeoutSeconds,
            self.PlaceableData.MaxPickupsPerDrop
        )
    else
        -- Place directly into the player's inventory
        for itemId, dropAmount in pairs(drops.Items) do
            INVENTORY.AddToInventory(player, nil, INVENTORY.ItemType.Item, itemId, dropAmount, 0, false, true)
        end

        for currencyId, dropAmount in pairs(drops.Currencies) do
            CURRENCY.AddCurrencyAmount(player, currencyId, dropAmount, true)
        end
    end
end

---Handle opening the Crafting Station.
---@return function
function PlaceableCraftingStationController:NewOpenCraftingStationInteraction()
    return function(player, target, toolType, equipmentSettings, doInteract)
        local canOpen, canOpenError = self:CanOpenCraftingStation(player, toolType, equipmentSettings)
        if canOpen then
            Events.Broadcast("CanEquipmentInteract", "OpenCraftingStation", target, toolType, equipmentSettings)
            if doInteract then
                Events.Broadcast(EVENT_OPEN_CRAFTING_SCREEN, self.CraftingStationId, self.RuntimeState.placeableId)
            end
            return true, nil
        end
        return false, canOpenError
    end
end

---Returns true if the Crafting Station can be opened with the currently equipped Tool, otherwise returns false and some
---text that should explain how to open the Crafting Station.
---@param player Player
---@param toolType string
---@param equipmentSettings EquipmentSettings
---@return boolean
---@return string
function PlaceableCraftingStationController:CanOpenCraftingStation(player, toolType, equipmentSettings)
    if self.RuntimeState.hasStartedCrafting or self.RuntimeState.isReadyForCollect then
        if not CRAFTING.IsPlayerUsing(player, self.CraftingStationId) then
            return false, "This is being used by another Player"
        end
    end

    if not self:CheckHasAllBuffs(self.BuffData.requireToStartCraftingBuffs) then
        return false
    end

    local placeableData = self.PlaceableData
    if not EQUIPMENT.IsValidToolType(placeableData.ValidCraftToolTypes, toolType, equipmentSettings)  then
        return false, placeableData.OpenCraftingStationInteractionText
    end

    return true, nil
end

function PlaceableCraftingStationController:NewCraftingStationInteractionError()
    return function(player, target, toolType, equipmentSettings, doInteract)
        -- Find an appropriate error message
        local errorMessage
        if doInteract then
            local function GetBuffInteractionText(craftingStationData, buffs)
                local placeableData = self.PlaceableData
                for buffId, _ in pairs(buffs) do
                    if not BUFFS.HasBuff(self.PlaceableId, buffId) then
                        local data
                        if craftingStationData and craftingStationData.InputBuffs and craftingStationData.InputBuffs[buffId] then
                            data = craftingStationData.InputBuffs[buffId]
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

            if not self.RuntimeState.hasStartedCrafting and not self:CheckHasAllBuffs(self.BuffData.requireToStartCraftingBuffs) then
                local craftingStationData = CRAFTING.GetCraftingStationData(self.PlaceableId)
                errorMessage = GetBuffInteractionText(craftingStationData, self.BuffData.requireToStartCraftingBuffs)
            end
        end
        return false, errorMessage
    end
end

--- Buffs ---

---Override to include Crafting Station specific buff data
function PlaceableCraftingStationController:InitializeBuffData()
    return {
        receiveableBuffs = {},
        requireToStartCraftingBuffs = {},
        buffCraftRateAddMultipliers = {},
        buffValidToolTypes = {},
        toolsConsumedWhenAdded = {},
        proximityBuffs = {},
        proximityBuffsRadius = {},
        proximityBuffsAddAmount = {},
        overrideBuffDurations = {},
        proximityBuffsRequired = {},
        drainWhilePlaced = {},
        drainWhileCrafting = {},
        drainWhileReady = {},
        removeOnCollect = {},
        addBuffEffect = {},
        addBuffEffectOffset = {},
        minAllowedBuffConsumption = {}
    }
end

---Override to include Crafting Station specific buff data
function PlaceableCraftingStationController:ProcessBuffData(buffs)
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
        if data.RequireToStartCrafting then
            self.BuffData.requireToStartCraftingBuffs[buffId] = true
        end
        if data.AffectsCraftRate then
            self.BuffData.buffCraftRateAddMultipliers[buffId] = data.CraftRateMultiplierPercent / 100 or 0
        end
        if data.OverrideBuffDuration then
            self.BuffData.overrideBuffDurations[buffId] = data.BuffDuration
        end
        if data.DrainWhilePlaced then
            self.BuffData.drainWhilePlaced[buffId] = true
        end
        if data.DrainWhileCrafting then
            self.BuffData.drainWhileCrafting[buffId] = true
        end
        if data.DrainWhileReady then
            self.BuffData.drainWhileReady[buffId] = true
        end
        if data.RemoveOnCollect then
            self.BuffData.removeOnCollect[buffId] = true
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

function PlaceableCraftingStationController:UpdateBuffData()
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

function PlaceableCraftingStationController:RemoveBuffsOnCollect()
    local buffs = BUFFS.GetBuffs(self.ComponentRoot.id)
    for _, buffId in pairs(buffs) do
        if self.BuffData.removeOnCollect[buffId] then
            BUFFS.RemoveBuff(self.ComponentRoot.id, buffId)
        end
    end
end

function PlaceableCraftingStationController:OnBuffAdded(buffId)
    BUFFS.SetBuffTimeFunction(self.ComponentRoot.id, buffId, function() return self:GetTime() end)

    local overrideDuration = self.BuffData.overrideBuffDurations[buffId]
    if overrideDuration then
        BUFFS.SetBuffDuration(self.ComponentRoot.id, buffId, overrideDuration)
    end

    self:UpdateCraftRate()
    self.InstanceNeedsEncoding = true
end

function PlaceableCraftingStationController:OnBuffRemoved(buffId)
    self:UpdateCraftRate()
    self.InstanceNeedsEncoding = true
end

function PlaceableCraftingStationController:OnBuffRelinked(buffId)
    self:UpdateCraftRate()
    self.InstanceNeedsEncoding = true
end

function PlaceableCraftingStationController:UpdateBuffRates()
    local activeBuffs = BUFFS.GetBuffs(self.ComponentRoot.id)
    local drainBuffs = {}

    if self.RuntimeState.isReadyForCollect then
        drainBuffs = self.BuffData.drainWhileReady
    elseif self.RuntimeState.hasStartedCrafting then
        drainBuffs = self.BuffData.drainWhileCrafting
    else
        drainBuffs = self.BuffData.drainWhilePlaced
    end

    for _, buffId in ipairs(activeBuffs) do
        local rate = 0
        if drainBuffs[buffId] then
            rate = -1
        end

        BUFFS.SetBuffRate(self.ComponentRoot.id, buffId, rate)
    end
end

--- Time ---

function PlaceableCraftingStationController:GetNextTime(prevTime)
    -- Exit early if there is nothing to update
    if not self.RuntimeState.hasStartedCrafting then
        return prevTime
    end

    local minRemainingTime = nil
    for _, buffId in ipairs(BUFFS.GetBuffs(self.ComponentRoot.id)) do
        local buffRemainingTime = self:nil_zero_or_less(BUFFS.GetBuffRemainingTime(self.ComponentRoot.id, buffId, prevTime))
        minRemainingTime = self:safe_min(buffRemainingTime, minRemainingTime)
    end

    local remainingCraftTime = self:nil_zero_or_less(self.CraftCounter:GetRemainingTimeToMax(prevTime))
    minRemainingTime = self:safe_min(remainingCraftTime, minRemainingTime)

    if minRemainingTime then
        return minRemainingTime + prevTime
    end
end

function PlaceableCraftingStationController:OnStepTime(currentTime)
    -- If the step time was in the past, do nothing
    if currentTime < self.RuntimeState.time then
        return
    end

    self.RuntimeState.time = currentTime
    self:UpdateRuntimeState()

    BUFFS.HandleFinishedTimedBuffs(self.ComponentRoot.id)
end

function PlaceableCraftingStationController:OnStepTimeEnd()
    if Environment.IsServer() then
        if self.InstanceNeedsEncoding then
            self.InstanceNeedsEncoding = false
            self:RuntimeStateToInstance()
        end
    end
end

--- Crafting ---

function PlaceableCraftingStationController:GetCraftRate()
    local attribute = Attribute.New(self.PlaceableData.CraftRate)
    for _, buffId in pairs(BUFFS.GetBuffs(self.ComponentRoot.id)) do
        local multiplier = self.BuffData.buffCraftRateAddMultipliers[buffId]
        if multiplier then
            attribute:IncreaseMultiplier(multiplier)
        end
    end

    return attribute:GetTotal()
end

function PlaceableCraftingStationController:UpdateCraftRate()
    local craftRate = 0
    if self.RuntimeState.hasStartedCrafting then
        local craftSeconds = self.RuntimeState.recipeData.CraftSeconds * self.RuntimeState.amountToCraft

        -- Avoid dividing by 0
        craftSeconds = math.max(craftSeconds, 0.001)

        local attribute = Attribute.New(self.PlaceableData.CraftRate / craftSeconds)
        for _, buffId in pairs(BUFFS.GetBuffs(self.ComponentRoot.id)) do
            local multiplier = self.BuffData.buffCraftRateAddMultipliers[buffId]
            if multiplier then
                attribute:IncreaseMultiplier(multiplier)
            end
        end
        craftRate = attribute:GetTotal()
    end

    self.CraftCounter:SetRateOfChange(craftRate)
end

-- Server Only. Starts crafting on this Crafting Station.
function PlaceableCraftingStationController:StartCrafting(uniqueId, recipeId, amountToCraft)
    if not Environment.IsServer() then return end

    self:UpdateRuntimeState()

    self.RuntimeState.uniqueId = uniqueId
    self.RuntimeState.recipeId = recipeId
    self.RuntimeState.recipeData = CRAFTING.GetRecipeData(recipeId)
    self.RuntimeState.amountToCraft = amountToCraft
    self.RuntimeState.hasStartedCrafting = true

    self:UpdateCraftRate()
    self:UpdateLinkedBuffs()
    self:RuntimeStateToInstance()

    REPLICATOR.ModifyInstance(self.Instance)

    Events.Broadcast(CRAFTING.Events.StartedCrafting, self.CraftingStationId, recipeId, amountToCraft)
end

-- Server Only. Collects finished product from this Crafting Station.
function PlaceableCraftingStationController:CollectCrafting()
    if not Environment.IsServer() then return end

    self:UpdateRuntimeState()

    local recipeId = self.RuntimeState.recipeId
    local amountToCraft = self.RuntimeState.amountToCraft

    self.RuntimeState.uniqueId = nil
    self.RuntimeState.recipeId = nil
    self.RuntimeState.recipeData = nil
    self.RuntimeState.amountToCraft = 0
    self.RuntimeState.hasStartedCrafting = false

    self:RemoveBuffsOnCollect()
    self:UpdateCraftRate()
    self:UpdateLinkedBuffs()
    self:RuntimeStateToInstance()

    REPLICATOR.ModifyInstance(self.Instance)

    Events.Broadcast(CRAFTING.Events.CraftingCollected, self.CraftingStationId, recipeId, amountToCraft)
end

-- Server Only. Collects finished product from this Crafting Station.
function PlaceableCraftingStationController:ResetCrafting()
    if not Environment.IsServer() then return end

    self:UpdateRuntimeState()

    self.RuntimeState.uniqueId = nil
    self.RuntimeState.recipeId = nil
    self.RuntimeState.recipeData = nil
    self.RuntimeState.amountToCraft = 0
    self.RuntimeState.hasStartedCrafting = false

    self:UpdateCraftRate()
    self:UpdateLinkedBuffs()
    self:RuntimeStateToInstance()

    REPLICATOR.ModifyInstance(self.Instance)

    Events.Broadcast(CRAFTING.Events.CraftingReset, self.CraftingStationId)
end

-- Server Only. Updates the state of this Crafting Station.
function PlaceableCraftingStationController:UpdateState(state)
    if not Environment.IsServer() then return end

    self:UpdateRuntimeState()

    local recipeData
    if state.recipeId then
        recipeData = CRAFTING.GetRecipeData(state.recipeId)
    end

    self.RuntimeState.uniqueId = state.uniqueId
    self.RuntimeState.recipeId = state.recipeId
    self.RuntimeState.recipeData = recipeData
    self.RuntimeState.amountToCraft = state.amountToCraft
    self.RuntimeState.hasStartedCrafting = state.recipeId ~= nil

    self:UpdateCraftRate()
    self:UpdateLinkedBuffs()
    self:RuntimeStateToInstance()

    REPLICATOR.ModifyInstance(self.Instance)
end

local controller = PlaceableCraftingStationController:New(COMPONENT_ROOT)
controller:Initialize()