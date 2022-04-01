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
    This script runs on each Placeable Inventory on the client and the server.
--]]

local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

-- Required APIs
local SERIALIZER = require(script:GetCustomProperty("APISerializer")) ---@type APISerializer
local BUFFS = require(script:GetCustomProperty("APIBuffs")) ---@type APIBuffs
local DATABASE = require(script:GetCustomProperty("APIDatabase")) ---@type APIDatabase
local EQUIPMENT = require(script:GetCustomProperty("APIEquipment")) ---@type APIEquipment
local INVENTORY = require(script:GetCustomProperty("APIInventory")) ---@type APIInventory
local ITEM_PICKUPS = require(script:GetCustomProperty("APIItemPickups")) ---@type APIItemPickups
local PLAYER_LOTS = require(script:GetCustomProperty("APIPlayerLots")) ---@type APIPlayerLots

---@type PlaceableControllerBase
local PlaceableControllerBase = require(script:GetCustomProperty("PlaceableControllerBase"))

---@class PlaceableInventoryController
local PlaceableInventoryController = PlaceableControllerBase:extend()

function PlaceableInventoryController:New(rootObject)
    local controller = PlaceableInventoryController:new()
    controller:InitializePlaceable(rootObject)
    controller:InitializeInventory()
    return controller
end

function PlaceableInventoryController:InitializeInventory()
    self:ClearBuffData()
    self:InstanceToRuntimeState()
    self:UpdateLinkedBuffs()
    self:RuntimeStateToInstance()

    -- Register Inventory on server
    if Environment.IsServer() then
        INVENTORY.RegisterInventory(self.RuntimeState.inventoryId, true)
    end
end

---Override to unregister Inventory
function PlaceableInventoryController:PreDestroy()
    if Environment.IsServer() then
        INVENTORY.UnregisterInventory(self.RuntimeState.inventoryId)
    end
end

---Override to add the open Inventory interaction
function PlaceableInventoryController:InitializeEquipmentInteractions()
    return {
        self:NewBuffPlaceableInteraction(),
        self:NewRemovePlaceableInteraction(),
        self:NewOpenInventoryInteraction()
    }
end

---Override to include Inventory Id
function PlaceableInventoryController:InstanceToRuntimeState()
    local inventoryId, buffState
    if not self.Instance.state or self.Instance.state == "" then
        inventoryId, buffState = self:GetDefaultState()
    else
        -- Deal with state potentially being a raw Inventory Id
        if INVENTORY.IsContainerInventoryId(self.Instance.state) then
            inventoryId, buffState = self.Instance.state, {}
        else
            inventoryId, buffState = SERIALIZER.ReadString(self.Instance.state)
        end
    end

    self.RuntimeState.inventoryId = inventoryId
    self.RuntimeState.time = self.Instance.serverTime

    self:UpdateBuffData()

    BUFFS.ReadBuffsFromTable(self.ComponentRoot.id, buffState or {}, function() return self:GetTime() end)

    self:UpdateLinkedBuffs()
end

---Override to include Inventory Id
function PlaceableInventoryController:RuntimeStateToInstance()
    local buffState = BUFFS.WriteBuffsToTable(self.ComponentRoot.id, self:GetTime())
    self.Instance.state = SERIALIZER.WriteString(self.RuntimeState.inventoryId, buffState)
    self.Instance.serverTime = self.RuntimeState.time
end

---Validates and returns the default state
---@return boolean
---@return table
function PlaceableInventoryController:GetDefaultState()
    if self.Instance.existingCoreObject then
        local placeholderInventoryId = self.Instance.existingCoreObject:GetCustomProperty("InventoryId")
        if placeholderInventoryId and placeholderInventoryId ~= "" then
            local inventoryId = placeholderInventoryId

            -- See if this placeable is on a lot to derive an owner
            local playerLotId = PLAYER_LOTS.FindLotByAncestors(COMPONENT_ROOT)
            if playerLotId then
                local player = PLAYER_LOTS.GetOwner(playerLotId)
                if not player then
                    warn(string.format("Placeable Inventory should not be loaded on a Player Lot with no owner. The Player Lot Replicator Loader for \"%s\" should have \"RequireOwnerToLoad\" checked", self.Instance.existingCoreObject.name))
                end
                inventoryId = INVENTORY.GetUniqueContainerId(player, nil, placeholderInventoryId)
            end
            return inventoryId, {}
        end
    end
    return nil, {}
end

---Override to include Inventory Id
function PlaceableInventoryController:GetState()
    ---@class PlaceableInventoryState
    local result = {
        placeableId = self.RuntimeState.placeableId,
        replicatorId = self.Instance.replicatorId,
        position = self.RuntimeState.position,
        rotation = self.RuntimeState.rotation,
        buffData = self.BuffData,
        buffTargetId = self.ComponentRoot.id,
        inventoryId = self.RuntimeState.inventoryId
    }
    return result
end

---Overridden to disable removal based on settings regarding what to do with items that are in the inventory.
function PlaceableInventoryController:CanRemovePlaceableDerived(player, toolType, equipmentSettings)
    if self.PlaceableData.AllowNonEmptyRemoval == false then
        local inventory = INVENTORY.GetInventory(player, self.RuntimeState.inventoryId)

        local hasContent = false
        for _,item in pairs(inventory:GetItems()) do
            if item and item.count > 0 then
                hasContent = true
                break
            end
        end

        if hasContent == true then
            return false, string.format("%s can't be removed when it contains items.", self.RuntimeState.placeableId)
        end
    elseif not self.PlaceableData.DestroyContentsOnRemove and not self.PlaceableData.DropContentsInWorldOnRemove then
        -- Ensure contents can fit into the player's inventory if they drop directly into it
        local inventory = INVENTORY.GetInventory(player, self.RuntimeState.inventoryId)
        local itemsToTransfer = {}
        for _, item in pairs(inventory:GetItems()) do
            if item.count > 0 then
                local itemId = item:GetCustomProperty("ItemId")
                local itemEntry = itemsToTransfer[itemId] or 0
                itemsToTransfer[itemId] = itemEntry + item.count
            end
        end

        if not INVENTORY.CanAddItemsToInventory(player, nil, itemsToTransfer, false) then
            return false, string.format("Can't remove %s because there is no room in Inventory for the contents", self.RuntimeState.placeableId)
        end
    end

    return true
end

---Handle the contents of the inventory when removed.
function PlaceableInventoryController:PreRemove(player)
    local inventory = INVENTORY.GetInventory(player, self.RuntimeState.inventoryId)

    if self.PlaceableData.DestroyContentsOnRemove then
        -- Destroy the items
        INVENTORY.ClearInventory(player, self.RuntimeState.inventoryId, false, true)
    elseif self.PlaceableData.DropContentsInWorldOnRemove then
        -- Drop the items on the ground
        local itemPickups = {}
        for _, item in pairs(inventory:GetItems()) do
            itemPickups[#itemPickups+1] = ITEM_PICKUPS.CreatePickupData(ITEM_PICKUPS.PickupType.Item, INVENTORY.ItemType.Item, item:GetCustomProperty("ItemId"), item.count, 0)
        end
        ITEM_PICKUPS.CreateItemPickups(player, self.PlaceableData.DropItemPickupTemplate, self.RuntimeState.position, 0, itemPickups, self.PlaceableData.DropsForAllPlayers, true, self.PlaceableData.DropTimeoutSeconds)
        INVENTORY.ClearInventory(player, self.RuntimeState.inventoryId, false, true)
    else
        -- Place items directly into the player's inventory
        for _, item in pairs(inventory:GetItems()) do
            INVENTORY.AddToInventory(player, nil, item:GetCustomProperty("ItemType"), item:GetCustomProperty("ItemId"), item.count, nil, false)
        end
        INVENTORY.ClearInventory(player, self.RuntimeState.inventoryId, false, true)
    end
end

---Handle opening the Inventory
---@return function
function PlaceableInventoryController:NewOpenInventoryInteraction()
    return function(player, target, toolType, equipmentSettings, doInteract)
        local canOpen, canOpenError = self:CanOpenInventory(player, toolType, equipmentSettings)
        if canOpen then
            Events.Broadcast("CanEquipmentInteract", "OpenPlaceableInventory", target, toolType, equipmentSettings)
            if doInteract then
                -- Event expects screenId, additional params are passed to the screen
                local inventoryId = INVENTORY.GetBaseInventoryId(self.RuntimeState.inventoryId)
                Events.Broadcast("UI_showScreen", inventoryId, self.RuntimeState.inventoryId)
            end
            return true, nil
        end
        return false, canOpenError
    end
end

---Returns true if the Inventory can be opened with the currently equipped Tool, otherwise returns false and some text
---that should explain how to open the Inventory
---@param player Player
---@param toolType string
---@param equipmentSettings EquipmentSettings
---@return boolean
---@return string
function PlaceableInventoryController:CanOpenInventory(player, toolType, equipmentSettings)
    local placeableData = self.PlaceableData
    if not EQUIPMENT.IsValidToolType(placeableData.ValidOpenToolTypes, toolType, equipmentSettings)  then
        return false, placeableData.OpenInventoryInteractionText
    end
    return true, nil
end

local controller = PlaceableInventoryController:New(COMPONENT_ROOT)
controller:Initialize()