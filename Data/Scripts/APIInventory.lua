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
    This is the core of the Inventory system and handles most Inventory interactions. This API exists on both the client
    and server.
--]]

-- Internal Variables
local DEFAULT_ITEM_PICKUP_TEMPLATE = script:GetCustomProperty("DefaultItemPickupTemplate")
local DEFAULT_ICON = script:GetCustomProperty("DefaultIcon")
local INVENTORY_CONTEXT_ASSET = script:GetCustomProperty("InventoryContextAsset")
local INVENTORY_ASSET = script:GetCustomProperty("InventoryAsset")
local INVENTORY_ITEM_ASSET = script:GetCustomProperty("InventoryItemAsset")
local DATABASE = require(script:GetCustomProperty("APIDatabase")) ---@type APIDatabase
local RELIABLE_EVENTS = require(script:GetCustomProperty("APIReliableEvents")) ---@type APIReliableEvents
local TAGS = require(script:GetCustomProperty("APITags")) ---@type APITags
local DATA_MIGRATION = require(script:GetCustomProperty("APIDataMigration")) ---@type APIDataMigration

-- Constants
local INVENTORY_TAG = "INV_"
local CONTAINER_TAG = "CON_"
local VERSION_TAG = "_V" -- Deprecated, using Data Migration versioning now
local INVENTORY_DATA_VERSION = 1

-- Private Variables
local inventoryContext = nil
local inventories = {}
local loadingInventories = {}
local priorityInventories = {}
local containerIds = {}
local pendingActions = {}
local clientSyncTask
local uuidNums = {}
local updateFlag = 0
local syncFlag = 0

---@class APIInventory
local API = {}

-- These events can be accessed like: Events.Connect(APIInventory.Events.EventName, Handler)
API.Events = {
    -- Internal Events
    LoadInventories = INVENTORY_TAG .. "load",
    AddInventory = INVENTORY_TAG .. "add",
    RemoveInventory = INVENTORY_TAG .. "remove",
    TransferInventory = INVENTORY_TAG .. "transfer",
    ClearInventory = INVENTORY_TAG .. "clear",
    -- Public Events
    InventoryRegistered = INVENTORY_TAG .. "registered",
    InventoryUnregistered = INVENTORY_TAG .. "unregistered",
    InventoryLoaded = INVENTORY_TAG .. "loaded",
    InventorySaved = INVENTORY_TAG .. "saved",
    InventoryAdded = INVENTORY_TAG .. "added",
    InventoryRemoved = INVENTORY_TAG .. "removed",
    InventoryTransferred = INVENTORY_TAG .. "transferred",
    InventoryCleared = INVENTORY_TAG .. "cleared",
    SlotEquipped = INVENTORY_TAG .. "slotEquipped",
    SlotUnequipped = INVENTORY_TAG .. "slotUnequipped",
    SlotClicked = INVENTORY_TAG .. "slotClicked",
    SlotDropped = INVENTORY_TAG .. "slotDropped",
    SlotRightClicked = INVENTORY_TAG .. "slotRightClicked",
}

---@class InventorySetting
API.Setting = {
    Name = "Name",
    DefaultIcon = "DefaultIcon",
    StorageKey = "StorageKey",
    TotalSlots = "TotalSlots",
    SlotCapacity = "SlotCapacity",
    IsContainer = "IsContainer",
    AllowNonEmptyContainers = "AllowNonEmptyContainers",
    UseStacks = "UseStacks",
    CanEquip = "CanEquip",
    CanDrop = "CanDrop",
    DropForAllPlayers = "DropForAllPlayers",
    DropTimeoutSeconds = "DropTimeoutSeconds",
    ItemPickupTemplate = "ItemPickupTemplate",
    Priority = "Priority",
    StartingItems = "StartingItems",
    AllowedItems = "AllowedItems",
    OverflowInventoryIds = "OverflowInventoryIds",
    VerboseLogs = "VerboseLogs"
}

-- Item types are used to determine what kind of object is stored in the Inventory
API.ItemType = {
    Item = 1,
    Inventory = 2
}

-- These values can be used to look up properties of item data from the database.
API.ItemSettings = {
    StackLimit = "StackLimit",
    Tags = "Tags",
}

-- These short form keys save storage space.
API.Keys = {
    -- Internal keys
    UpdateFlag = "f",
    InventoryId = "id",
    Actions = "o",
    Action = "u",
    ActionParams = "p",
    -- Public keys
    ItemType = "t",
    ItemId = "i",
    Amount = "a",
    Contents = "c",
    State = "s"
}

API.DefaultSettings = {
    [API.Setting.Name] = "Inventory",
    [API.Setting.DefaultIcon] = DEFAULT_ICON,
    [API.Setting.StorageKey] = nil,
    [API.Setting.TotalSlots] = 10,
    [API.Setting.SlotCapacity] = 99,
    [API.Setting.IsContainer] = false,
    [API.Setting.AllowNonEmptyContainers] = false,
    [API.Setting.UseStacks] = true,
    [API.Setting.CanEquip] = true,
    [API.Setting.CanDrop] = true,
    [API.Setting.DropForAllPlayers] = true,
    [API.Setting.ItemPickupTemplate] = DEFAULT_ITEM_PICKUP_TEMPLATE,
    [API.Setting.Priority] = 1,
    [API.Setting.StartingItems] = {},
    [API.Setting.AllowedItems] = {},
    [API.Setting.OverflowInventoryIds] = {},
    [API.Setting.VerboseLogs] = false
}

---Server Only. Registers and loads an Inventory.
---@param inventoryId string
---@param isContainer boolean
function API.RegisterInventory(inventoryId, isContainer)
    if not inventoryId then
        warn("RegisterInventory can not be called with a nil Inventory Id")
        return
    end

    if not Environment.IsServer() then
        warn("RegisterInventory can only be called on the server")
        return
    end

    if API.IsInventoryRegistered(inventoryId) then
        return
    end

    inventories[inventoryId] = {}
    SortInventoriesByPriority()
    SanitizeSettings(inventoryId)

    if isContainer then
        containerIds[inventoryId] = true
    end

    Events.Broadcast(API.Events.InventoryRegistered, inventoryId)

    -- Send information related to this Inventory to all Players
    for _, player in ipairs(Game.GetPlayers()) do
        LoadInventory(player, inventoryId)
    end
end

---Server Only. Unregisters a Container Inventory.
---@param inventoryId string
function API.UnregisterInventory(inventoryId)
    if not Environment.IsServer() then
        warn("UnregisterInventory can only be called on the server")
        return
    end

    --print(string.format("Unregistering Inventory id: %s", inventoryId))

    if inventories[inventoryId] then
        for _, playerInventory in pairs(inventories[inventoryId]) do
            playerInventory:Destroy()
        end
        inventories[inventoryId] = nil
    end

    containerIds[inventoryId] = nil

    Events.Broadcast(API.Events.InventoryUnregistered, inventoryId)

    -- Send information related to this Inventory to all Players
    for _, player in ipairs(Game.GetPlayers()) do
        SyncInventoryWithClient(player, inventoryId, API.Events.InventoryUnregistered)
    end
end

---Returns true if any Inventory has been registered.
---@param includeContainers boolean
---@return boolean
function API.IsAnyInventoryRegistered(includeContainers)
    for inventoryId, _ in pairs(inventories) do
        if includeContainers or not API.IsContainerInventory(inventoryId) then
            return true
        end
    end
    return false
end

---Returns true if the Inventory has been registered.
---@param inventoryId string
---@return boolean
function API.IsInventoryRegistered(inventoryId)
    return inventories[inventoryId] ~= nil
end

---Returns true if the Inventory has been loaded for a specific Player.
---@param player Player
---@param inventoryId string
---@return boolean
function API.IsInventoryLoaded(player, inventoryId)
    if not API.IsInventoryRegistered(inventoryId) then return false end
    return inventories[inventoryId][player] ~= nil
end

---Gets a setting for a specific Inventory.
---@param inventoryId string
---@param setting InventorySetting
---@return any
function API.GetSetting(inventoryId, setting)
    local baseInventoryId = inventoryId
    if not DATABASE.Inventories[baseInventoryId] then
        -- Derive base Inventory Id from containers
        baseInventoryId = API.GetBaseInventoryId(inventoryId)
    end

    if not DATABASE.Inventories[baseInventoryId] or DATABASE.Inventories[baseInventoryId][setting] == nil then
        return API.DefaultSettings[setting]
    end

    return DATABASE.Inventories[baseInventoryId][setting]
end

---Gets the table of all settings for a specific Inventory.
---@param inventoryId string
---@return table|nil
function API.GetSettings(inventoryId)
    local baseInventoryId = inventoryId
    if not DATABASE.Inventories[baseInventoryId] then
        -- Derive base Inventory Id from containers
        baseInventoryId = API.GetBaseInventoryId(inventoryId)
    end

    return DATABASE.Inventories[baseInventoryId]
end

---Returns all registered Inventories.
---@return table
function API.GetInventories()
    return inventories
end

---Gets the Inventory contents for a specific Player.
---@param player Player
---@param inventoryId string
---@return table
function API.GetInventory(player, inventoryId)
    if not API.IsInventoryLoaded(player, inventoryId) then
        Warning(inventoryId, string.format("Could not get Inventory: %s, make sure it is loaded before you try to access it", inventoryId))
        return nil
    end

    return inventories[inventoryId][player]
end

---Returns true if the Player has the amount of an item in one or more Inventories. If slotIndex is used this will only check that slot.
---@param player Player
---@param inventoryId string|nil
---@param itemType integer
---@param itemId string
---@param amount integer
---@param slotIndex integer
---@param includeContainers boolean
---@return boolean
function API.HasAmountInInventory(player, inventoryId, itemType, itemId, amount, slotIndex, includeContainers)
    if amount <= 0 then
        Warning(inventoryId, string.format("Amount must be greater than 0 to check Inventory: %s for Player: %s (%s)", inventoryId, player.name, player.id))
        return false
    end

    return API.GetAmountInInventory(player, inventoryId, itemType, itemId, slotIndex, includeContainers) >= amount
end

---Returns the amount of an item in one or more Inventories for a Player. If slotIndex is used this will only check that slot.
---@param player Player
---@param inventoryId string|nil
---@param itemType integer
---@param itemId string
---@param slotIndex integer
---@param includeContainers boolean
---@return integer
function API.GetAmountInInventory(player, inventoryId, itemType, itemId, slotIndex, includeContainers)
    if includeContainers == nil then
        includeContainers = true
    end

    itemType = API.GetItemType(itemId)

    local amount = 0
    if inventoryId then
        if slotIndex and slotIndex > 0 then
            -- Check only the supplied slot index
            local item = API.GetItemInSlot(player, inventoryId, slotIndex)
            if DoesSlotMatch(item, itemType, itemId) then
                return item.count
            end
        else
            -- Check all slots
            local inventory = API.GetInventory(player, inventoryId)
            if inventory then
                for _, item in pairs(inventory:GetItems(itemId)) do
                    if DoesSlotMatch(item, itemType, itemId) then
                        amount = amount + item.count
                    end
                end
            end

            return amount
        end
    else
        -- No inventoryId means we check them all
        for inventoryId, _ in pairs(inventories) do
            if includeContainers or not API.IsContainerInventory(inventoryId) then
                amount = amount + API.GetAmountInInventory(player, inventoryId, itemType, itemId, slotIndex, false)
            end
        end
    end

    return amount
end

---Returns true if an amount of an item can be added to a specific Inventory for a Player. If slotIndex is used this will
---only check that slot, otherwise it will look for available slots.
---@param player Player
---@param inventoryId string
---@param itemType integer
---@param itemId string
---@param amount integer
---@param slotIndex integer
---@param includeContainers boolean
---@return boolean
---@return string
function API.CanAddToInventory(player, inventoryId, itemType, itemId, amount, slotIndex, includeContainers)
    if includeContainers == nil then
        includeContainers = true
    end

    if amount <= 0 then
        return false, "Invalid amount"
    end

    local result = nil
    local projection = nil

    itemType = API.GetItemType(itemId)

    if not inventoryId then
        result, projection = AssessOperationOnPriorityInventory(player, itemType, itemId, amount, true, nil, includeContainers)
    else
        result, projection = AssessItemAddition(player, inventoryId, itemType, itemId, amount, slotIndex)
    end

    if result == false then
        return result, "Not enough room for all of the items."
    else
        return true, nil
    end
end

---Returns true if a set of Drops can fit in the Inventory specified, or in any available Inventories.
---@param player Player
---@param inventoryId string|nil
---@param drops table Output from APIDrops.CalculateDrops()
---@param includeContainers boolean
---@return boolean
function API.CanAddToInventoryFromDrops(player, inventoryId,  drops, includeContainers)
    if not drops.Items then
        warn("Invalid Drops data. Drops must contain an Items table containing <itemId, amount> values")
        return false
    end
    return API.CanAddItemsToInventory(player, inventoryId,  drops.Items, includeContainers)
end

---Returns true if the list of Items can fit in the Inventory specified, or in any available Inventories.
---@param player Player
---@param inventoryId string|nil
---@param items table<string, integer> table<itemId, amount>
---@param includeContainers boolean
---@return boolean
---@return string
function API.CanAddItemsToInventory(player, inventoryId, items, includeContainers)
    if includeContainers == nil then
        includeContainers = true
    end

    local result = true
    local projection = {}

    for itemId, amount in pairs(items) do
        local itemType = API.GetItemType(itemId)
        if not inventoryId then
            result, projection = AssessOperationOnPriorityInventory(player, itemType, itemId, amount, true, nil, includeContainers, projection)
        else
            result, projection = AssessItemAddition(player, inventoryId, itemType, itemId, amount, nil, projection)
        end

        if result == false then
            return result, "Not enough room for all of the items."
        end
    end

    return true, nil
end

---Adds an amount of an item to one or More Inventories for a Player. If slotIndex is used this will only use that
---slot, otherwise it will look for available slots.
---@param player Player
---@param inventoryId string|nil
---@param itemType integer
---@param itemId string
---@param amount integer
---@param slotIndex integer
---@param includeContainers boolean
---@param updateOtherContext boolean
---@return boolean
function API.AddToInventory(player, inventoryId, itemType, itemId, amount, slotIndex, includeContainers, updateOtherContext)
    --print(string.format("Adding %d itemId: %s to Inventory: %s in slot: %d on server: %s for Player: %s (%s)", amount, itemId, inventoryId, slotIndex or 0, Environment.IsServer(), player.name, player.id))

    if includeContainers == nil then
        includeContainers = true
    end

    if amount <= 0 then
        Warning(inventoryId, string.format("Amount must be greater than 0 to add to Inventory: %s for Player: %s (%s)", inventoryId or "Any", player.name, player.id))
        return false
    end

    -- Default to always update the opposite context
    if updateOtherContext == nil then
        updateOtherContext = true
    end

    itemType = API.GetItemType(itemId)

    local result = nil
    local projection = nil
    if not inventoryId then
        result, projection = AssessOperationOnPriorityInventory(player, itemType, itemId, amount, true, nil, includeContainers)
    else
        result, projection = AssessItemAddition(player, inventoryId, itemType, itemId, amount, slotIndex)
    end

    if result == false then
        Warning(inventoryId, string.format("No available room in Inventory: %s for Player: %s (%s)", inventoryId or "Any", player.name, player.id))
        return false
    end

    for invId, slotData in pairs(projection) do
        for slot, data in pairs(slotData) do
            AddToInventory(player, invId, slot, data.itemType, data.itemId, data.amount)
            local amountData = {}
            amountData[slot] = data.amount

            -- Always send event in current context
            Events.Broadcast(API.Events.InventoryAdded, player, invId, data.itemType, data.itemId, amountData)

            if updateOtherContext then
                if Environment.IsServer() then
                    SyncInventoryWithClient(player, invId, API.Events.AddInventory, invId, data.itemType, data.itemId, data.amount, slot, includeContainers, false)
                else
                    RELIABLE_EVENTS.BroadcastToServer(API.Events.AddInventory, invId, data.itemType, data.itemId, data.amount, slot, includeContainers)
                end
            end
        end

        SaveInventory(player, invId)
    end

    return true
end

---Returns true if the list of Items can be removed from the Inventory specified, or from any available Inventories.
---@param player Player
---@param inventoryId string|nil
---@param items table<string, integer> table<itemId, amount>
---@param includeContainers boolean
---@return boolean
---@return string
function API.CanRemoveItemsFromInventory(player, inventoryId, items, includeContainers)
    if includeContainers == nil then
        includeContainers = true
    end

    local result = true
    local projection = {}

    for itemId, amount in pairs(items) do
        local itemType = API.GetItemType(itemId)
        if not inventoryId then
            result, projection = AssessOperationOnPriorityInventory(player, itemType, itemId, amount, false, nil, includeContainers, projection)
        else
            result, projection = AssessItemRemoval(player, inventoryId, itemType, itemId, amount, nil, projection)
        end

        if result == false then
            return result, "Not enough items to remove."
        end
    end

    return true, nil
end

---Returns true if an amount of an item can be removed from a specific Inventory for a Player. If slotIndex is used this will 
---only check that slot, otherwise it will check the entire Inventory.
---@param player Player
---@param inventoryId string|nil
---@param itemType integer
---@param itemId string
---@param amount integer
---@param slotIndex integer
---@param includeContainers boolean
---@return boolean
function API.CanRemoveFromInventory(player, inventoryId, itemType, itemId, amount, slotIndex, includeContainers)
    if includeContainers == nil then
        includeContainers = true
    end

    if amount <= 0 then
        return false, "Invalid amount"
    end

    itemType = API.GetItemType(itemId)

    local result = nil
    if not inventoryId then
        result, _ = AssessOperationOnPriorityInventory(player, itemType, itemId, amount, false, nil, includeContainers)
    else
        result, _ = AssessItemRemoval(player, inventoryId, itemType, itemId, amount, slotIndex)
    end

    if result == false then
        return result, "Not enough items to remove."
    else
        return true, nil
    end
end

---Removes an amount of an item from a specific Inventory for a Player. If slotIndex is used this will only check that slot, otherwise 
---it will check the entire Inventory.
---@param player Player
---@param inventoryId string
---@param itemType integer
---@param itemId string
---@param amount integer
---@param slotIndex integer
---@param includeContainers boolean
---@param updateOtherContext boolean
---@return boolean
function API.RemoveFromInventory(player, inventoryId, itemType, itemId, amount, slotIndex, includeContainers, updateOtherContext)
    --print(string.format("Removing %d itemId: %s from Inventory: %s from slot: %d on server: %s for Player: %s (%s)", amount, itemId, inventoryId, slotIndex or 0, Environment.IsServer(), player.name, player.id))

    if includeContainers == nil then
        includeContainers = true
    end

    if amount <= 0 then 
        Warning(inventoryId, string.format("Amount must be greater than 0 to remove from Inventory: %s for Player: %s (%s)", inventoryId or "Any", player.name, player.id))
        return false
    end

    -- Default to always update opposite context
    if updateOtherContext == nil then
        updateOtherContext = true
    end

    itemType = API.GetItemType(itemId)

    local result = nil
    local projection = nil
    if not inventoryId then
        result, projection = AssessOperationOnPriorityInventory(player, itemType, itemId, amount, false, nil, includeContainers)
    else
        result, projection = AssessItemRemoval(player, inventoryId, itemType, itemId, amount, slotIndex)
    end

    if result == false then
        Warning(inventoryId, string.format("Not enough items for removal in Inventory: %s for Player: %s (%s)", inventoryId or "Any", player.name, player.id))
        return false
    end

    for invId, slotData in pairs(projection) do
        for slot, data in pairs(slotData) do
            RemoveFromInventory(player, invId, slot, data.amount)
            local amountData = {}
            amountData[slot] = data.amount

            -- Always send event in current context
            Events.Broadcast(API.Events.InventoryRemoved, player, invId, data.itemType, data.itemId, amountData)

            if updateOtherContext then
                if Environment.IsServer() then
                    SyncInventoryWithClient(player, invId, API.Events.RemoveInventory, invId, data.itemType, data.itemId, data.amount, slot, includeContainers, false)
                else
                    RELIABLE_EVENTS.BroadcastToServer(API.Events.RemoveInventory, invId, data.itemType, data.itemId, data.amount, slot, includeContainers)
                end
            end
        end

        SaveInventory(player, invId)
    end

    return true
end

---Returns true if a slot can be moved from one Inventory to another, or to another slot in the same Inventory. If targetSlotIndex is not 
---defined a target slot will be found.
---@param player Player
---@param sourceInventoryId string
---@param sourceSlotIndex integer
---@param targetInventoryId string
---@param targetSlotIndex integer
---@return boolean
function API.CanTransferToInventory(player, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex)
    local sourceItem = API.GetItemInSlot(player, sourceInventoryId, sourceSlotIndex)
    local targetItem = API.GetItemInSlot(player, targetInventoryId, targetSlotIndex)
    local totalTargetSlots = API.GetSetting(targetInventoryId, API.Setting.TotalSlots)

    local itemType = sourceItem:GetCustomProperty("ItemType")
    local itemId = sourceItem:GetCustomProperty("ItemId")
    local amount = sourceItem.count

    if not IsAllowedItem(targetInventoryId, itemId) then
        return false
    end

    if not targetSlotIndex or targetSlotIndex == 0 then
        -- Ensure we have a target slot index
        targetSlotIndex = API.GetAvailableSlotIndex(player, targetInventoryId, itemType, itemId, amount)
    else
        -- Ensure the target slot does not conflict with stacking restrictions across multiple slots
        if targetInventoryId ~= sourceInventoryId and not API.GetSetting(targetInventoryId, API.Setting.UseStacks) then
            local existingIndex = API.GetSlotIndexForItem(player, targetInventoryId, itemType, itemId)
            if existingIndex > 0 and existingIndex ~= targetSlotIndex then
                return false
            end
        end
    end

    if targetSlotIndex == 0 or targetSlotIndex > totalTargetSlots then
        return false
    end

    if targetItem then
        if not IsAllowedItem(sourceInventoryId, targetItem:GetCustomProperty("ItemId")) then
            return false
        end

        local sourceSlotCapacity = GetStackLimit(sourceInventoryId, targetItem:GetCustomProperty("ItemId"))
        local targetSlotCapacity = GetStackLimit(targetInventoryId, itemId)

        if DoesSlotMatch(targetItem, itemType, itemId) then
            -- Adjust amount to fit stack
            if amount > targetSlotCapacity - targetItem.count then
                amount = targetSlotCapacity - targetItem.count
            end

            -- Check if the target slot is full
            if amount <= 0 then
                -- Verify the amount will fit
                if sourceItem.count > targetSlotCapacity or targetItem.count > sourceSlotCapacity then
                    return false
                end
            end
        else
            -- Verify the amount will fit
            if sourceItem.count > targetSlotCapacity or targetItem.count > sourceSlotCapacity then
                return false
            end
        end
    end

    return true
end

---Moves the contents of a slot from one Inventory to another, or within the same Inventory. If the target slot has content this will swap 
---it with the source slot. If targetSlotIndex is not defined a target slot will be found.
---@param player Player
---@param sourceInventoryId string
---@param sourceSlotIndex integer
---@param targetInventoryId string
---@param targetSlotIndex integer
---@param updateOtherContext boolean
---@return boolean
function API.TransferToInventory(player, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex, updateOtherContext)
    --print(string.format("Transferring slot: %d from Inventory: %s to slot: %d in Inventory: %s on server: %s for Player: %s (%s)", sourceSlotIndex, sourceInventoryId, targetSlotIndex, targetInventoryId, Environment.IsServer(), player.name, player.id))

    if not sourceSlotIndex or sourceSlotIndex < 1 then
        Warning(sourceInventoryId, string.format("A source slot must be provided to transfer to Inventory: %s", sourceInventoryId))
        return false
    end

    local sourceItem = API.GetItemInSlot(player, sourceInventoryId, sourceSlotIndex)
    if not sourceItem then
        Warning(sourceInventoryId, "There was no source item to transfer.")
        return false
    end

    local itemType = sourceItem:GetCustomProperty("ItemType")
    local itemId = sourceItem:GetCustomProperty("ItemId")
    local amount = sourceItem.count

    -- Ensure we have a target slot index
    if not targetSlotIndex then
        targetSlotIndex = API.GetAvailableSlotIndex(player, targetInventoryId, itemType, itemId, amount)
    end

    local targetItem = API.GetItemInSlot(player, targetInventoryId, targetSlotIndex)
    local totalTargetSlots = API.GetSetting(targetInventoryId, API.Setting.TotalSlots)

    if targetSlotIndex == 0 or (totalTargetSlots > 0 and targetSlotIndex > totalTargetSlots) then
        Warning(targetInventoryId, string.format("Target Inventory full or target slot is invalid or out of bounds in Inventory: %s for Player: %s (%s)", targetInventoryId, player.name, player.id))
        return false
    end

    if not API.CanTransferToInventory(player, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex) then
        Warning(sourceInventoryId, string.format("Cannot transfer from Inventory: %s to Inventory: %s for Player: %s (%s)", sourceInventoryId, targetInventoryId, player.name, player.id))
        return false
    end

    if targetItem then
        local sourceSlotCapacity = GetStackLimit(sourceInventoryId, targetItem:GetCustomProperty("ItemId"))
        local targetSlotCapacity = GetStackLimit(targetInventoryId, itemId)

        if DoesSlotMatch(targetItem, itemType, itemId) then
            -- Adjust amount to fit stack
            if amount > targetSlotCapacity - targetItem.count then
                amount = targetSlotCapacity - targetItem.count
            end

            -- Check if the target slot is full
            if amount <= 0 then
                -- Verify the amount will fit
                if sourceItem.count > targetSlotCapacity or targetItem.count > sourceSlotCapacity then
                    Warning(sourceInventoryId, string.format("Cannot fit amount in Inventory: %s for Player: %s (%s)", sourceInventoryId, player.name, player.id))
                    return false
                end

                -- Just swap the stacks
                SwapBetweenInventory(player, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex)
            else
                TransferToInventory(player, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex, itemType, itemId, amount)
            end
        else
            -- Verify the amount will fit
            if sourceItem.count > targetSlotCapacity or targetItem.count > sourceSlotCapacity then
                Warning(sourceInventoryId, string.format("Cannot fit amount in Inventory: %s for Player: %s (%s)", sourceInventoryId, player.name, player.id))
                return false
            end

            -- Target slot contains a different item, do a swap
            SwapBetweenInventory(player, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex)
        end
    else
        -- Empty target slot
        amount = math.min(amount, API.GetSetting(targetInventoryId, API.Setting.SlotCapacity))

        TransferToInventory(player, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex, itemType, itemId, amount)
    end

    -- Always send event in current context
    Events.Broadcast(API.Events.InventoryTransferred, player, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex)

    -- Default to always update client
    if updateOtherContext == nil then
        updateOtherContext = true
    end

    -- Handle client and server interactions to ensure the API is replicated on both sides
    if Environment.IsServer() then
        -- Save and update the client from the server
        if not SaveInventory(player, sourceInventoryId) then
            return false
        end

        if sourceInventoryId ~= targetInventoryId then
            if not SaveInventory(player, targetInventoryId) then
                return false
            end
        end

        -- Send client information if needed
        if updateOtherContext then
            SyncInventoryWithClient(player, sourceInventoryId, API.Events.TransferInventory, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex, false)
        end
    elseif Environment.IsClient() then
        if updateOtherContext then
            -- Handle removing inventory from the client
            RELIABLE_EVENTS.BroadcastToServer(API.Events.TransferInventory, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex)
        end
    end

    return true
end

---Resets all storage keys for inventories from a given player,
---and clears any inventory data from player storage.
---@param player Player
function API.ClearAllInventories(player, resetToStartingItems)
    -- Prune old inventory keys from player storage
    local playerData = Storage.GetPlayerData(player)
    for key,_ in pairs(playerData) do
        if API.IsInventoryKey(key) then
            playerData[key] = nil
        end
    end
    Storage.SetPlayerData(player, playerData)

    -- Reset all currently registered inventories
    for inventoryId, _ in pairs(inventories) do
        API.ClearInventory(player, inventoryId, resetToStartingItems)
    end
end

---Clears an Inventory for a Player.
---@param player Player
---@param inventoryId string
---@param resetToStartingItems boolean
---@param updateOtherContext boolean
---@return boolean
function API.ClearInventory(player, inventoryId, resetToStartingItems, updateOtherContext)
    --print(string.format("Clearing Inventory: %s on server: %s for Player: %s (%s)", inventoryId, Environment.IsServer(), player.name, player.id))

    if not API.IsInventoryRegistered(inventoryId) then
        Warning(inventoryId, string.format("Missing Inventory: %s", inventoryId))
        return false
    end

    -- Clear the content
    if resetToStartingItems then
        inventories[inventoryId][player] = DeserializeInventory(player, inventoryId, API.CreateInventoryData(player, inventoryId))
    else
        inventories[inventoryId][player] = DeserializeInventory(player, inventoryId, {})
    end

    -- Always send event in current context
    Events.Broadcast(API.Events.InventoryCleared, player, inventoryId, resetToStartingItems)

    -- Default to always update client
    if updateOtherContext == nil then
        updateOtherContext = true
    end

    -- Handle client and server interactions to ensure the API is replicated on both sides
    if Environment.IsServer() then
        -- Save and update the client from the server
        if not SaveInventory(player, inventoryId) then
            return false
        end

        -- Send client information if needed
        if updateOtherContext then
            SyncInventoryWithClient(player, inventoryId, API.Events.ClearInventory, inventoryId, resetToStartingItems, false)
        end
    elseif Environment.IsClient() then
        if updateOtherContext then
            -- Handle clearing inventory from the client
            RELIABLE_EVENTS.BroadcastToServer(API.Events.ClearInventory, inventoryId, resetToStartingItems)
        end
    end

    return true
end

---Creates a default Inventory contents table.
---@return table
function API.CreateInventoryData(player, inventoryId)
    local contents = {}

    local startingItems = DATABASE.StartingItems
    if not startingItems then
        return contents
    end

    for _, startingItemData in pairs(startingItems) do
        if type(startingItemData) == "table" and startingItemData.InventoryId == inventoryId then
            local itemData = DATABASE.Items[startingItemData.ItemId]
            if itemData and startingItemData.Amount > 0 then
                local itemType = API.ItemType.Item
                local itemId = startingItemData.ItemId

                if IsAllowedItem(inventoryId, itemId) then
                    -- Handle containers
                    if itemData.IsInventory then
                        itemType = API.ItemType.Inventory
                        itemId = API.GetUniqueContainerId(player, itemId, itemData.InventoryId, true)
                    end

                    local maxCapacity
                    if IsUniquePerInstance(itemType) then
                        maxCapacity = 1
                    else
                        maxCapacity = GetStackLimit(inventoryId, itemId)
                    end

                    if startingItemData.SlotIndex > 0 and not contents[startingItemData.SlotIndex] then
                        -- Add to specific slot
                        contents[startingItemData.SlotIndex] = {
                            [API.Keys.ItemType] = itemType,
                            [API.Keys.ItemId] = itemId,
                            [API.Keys.Amount] = CoreMath.Clamp(startingItemData.Amount, 1, maxCapacity)
                        }
                    else
                        -- Add to any slot
                        local added = false
                        for slotIndex = 1, API.GetSetting(inventoryId, API.Setting.TotalSlots), 1 do
                            if not contents[slotIndex] then
                                contents[slotIndex] = {
                                    [API.Keys.ItemType] = itemType,
                                    [API.Keys.ItemId] = itemId,
                                    [API.Keys.Amount] = CoreMath.Clamp(startingItemData.Amount, 1, maxCapacity)
                                }

                                added = true
                                break
                            end
                        end

                        if not added then
                            Warning(inventoryId, string.format("Not enough room in Inventory: %s to add starting item: %s", inventoryId, startingItemData.ItemId))
                        end
                    end
                else
                    Warning(inventoryId, string.format("Starting item '%s' is not allowed in inventory: %s", startingItemData.ItemId, inventoryId))
                end
            else
                Warning(inventoryId, string.format("Invalid starting item: %s", startingItemData.ItemId))
            end
        end
    end
    return contents
end

---Returns the contents of a slot for a Player
---@param player Player
---@param inventoryId string
---@param slotIndex integer
---@return table
function API.GetItemInSlot(player, inventoryId, slotIndex)
    local inventory = API.GetInventory(player, inventoryId)
    if inventory then
        return inventory:GetItem(slotIndex)
    end
    return nil
end

---Returns the index of a slot containing an item. This will return the slot with the smallest amount of the item, or 0 if none are found.
---@param player Player
---@param inventoryId string
---@param itemType integer
---@param itemId string
---@return integer
function API.GetSlotIndexForItem(player, inventoryId, itemType, itemId)
    local inventory = API.GetInventory(player, inventoryId)

    if inventory then
        if API.GetSetting(inventoryId, API.Setting.UseStacks) then
            -- Favor the stack with the smallest amount
            local smallestSlotIndex = 0
            local smallestAmount = math.huge
            for slotIndex, item in pairs(inventory:GetItems()) do
                if item:GetCustomProperty("ItemType") == itemType and item:GetCustomProperty("ItemId") == itemId then
                    if item.count < smallestAmount then
                        smallestSlotIndex = slotIndex
                        smallestAmount = item.count
                    end
                end
            end
            return smallestSlotIndex
        else
            -- Not using stacks so just find the first slot containing the item
            for slotIndex, item in pairs(inventory:GetItems()) do
                if item:GetCustomProperty("ItemType") == itemType and item:GetCustomProperty("ItemId") == itemId then
                    return slotIndex
                end
            end
        end
    end
    return 0
end

---Returns the index of the first empty slot. Will return 0 if no slot is available.
---@param player Player
---@param inventoryId string
---@return integer
function API.GetFirstEmptySlotIndex(player, inventoryId)
    local slotIndex = FindEmptySlot(player, inventoryId, nil)
    return slotIndex or 0
end

---Returns the index of the first available slot for an amount of an item, or 0 if none are found.
---@param player Player
---@param inventoryId string
---@param itemType integer
---@param itemId string
---@param amount number
---@param ignoreSlots table|nil
---@return integer
function API.GetAvailableSlotIndex(player, inventoryId, itemType, itemId, amount, ignoreSlots)
    local inventory = API.GetInventory(player, inventoryId)
    local totalSlots = API.GetSetting(inventoryId, API.Setting.TotalSlots)
    local slotCapacity = GetStackLimit(inventoryId, itemId)
    ignoreSlots = ignoreSlots or {}

    itemType = API.GetItemType(itemId)

    if IsUniquePerInstance(itemType) then
        -- Unique items can only go into empty slots
        return API.GetFirstEmptySlotIndex(player, inventoryId)
    end

    if API.GetSetting(inventoryId, API.Setting.UseStacks) then
        -- Find any matching slot that has space, otherwise find the first empty slot
        local emptySlotIndex = 0
        local slotIndex = 0

        while slotIndex < totalSlots do
            slotIndex = slotIndex + 1

            local item = inventory:GetItem(slotIndex)
            if not ignoreSlots[slotIndex] then
                if not item or item.count == 0 then
                    if emptySlotIndex == 0 then
                        emptySlotIndex = slotIndex
                    end
                elseif DoesSlotMatch(item, itemType, itemId) then
                    if item.count < slotCapacity then
                        return slotIndex
                    end
                end
            end
        end

        return emptySlotIndex
    else
        -- If an existing slot has the item, return it if it can be stacked upon, otherwise return no valid index
        local slotIndex = API.GetSlotIndexForItem(player, inventoryId, itemType, itemId)
        if slotIndex and slotIndex > 0 then
            local item = inventory:GetItem(slotIndex)
            if item.count < slotCapacity then
                return slotIndex
            else
                return 0
            end
        end

        -- Return the first empty slot found or 0
        return API.GetFirstEmptySlotIndex(player, inventoryId)
    end
end

---Returns the amount of remaining capacity available in a specific slot of an Inventory for a Player.
---If the slot is empty, it will return the maximum slot capacity.
---@param player Player
---@param inventoryId string
---@param slotIndex integer
---@return integer
function API.GetRemainingSlotCapacity(player, inventoryId, slotIndex, itemId)
    local maxSlotCapacity = GetStackLimit(inventoryId, itemId)

    local item = API.GetItemInSlot(player, inventoryId, slotIndex)
    if item then
        return maxSlotCapacity - item.count
    else
        return maxSlotCapacity
    end
end

---Returns the highest priority Inventory id that can fit the supplied item. Does not include containers.
---@param itemType integer
---@param itemId string
---@param amount integer
---@param slotIndex integer
---@param adding boolean
---@param predicate function|nil
---@param includeContainers boolean
---@return string
function API.GetPriorityInventoryId(player, itemType, itemId, amount, slotIndex, adding, predicate, includeContainers)
    itemType = API.GetItemType(itemId)
    local result, projection, highestPriorityInventoryId = AssessOperationOnPriorityInventory(player, itemType, itemId, amount, adding, predicate, includeContainers)
    if result == true then
        return highestPriorityInventoryId
    else
        return nil
    end
end

---Returns the key used for storage and networking for an Inventory.
---@param inventoryId string
---@return string
function API.GetInventoryKey(inventoryId)
    return INVENTORY_TAG .. inventoryId
end

---Returns true if a string represents an Inventory key.
---@param key string
---@return boolean
function API.IsInventoryKey(key)
    return string.find(key, "^" .. INVENTORY_TAG) ~= nil
end

---Returns the Inventory id associated with an Inventory key.
---@param key string
---@return string
function API.GetInventoryIdFromKey(key)
    return string.sub(key, #INVENTORY_TAG + 1)
end

---Returns true if the Inventory Id is a generated container Id.
---@param inventoryId string
---@return boolean
function API.IsContainerInventoryId(inventoryId)
    return string.find(inventoryId, "^" .. CONTAINER_TAG) ~= nil
end

---Returns true of the Inventory is a container.
---@param inventoryId string
---@return boolean
function API.IsContainerInventory(inventoryId)
    return API.IsContainerInventoryId(inventoryId) or containerIds[inventoryId] == true
end

---Returns the base Inventory Id from a generated container Id.
---@param inventoryId string
---@return string
function API.GetBaseInventoryId(inventoryId)
    if API.IsContainerInventoryId(inventoryId) then
        local baseId, _, _ = CoreString.Split(inventoryId, "|", { removeEmptyResults = true })
        local baseInventoryId = string.sub(baseId, #CONTAINER_TAG + 1)
        return baseInventoryId
    end
    return inventoryId
end

---Returns the Item Id a container was generated from if a container id is provided.
---@param containerId string
---@return string
function API.GetContainerItemId(containerId)
    if API.IsContainerInventoryId(containerId) then
        local _, itemId, _ = CoreString.Split(containerId, "|", { removeEmptyResults = true })
        return itemId
    end
    return containerId
end

---Returns a unique(ish) container id.
---@param player Player
---@param itemId string|nil
---@param inventoryId string
---@return string
function API.GetUniqueContainerId(player, itemId, inventoryId, isStartingItem)
    -- Id = CON_[inventoryId]|[itemId]|[UUID]
    local result = nil
    while not result do
        local id = string.format("%s%s|%s|%s", CONTAINER_TAG, inventoryId, itemId or "", GenerateUUID(player))
        if not inventories[id] and (isStartingItem or API.GetAmountInInventory(player, nil, API.ItemType.Inventory, id) == 0) then
            result = id
        end
    end
    return result
end

---Returns the ItemType for an Item id.
---@param itemId string
---@return integer
function API.GetItemType(itemId)
    if not DATABASE.Items then
        return nil
    end

    if DATABASE.Items[itemId] then
        if DATABASE.Items[itemId].IsInventory then
            return API.ItemType.Inventory
        end
        return API.ItemType.Item
    else
        local containerId = API.GetContainerItemId(itemId)
        if containerId ~= itemId and DATABASE.Items[containerId] then
            if DATABASE.Items[containerId].IsInventory then
                return API.ItemType.Inventory
            end
            return API.ItemType.Item
        end
    end
    return nil
end

---Sorts inventories based on priority, in descending order.
function SortInventoriesByPriority()
    priorityInventories = {}
    for inventoryId, _ in pairs(inventories) do
        priorityInventories[#priorityInventories+1] = inventoryId
    end
    table.sort(priorityInventories, function(a,b)
        return API.GetSetting(a, API.Setting.Priority) > API.GetSetting(b, API.Setting.Priority)
    end)
end

function SanitizeSettings(inventoryId)
    local settings = API.GetSettings(inventoryId)
    if not settings then
        return
    end

    if settings.TotalSlots and settings.TotalSlots <= 0 then
        settings.TotalSlots = 10
    end

    if settings.SlotCapacity and settings.SlotCapacity < 0 then
        settings.SlotCapacity = 99
    end

    if settings.Priority and settings.Priority < 1 then
        settings.Priority = 1
    end

    if settings.DropTimeoutSeconds and settings.DropTimeoutSeconds < 0 then
        settings.DropTimeoutSeconds = 0
    end

    if type(settings.OverflowInventoryIds) == "string" then
        settings.OverflowInventoryIds = TAGS.SplitTagsString(settings.OverflowInventoryIds)
    end
end

---Server Only. Loads the Inventory for a player and sends an update to their client.
---@param player Player
---@param inventoryId string
---@return boolean
function LoadInventory(player, inventoryId)
    if not Environment.IsServer() then return false end

    if inventories[inventoryId][player] or (loadingInventories[inventoryId] and loadingInventories[inventoryId][player]) then return false end

    --print(string.format("Loading Inventory: %s for Player: %s (%s)", inventoryId, player.name, player.id))

    if not loadingInventories[inventoryId] then
        loadingInventories[inventoryId] = {}
    end

    loadingInventories[inventoryId][player] = true

    local inventoryKey = API.GetInventoryKey(inventoryId)
    local storageKey = API.GetSetting(inventoryId, API.Setting.StorageKey)
    local playerData

    if storageKey and storageKey.isAssigned then
        playerData = Storage.GetSharedPlayerData(storageKey, player)
        if not playerData[inventoryKey] then
            playerData[inventoryKey] = API.CreateInventoryData(player, inventoryId)
            playerData[inventoryKey .. DATA_MIGRATION.VERSION_KEY] = DATA_MIGRATION.GetCurrentVersion()
            Storage.SetSharedPlayerData(storageKey, player, playerData)
        end

        if DATA_MIGRATION.MigrateInventoryData(player, playerData, inventoryId) then
            Storage.SetSharedPlayerData(storageKey, player, playerData)
        end
    else
        playerData = Storage.GetPlayerData(player)
        if not playerData[inventoryKey] then
            playerData[inventoryKey] = API.CreateInventoryData(player, inventoryId)
            playerData[inventoryKey .. DATA_MIGRATION.VERSION_KEY] = DATA_MIGRATION.GetCurrentVersion()
            Storage.SetPlayerData(player, playerData)
        end

        if DATA_MIGRATION.MigrateInventoryData(player, playerData, inventoryId) then
            Storage.SetPlayerData(player, playerData)
        end
    end

    SyncInventoryWithClient(player, inventoryId, API.Events.InventoryLoaded, uuidNums[player])

    inventories[inventoryId][player] = DeserializeInventory(player, inventoryId, playerData[inventoryKey])

    loadingInventories[inventoryId][player] = false

    Events.Broadcast(API.Events.InventoryLoaded, player, inventoryId)

    return true
end

---Converts a Lua table inventory to a new native Core Inventory.
---Spawns a new Inventory CoreObject and replaces the existing one for this id, if applicable.
---@param player Player
---@param inventoryId string
---@param inventoryData table
---@return Inventory
function DeserializeInventory(player, inventoryId, inventoryData)
    inventoryData = inventoryData or {}

    if API.IsInventoryLoaded(player, inventoryId) then
        local inventory = inventories[inventoryId][player]
        if inventory then
            inventory:Destroy()
        end
    end

    local inventory = World.SpawnAsset(INVENTORY_ASSET, { parent = inventoryContext, name = player.name .. "_" .. inventoryId })
    inventory:Resize(API.GetSetting(inventoryId, API.Setting.TotalSlots))

    for slotIndex, data in pairs(inventoryData) do
        inventory:AddItem(
            INVENTORY_ITEM_ASSET,
            {
                count = data[API.Keys.Amount],
                slot = slotIndex,
                customProperties =
                {
                    ItemId = data[API.Keys.ItemId],
                    ItemType = data[API.Keys.ItemType]
                }
            })
    end

    return inventory
end

---Converts a native Core Inventory to a Lua table format.
---@param player Player
---@param inventoryId string
---@return table
function SerializeInventory(player, inventoryId)
    local data = {}

    local inventory = API.GetInventory(player, inventoryId)
    if inventory then
        -- TODO Replace this with native save data from inventory once that's available
        for slotIndex, item in pairs(inventory:GetItems()) do
            data[slotIndex] = {
                [API.Keys.ItemType] = item:GetCustomProperty("ItemType"),
                [API.Keys.ItemId] = item:GetCustomProperty("ItemId"),
                [API.Keys.Amount] = item.count
            }
        end
    end

    return data
end

---Server Only. Sends Inventory data to a client over the private network connection.
---@param player Player
---@param inventoryId string
---@param action string
function SyncInventoryWithClient(player, inventoryId, action, ...)
    if not Environment.IsServer() then return false end

    -- Setup the parameters to send for running the action on the client
    local actionParams
    if action then
        actionParams = { ... }
    end

    local playerActions = pendingActions[player] or {}
    table.insert(playerActions, {
        [API.Keys.InventoryId] = inventoryId,
        [API.Keys.Action] = action,
        [API.Keys.ActionParams] = actionParams
    })
    pendingActions[player] = playerActions

    -- Send load actions immediately
    if action == API.Events.InventoryLoaded then
        if clientSyncTask then
            clientSyncTask:Cancel()
        end

        clientSyncTask = Task.Spawn(SyncWithClients)
    end
end

---Every second this will send any pending Inventory actions to the relevant clients.
function SyncWithClients()
    while true do
        for player, actions in pairs(pendingActions) do
            local syncData = {}

            for _, action in ipairs(actions) do
                local inventoryId = action[API.Keys.InventoryId]

                if action[API.Keys.Action] == API.Events.InventoryLoaded then
                    action[API.Keys.Contents] = SerializeInventory(player, inventoryId)
                end

                syncData[#syncData+1] = action
            end

            if #syncData > 0 then
                syncFlag = syncFlag + 1
                if syncFlag > 5 then
                    syncFlag = 0
                end
                local syncKey = INVENTORY_TAG .. "Sync" .. syncFlag

                -- Ensure every sync is identified as a 'change' by adding a unique flag to it
                updateFlag = updateFlag + 1
                syncData[#syncData+1] = {
                    [API.Keys.Action] = "flag",
                    [API.Keys.UpdateFlag] = updateFlag
                }

                player:SetPrivateNetworkedData(syncKey, syncData)

                pendingActions = {}
            end
        end

        Task.Wait(1.0)
    end
end

---Called whenever client private networked data is changed. This syncs Inventory between the server and client.
---@param player Player
---@param key string
function HandlePrivateNetworkedDataChanged(player, key)
    if API.IsInventoryKey(key) then
        local syncData = player:GetPrivateNetworkedData(key)
        if syncData then
            for _, action in ipairs(syncData) do
                local actionType = action[API.Keys.Action]
                if actionType == "flag" then
                    return
                end

                local inventoryId = action[API.Keys.InventoryId]
                if not actionType or actionType == API.Events.InventoryLoaded then
                    local uuidNum = table.unpack(action[API.Keys.ActionParams])
                    if uuidNum and (not uuidNums[player] or uuidNum > uuidNums[player]) then
                        uuidNums[player] = uuidNum
                    end

                    inventories[inventoryId] = {
                        [player] = DeserializeInventory(player, inventoryId, action[API.Keys.Contents])
                    }

                    SortInventoriesByPriority()

                    local settings = API.GetSettings(inventoryId)
                    if settings.ScreenTemplate then
                        local screenData = {
                            Screens = {
                                [API.GetBaseInventoryId(inventoryId)] = {
                                    ScreenTemplate = settings.ScreenTemplate,
                                    ScreenToggleButton = settings.ScreenToggleButton:WaitForObject(1),
                                    OpenBinding = settings.OpenBinding,
                                    CloseBinding = settings.CloseBinding,
                                    OpenScreenParams = { inventoryId },
                                    ShowCursor = settings.ShowCursor
                                }
                            }
                        }
                        DATABASE.AppendData(screenData)
                    end

                    Events.Broadcast(API.Events.InventoryRegistered, inventoryId)
                    Events.Broadcast(API.Events.InventoryLoaded, player, inventoryId)
                elseif actionType == API.Events.InventoryUnregistered then
                    if inventories[inventoryId] then
                        for _, playerInventory in pairs(inventories[inventoryId]) do
                            playerInventory:Destroy()
                        end
                        inventories[inventoryId] = nil
                    end
                elseif actionType == API.Events.AddInventory then
                    API.AddToInventory(player, table.unpack(action[API.Keys.ActionParams]))
                elseif actionType == API.Events.RemoveInventory then
                    API.RemoveFromInventory(player, table.unpack(action[API.Keys.ActionParams]))
                elseif actionType == API.Events.TransferInventory then
                    API.TransferToInventory(player, table.unpack(action[API.Keys.ActionParams]))
                elseif actionType == API.Events.ClearInventory then
                    API.ClearInventory(player, table.unpack(action[API.Keys.ActionParams]))
                end
            end
        end
    end
end

---Server Only. Saves Inventory content into Storage for a Player. Uses Local or Shared Storage depending on the
---Inventory settings.
---@param player Player
---@param inventoryId string
---@return boolean
function SaveInventory(player, inventoryId)
    if not Environment.IsServer() then return false end

    --print(string.format("Saving Inventory: %s for Player: %s (%s)", inventoryId, player.name, player.id))

    local inventoryKey = API.GetInventoryKey(inventoryId)
    local storageKey = API.GetSetting(inventoryId, API.Setting.StorageKey)

    if storageKey and storageKey.isAssigned then
        local playerData = Storage.GetSharedPlayerData(storageKey, player)
        playerData[inventoryKey] = SerializeInventory(player, inventoryId)
        playerData[inventoryKey .. VERSION_TAG] = INVENTORY_DATA_VERSION

        local result = Storage.SetSharedPlayerData(storageKey, player, playerData)
        if result ~= StorageResultCode.SUCCESS then
            Warning(inventoryId, string.format("Could not save Inventory: %s for Player: %s (%s) - Result: %s", inventoryId, player.name, player.id, result))
            return false
        end
    else
        local playerData = Storage.GetPlayerData(player)
        playerData[inventoryKey] = SerializeInventory(player, inventoryId)
        playerData[inventoryKey .. VERSION_TAG] = INVENTORY_DATA_VERSION

        local result = Storage.SetPlayerData(player, playerData)
        if result ~= StorageResultCode.SUCCESS then
            Warning(inventoryId, string.format("Could not save Inventory: %s for Player: %s (%s) - Result: %s", inventoryId, player.name, player.id, result))
            return false
        end
    end

    Events.Broadcast(API.Events.InventorySaved, player, inventoryId)

    return true
end

function CanAddContainerInventory(player, containerInventoryId)
    if API.IsInventoryRegistered(containerInventoryId) then
        local inventory = API.GetInventory(player, containerInventoryId)

        if inventory then
            for _, item in pairs(inventory:GetItems()) do
                if item.count > 0 then
                    return false
                end
            end
        end

        return true
    end

    if Environment.IsServer() then
        -- Load the content if needed
        local inventoryData
        local inventoryKey = API.GetInventoryKey(containerInventoryId)
        local storageKey = API.GetSetting(containerInventoryId, API.Setting.StorageKey)

        if storageKey and storageKey.isAssigned then
            inventoryData = Storage.GetSharedPlayerData(storageKey, player)[inventoryKey]
        else
            inventoryData = Storage.GetPlayerData(player)[inventoryKey]
        end

        if inventoryData then
            for _, item in pairs(inventoryData) do
                if item[API.Keys.Amount] > 0 then
                    return false
                end
            end
        end
    end

    return true
end

---Determines which inventories and slots an item can be added into or removed from, returns true if the entire amount can be processed,
---returns a projection of the resulting distribution across inventories and slots and the highest priority inventory id in that projection.
---Higher priority inventories (higher integer numbers) will process items first
---and overflow inventories will be taken into account before moving on to lower priority inventories.
---@param player Player
---@param itemType integer
---@param itemId string
---@param amount integer
---@param adding boolean
---@param predicate function|nil
---@param includeContainers boolean
---@param projection table|nil
---@return boolean
---@return table
---@return string
function AssessOperationOnPriorityInventory(player, itemType, itemId, amount, adding, predicate, includeContainers, projection)
    projection = projection or {}

    local amountRemaining = amount
    local highestPriorityInventoryId = nil
    local result = false

    for _, inventoryId in ipairs(priorityInventories) do
        if includeContainers or not API.IsContainerInventory(inventoryId) then
            if not predicate or predicate(inventoryId) then
                if adding then
                    result, projection = AssessItemAddition(player, inventoryId, itemType, itemId, amountRemaining, nil, projection)
                else
                    result, projection = AssessItemRemoval(player, inventoryId, itemType, itemId, amountRemaining, nil, projection)
                end

                if result == true then
                    if not highestPriorityInventoryId then
                        highestPriorityInventoryId = inventoryId
                    end

                    break
                else
                    -- Determine how much was added so far and recalculate the amountRemaining for the next inventory
                    local amountProcessed = 0
                    for _,slots in pairs(projection) do
                        for _,data in pairs(slots) do
                            if data.itemId == itemId then
                                amountProcessed = amountProcessed + data.amount
                            end
                        end
                    end

                    if amountProcessed > 0 then
                        amountRemaining = amount - amountProcessed

                        if not highestPriorityInventoryId then
                            highestPriorityInventoryId = inventoryId
                        end
                    end
                end
            end
        end
    end

    return result, projection, highestPriorityInventoryId
end

---Determines which inventories and slots an item can be added into, returns true if the entire amount can be added
---and also returns a projection of the resulting distribution across inventories and slots.
---That projection can be used as the instructions for the actual inventory addition operation,
---or to enable subsequent calls to this method to understand that space is reserved for previous items.
---@param player Player
---@param inventoryId string
---@param itemType integer
---@param itemId string
---@param amount integer
---@param slotIndex integer
---@param projection table
---@return boolean
---@return table
function AssessItemAddition(player, inventoryId, itemType, itemId, amount, slotIndex, projection)
    projection = projection or {}

    if not IsAllowedItem(inventoryId, itemId) then
        return false, projection
    end

    if not API.GetSetting(inventoryId, API.Setting.AllowNonEmptyContainers) and itemType == API.ItemType.Inventory then
        if not CanAddContainerInventory(player, itemId) then
            return false, projection
        end
    end

    local currentInventoryId = inventoryId
    local currentSlotIndex = slotIndex
    local amountRemaining = amount

    while amountRemaining > 0 do
        if not currentSlotIndex or currentSlotIndex <= 0 then
            -- Get next valid inventory slot with available capacity
            currentInventoryId,currentSlotIndex = FindAvailableAdditionSlot(player, currentInventoryId, itemType, itemId, amountRemaining, projection)
            if not currentInventoryId or not currentSlotIndex then
                return false, projection
            end
        else
            if not API.GetSetting(inventoryId, API.Setting.UseStacks) then
                local existingIndex = API.GetSlotIndexForItem(player, inventoryId, itemType, itemId)
                if existingIndex > 0 and existingIndex ~= slotIndex then
                    Warning(inventoryId, string.format("Slot is invalid as this item exists in another slot when UseStacks = 'false', in Inventory : %s for Player: %s (%s)", inventoryId, player.name, player.id))
                    return false, projection
                end
            end
        end

        -- Add as much as possible
        local freeCapacity = API.GetRemainingSlotCapacity(player, currentInventoryId, currentSlotIndex, itemId)
        if projection[currentInventoryId] and projection[currentInventoryId][currentSlotIndex] then
            freeCapacity = freeCapacity - projection[currentInventoryId][currentSlotIndex].amount
        end

        local amountToAdd = amountRemaining
        if IsUniquePerInstance(itemType) then
            amountToAdd = 1
        end
        amountToAdd = CoreMath.Clamp(amountToAdd, 0, freeCapacity)

        amountRemaining = amountRemaining - amountToAdd

        projection[currentInventoryId] = projection[currentInventoryId] or {}
        projection[currentInventoryId][currentSlotIndex] = { itemType = itemType, itemId = itemId, amount = amountToAdd }

        currentSlotIndex = nil
    end

    return true, projection
end

---Finds a valid inventory slot that has spare capacity for this item.
---This will search recursively through overflow inventories as needed.
---Returns the inventoryId and slotIndex of the first valid result.
---@param player Player
---@param inventoryId string
---@param itemType integer
---@param itemId string
---@param amount integer
---@param projection table
---@param inventoriesSearched table
---@return string
---@return integer
function FindAvailableAdditionSlot(player, inventoryId, itemType, itemId, amount, projection, inventoriesSearched)
    local inventory = API.GetInventory(player, inventoryId)
    local totalSlots = API.GetSetting(inventoryId, API.Setting.TotalSlots)
    local slotCapacity = GetStackLimit(inventoryId, itemId)

    if IsUniquePerInstance(itemType) then
        -- Unique items can only go into empty slots
        local slotIndex = FindEmptySlot(player, inventoryId, projection)
        if slotIndex then
            return inventoryId, slotIndex
        end
    else
        if API.GetSetting(inventoryId, API.Setting.UseStacks) then
            -- Find any matching slot that has space, otherwise find the first empty slot
            local emptySlotIndex = nil
            for slotIndex = 1,totalSlots, 1 do
                local item = inventory:GetItem(slotIndex)
                if not item and (not projection[inventoryId] or not projection[inventoryId][slotIndex]) then
                    if not emptySlotIndex then
                        emptySlotIndex = slotIndex
                    end
                elseif DoesSlotMatch(item, itemType, itemId) then
                    local slotAmount = item.count
                    if projection[inventoryId] and projection[inventoryId][slotIndex] then
                        slotAmount = slotAmount + projection[inventoryId][slotIndex].amount
                    end

                    if slotAmount < slotCapacity then
                        return inventoryId, slotIndex
                    end
                end
            end

            if emptySlotIndex then
                return inventoryId, emptySlotIndex
            end
        else
            -- Find an existing slot that has the item and has space
            local slotIndex = API.GetSlotIndexForItem(player, inventoryId, itemType, itemId)
            if slotIndex and slotIndex > 0 then
                local item = inventory:GetItem(slotIndex)
                local slotAmount = item.count
                if projection[inventoryId] and projection[inventoryId][slotIndex] then
                    slotAmount = slotAmount + projection[inventoryId][slotIndex].amount
                end

                if slotAmount < slotCapacity then
                    return inventoryId, slotIndex
                end
            else
                -- Find any empty slot
                local slotIndex = FindEmptySlot(player, inventoryId, projection)
                if slotIndex then
                    return inventoryId, slotIndex
                end
            end
        end
    end

    inventoriesSearched = inventoriesSearched or {}
    inventoriesSearched[inventoryId] = true

    -- No available placement in specified inventory, recursively check overflow inventories
    local overflowInventoryIds = API.GetSetting(inventoryId, API.Setting.OverflowInventoryIds)
    for _,overflowInventoryId in ipairs(overflowInventoryIds) do
        if not inventoriesSearched[overflowInventoryId] then
            local invId,slotIndex = FindAvailableAdditionSlot(player, overflowInventoryId, itemType, itemId, amount, projection, inventoriesSearched)
            if invId and slotIndex then
                return invId, slotIndex
            end
        end
    end

    -- Even recursive overflows were full, no slot is available
    return nil, nil
end

---Determines which inventories and slots an item can be removed from, returns true if the entire amount can be removed
---and also returns a projection of the resulting distribution across inventories and slots.
---That projection can be used as the instructions for the actual inventory removal operation.
---@param player Player
---@param inventoryId string
---@param itemType integer
---@param itemId string
---@param amount integer
---@param slotIndex integer
---@param projection table
---@return boolean
---@return table
function AssessItemRemoval(player, inventoryId, itemType, itemId, amount, slotIndex, projection)
    projection = projection or {}

    local currentInventoryId = inventoryId
    local currentSlotIndex = slotIndex
    local amountRemaining = amount

    if currentSlotIndex and currentSlotIndex > 0 then
        -- If removing from a specific slot, simply check if that slot has enough
        local amountInSlot = API.GetAmountInInventory(player, currentInventoryId, itemType, itemId, currentSlotIndex)
        if projection[currentInventoryId] and projection[currentInventoryId][currentSlotIndex] then
            amountInSlot = amountInSlot - projection[currentInventoryId][currentSlotIndex].amount
        end

        if amountInSlot >= amount then
            projection[currentInventoryId] = projection[currentInventoryId] or {}
            projection[currentInventoryId][currentSlotIndex] = { itemType = itemType, itemId = itemId, amount = amount }
            return true, projection
        else
            return false, projection
        end
    else
        -- Collect all slots with this item and sort them, then remove slot by slot until the full amount is processed
        local slots = FindAllSlotsWithItem(player, currentInventoryId, itemType, itemId, nil, projection)
        table.sort(slots, function(a,b)
            -- Put slots with smaller amounts first, then slots from lower priority inventories, then slots with higher indexes
            if a.amount ~= b.amount then
                return a.amount < b.amount
            elseif a.priority ~= b.priority then
                return a.priority < b.priority
            else
                return a.index > b.index
            end
        end)

        for _, slotData in ipairs(slots) do
            -- Remove as much as possible/necessary from each slot
            local amountToRemove = CoreMath.Clamp(amountRemaining, 0, slotData.amount)
            amountRemaining = amountRemaining - amountToRemove

            projection[slotData.inventoryId] = projection[slotData.inventoryId] or {}
            projection[slotData.inventoryId][slotData.index] = { itemType = itemType, itemId = itemId, amount = amountToRemove }

            if amountRemaining == 0 then
                return true, projection
            end
        end

        -- Couldn't fully remove all items
        return false, projection
    end
end

--- Finds and returns information about all slots in the inventory (and its overflows) that contain the specified item.
---@param player Player
---@param inventoryId string
---@param itemType integer
---@param itemId string
---@param slots table
---@param projection table
---@param inventoriesSearched table
---@return table
function FindAllSlotsWithItem(player, inventoryId, itemType, itemId, slots, projection, inventoriesSearched)
    local inventory = API.GetInventory(player, inventoryId)
    local totalSlots = API.GetSetting(inventoryId, API.Setting.TotalSlots)
    local invPriority = API.GetSetting(inventoryId, API.Setting.Priority)

    slots = slots or {}

    for slotIndex = 1,totalSlots, 1 do
        local item = inventory:GetItem(slotIndex)
        if DoesSlotMatch(item, itemType, itemId) then
            local slotData = {
                inventoryId = inventoryId,
                index = slotIndex,
                amount = item.count,
                priority = invPriority
            }

            if projection[inventoryId] and projection[inventoryId][slotIndex] then
                slotData.amount = slotData.amount - projection[inventoryId][slotIndex].amount
            end

            if slotData.amount > 0 then
                slots[#slots+1] = slotData
            end
        end
    end

    inventoriesSearched = inventoriesSearched or {}
    inventoriesSearched[inventoryId] = true

    -- Recursively search overflow inventories
    local overflowInventoryIds = API.GetSetting(inventoryId, API.Setting.OverflowInventoryIds)
    for _,overflowInventoryId in ipairs(overflowInventoryIds) do
        if not inventoriesSearched[overflowInventoryId] then
            slots = FindAllSlotsWithItem(player, overflowInventoryId, itemType, itemId, slots, projection, inventoriesSearched)
        end
    end
    return slots
end

---Finds the first empty slot index in an inventory, taking into account any projected inventory modifications.
---@param player Player
---@param inventoryId string
---@param projection table
---@return integer
function FindEmptySlot(player, inventoryId, projection)
    local inventory = API.GetInventory(player, inventoryId)
    local totalSlots = API.GetSetting(inventoryId, API.Setting.TotalSlots)

    if inventory then
        for slotIndex = 1,totalSlots, 1 do
            if not projection[inventoryId] or not projection[inventoryId][slotIndex] then
                local item = inventory:GetItem(slotIndex)
                if not item or item.count == 0 then
                    return slotIndex
                end
            end
        end
    end
    return nil
end

---Returns the maximum amount of items that can fit into an inventory slot,
---taking into account the item's individual stack limit (if there is one).
---@param inventoryId string
---@param itemId string
---@return integer
function GetStackLimit(inventoryId, itemId)
    local inventoryLimit = API.GetSetting(inventoryId, API.Setting.SlotCapacity)

    local itemLimit = 0
    local itemData = DATABASE.Items[itemId]
    if itemData then
        itemLimit = itemData[API.ItemSettings.StackLimit]
    end

    if not itemLimit or itemLimit <= 0 then
        return inventoryLimit
    else
        return math.min(inventoryLimit, itemLimit)
    end
end

---Returns a copy of a projection of an inventory modification
---@param projection table
---@return table
function DeepCopyProjection(projection)
    local copy = {}
    for invId,slots in pairs(projection) do
        copy[invId] = {}
        for slotIndex,data in pairs(slots) do
            copy[invId][slotIndex] = { itemType = data.itemType, itemId = data.itemId, amount = data.amount }
        end
    end
    return copy
end

---Debug method to print out a projection of an inventory modification
---@param result boolean
---@param projection table
function LogProjection(result, projection)
    local s = "Assessment result: " .. tostring(result)
    if not projection then
        s = s .. "\nnil projection"
    else
        for invId,slots in pairs(projection) do
            for slotIndex,data in pairs(slots) do
                s = s .. "\n" .. invId .. "[" .. slotIndex .. "] " .. tostring(data.amount) .. " of " .. tostring(data.itemId)
            end
        end
    end
    print(s)
end

---Adds an amount of an item to a slot.
---@param player Player
---@param inventoryId string
---@param slotIndex integer
---@param itemType integer
---@param itemId string
---@param amount integer
function AddToInventory(player, inventoryId, slotIndex, itemType, itemId, amount)
    local inventory = API.GetInventory(player, inventoryId)

    local itemData = DATABASE.Items[itemId]
    if itemData and itemData.IsInventory then
        itemType = API.ItemType.Inventory
        itemId = API.GetUniqueContainerId(player, itemId, itemData.InventoryId)
    end

    local item = inventory:GetItem(slotIndex)
    if item then
        item.count = item.count + amount
    else
        inventory:AddItem(
            INVENTORY_ITEM_ASSET,
            {
                count = amount,
                slot = slotIndex,
                customProperties =
                {
                    ItemId = itemId,
                    ItemType = itemType
                }
            })
    end
end

---Removes an amount of an item from a slot.
---@param player Player
---@param inventoryId string
---@param slotIndex integer
---@param amount integer
function RemoveFromInventory(player, inventoryId, slotIndex, amount)
    local inventory = API.GetInventory(player, inventoryId)
    inventory:RemoveFromSlot(slotIndex, { count = amount })
end

---Swaps the contents of one slot with another.
---@param player Player
---@param sourceInventoryId string
---@param sourceSlotIndex integer
---@param targetInventoryId string
---@param targetSlotIndex integer
function SwapBetweenInventory(player, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex)
    local sourceItem = API.GetItemInSlot(player, sourceInventoryId, sourceSlotIndex)
    local targetItem = API.GetItemInSlot(player, targetInventoryId, targetSlotIndex)

    local targetItemType = targetItem:GetCustomProperty("ItemType")
    local targetItemId = targetItem:GetCustomProperty("ItemId")
    local targetAmount = targetItem.count

    targetItem:SetCustomProperty("ItemType", sourceItem:GetCustomProperty("ItemType"))
    targetItem:SetCustomProperty("ItemId", sourceItem:GetCustomProperty("ItemId"))
    targetItem.count = sourceItem.count

    sourceItem:SetCustomProperty("ItemType", targetItemType)
    sourceItem:SetCustomProperty("ItemId", targetItemId)
    sourceItem.count = targetAmount
end

---Moves an amount fo an item from one slot to another. This can occur in a single Inventory or between multiple Inventories.
---@param player Player
---@param sourceInventoryId string
---@param sourceSlotIndex integer
---@param targetInventoryId string
---@param targetSlotIndex integer
---@param itemType integer
---@param itemId string
---@param amount integer
function TransferToInventory(player, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex, itemType, itemId, amount)
    RemoveFromInventory(player, sourceInventoryId, sourceSlotIndex, amount)
    AddToInventory(player, targetInventoryId, targetSlotIndex, itemType, itemId, amount)
end

---Returns true if the item in a slot matches the provided item type and id.
---@param item InventoryItem
---@param itemType integer
---@param itemId string
---@return boolean
function DoesSlotMatch(item, itemType, itemId)
    if not item then
        return false
    end

    if itemType == API.ItemType.Item then
        return itemId == item:GetCustomProperty("ItemId")
    else
        return itemId == item:GetCustomProperty("ItemId") or itemId == API.GetContainerItemId(item:GetCustomProperty("ItemId"))
    end
end

---Determines whether an item is allowed in an inventory based on its id and tags
---@param inventoryId string
---@param itemId string
---@return boolean
function IsAllowedItem(inventoryId, itemId)
    local allowedItemTags = API.GetSetting(inventoryId, API.Setting.AllowedItems)
    if allowedItemTags and #allowedItemTags > 0 then
        return TAGS.AnyMatch(allowedItemTags, itemId)
            or TAGS.AnyMatch(allowedItemTags, TAGS.GetTagsString("Items", itemId))
    end

    return true
end

---Returns true if the items of this type are considered unique and non-stackable
---@param itemType integer
---@return boolean
function IsUniquePerInstance(itemType)
    return itemType == API.ItemType.Inventory
end

---Generates an id based on a mix of the Player id and the current uuid counter.
---@param player Player
---@return string
function GenerateUUID(player)
    -- Seed random with a mix of the player id and an increment to avoid getting the same uuid
    -- if called multiple times on the same frame
    local idCode = 0
    for i = 1,#player.id, 1 do
        idCode = math.floor(idCode + (utf8.codepoint(player.id:sub(i, i)) * (i * 0.5)))
    end
    idCode = idCode * 1000

    local uuidNum = uuidNums[player] or 1
    uuidNums[player] = uuidNum + 1
    math.randomseed(tonumber(idCode + uuidNum))

    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    local result = string.sub(string.gsub(template, '[xy]', function(c)
        local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
        return string.format('%x', v)
    end), 1, 8)

    return result
end

---Loads all registered inventories for a player.
---@param player Player
function HandleLoadInventories(player)
    if not Environment.IsServer() then return false end

    for inventoryId, _ in pairs(inventories) do
        if not API.IsInventoryLoaded(player, inventoryId) then
            LoadInventory(player, inventoryId)
        end
    end
end

---Server Only. Mirrors a client side add inventory call on the server to keep server and client synchronized.
---@param player Player
---@param inventoryId string
---@param itemType integer
---@param itemId string
---@param amount integer
---@param slotIndex integer
---@param includeContainers boolean
function HandleInventoryAddRequest(player, inventoryId, itemType, itemId, amount, slotIndex, includeContainers)
    if not Environment.IsServer() then return false end

    API.AddToInventory(player, inventoryId, itemType, itemId, amount, slotIndex, includeContainers, false)
end

---Server Only. Mirrors a client side remove inventory call on the server to keep server and client synchronized.
---@param player Player
---@param inventoryId string
---@param itemType integer
---@param itemId string
---@param amount integer
---@param slotIndex integer
---@param includeContainers boolean
function HandleInventoryRemoveRequest(player, inventoryId, itemType, itemId, amount, slotIndex, includeContainers)
    if not Environment.IsServer() then return false end

    API.RemoveFromInventory(player, inventoryId, itemType, itemId, amount, slotIndex, includeContainers, false)
end

---Server Only. Mirrors a client side transfer inventory call on the server to keep server and client synchronized.
---@param player Player
---@param sourceInventoryId string
---@param sourceSlotIndex integer
---@param targetInventoryId string
---@param targetSlotIndex integer
function HandleInventoryTransferRequest(player, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex)
    if not Environment.IsServer() then return false end

    API.TransferToInventory(player, sourceInventoryId, sourceSlotIndex, targetInventoryId, targetSlotIndex, false)
end

---Server Only. Mirrors a client side clear inventory call on the server to keep server and client synchronized.
---@param player Player
---@param inventoryId string
function HandleInventoryClearRequest(player, inventoryId, resetToStartingItems)
    if not Environment.IsServer() then return false end

    API.ClearInventory(player, inventoryId, resetToStartingItems, false)
end

---Sets up the required listeners and loads all registered Inventories when a Player joins.
---@param player Player
function OnPlayerJoined(player)
    if Environment.IsClient() then
        if player ~= Game.GetLocalPlayer() then return end

        -- Listen for data coming from the server
        player.privateNetworkedDataChangedEvent:Connect(HandlePrivateNetworkedDataChanged)

        -- Check existing keys
        local keys = player:GetPrivateNetworkedDataKeys()
        for _, key in ipairs(keys) do
            HandlePrivateNetworkedDataChanged(player, key)
        end

        -- Load existing inventories
        RELIABLE_EVENTS.BroadcastToServer(API.Events.LoadInventories)
    end
end

---Unloads all registered Inventories for a Player when they leave.
---@param player Player
function OnPlayerLeft(player)
    for _, inventoryInfo in pairs(inventories) do
        if inventoryInfo[player] then
            inventoryInfo[player]:Destroy()
        end

        inventoryInfo[player] = nil
    end
end

---A wrapper around warn() to allow for toggling it with an Inventory setting "VerboseLogs".
---@param inventoryId string
---@param message string
function Warning(inventoryId, message)
    if inventories[inventoryId] and inventories[inventoryId] and API.GetSetting(inventoryId, API.Setting.VerboseLogs) then
        warn(string.format("%s\n%s", message, CoreDebug.GetStackTrace()))
    else
        warn(string.format("%s", message))
    end
end

inventoryContext = World.SpawnAsset(INVENTORY_CONTEXT_ASSET)

-- Handle client requests
if Environment.IsServer() then
    DATA_MIGRATION.SetInventoryAPI(API)

    Events.ConnectForPlayer(API.Events.LoadInventories, HandleLoadInventories)
    Events.ConnectForPlayer(API.Events.AddInventory, HandleInventoryAddRequest)
    Events.ConnectForPlayer(API.Events.RemoveInventory, HandleInventoryRemoveRequest)
    Events.ConnectForPlayer(API.Events.TransferInventory, HandleInventoryTransferRequest)
    Events.ConnectForPlayer(API.Events.ClearInventory, HandleInventoryClearRequest)

    clientSyncTask = Task.Spawn(SyncWithClients)
end

Game.playerJoinedEvent:Connect(OnPlayerJoined)
Game.playerLeftEvent:Connect(OnPlayerLeft)

function ProcessNewInventories()
    if not DATABASE.Inventories or not DATABASE.StartingItems then return end

    for id, data in pairs(DATABASE.Inventories) do
        if type(data) == "table" then
            -- Only register non containers here, containers will be registered when they are placed in world
            local isContainer = API.GetSetting(id, API.Setting.IsContainer)
            if not isContainer then
                API.RegisterInventory(id, false)
            end
        end
    end
end

if Environment.IsServer() then
    DATABASE.RegisterDataChangeHandler(ProcessNewInventories, "Inventories")
    ProcessNewInventories()
end

return API