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
    This script allows testing of the APIInventory system to check for breakages in functionality after updates.
    To run it:
    - Create an empty scene
    - Drag this script into the root level of the Hierarchy (Default Context)
    - Enable Player Storage in the scene's Game Settings
    - Enter Play mode and wait a few seconds

    Completion may take a few seconds.
    Some warnings are expected in the Event Log.
    Errors indicate unintended failure.
--]]

---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APIInventory
local INVENTORY = require(script:GetCustomProperty("APIInventory"))

local player = nil
local outputs = {}

function Fail(message)
    outputs[#outputs+1] = "UNIT TEST FAILED: " .. message .. "\n" .. CoreDebug.GetTaskStackTrace()
end

function OutputResults()
    for index, msg in ipairs(outputs) do
        Task.Spawn(function()
            error(msg)
        end, (index * 0.25)) -- Stagger output so they end up in correct order
    end
end

function RunUnitTests()
    print("[UNIT] Running unit tests for: APIInventory")

    SetupInventories()
    SetupItems()

    AddBlindlyTests()
    AddToSlotTests()
    OverflowTests()
    RemoveTests()
    TransferTests()
    ContainerTests()
    TagTests()
    UnregisterTests()

    print("[UNIT] Completed unit tests for: APIInventory")
    OutputResults()
end

function SetupInventories()
    DATABASE.AppendData({
        Inventories = {
            ["TestInvBasic"] = {
                [INVENTORY.Setting.TotalSlots] = 10,
                [INVENTORY.Setting.SlotCapacity] = 10,
                [INVENTORY.Setting.Priority] = 5
            },
            ["TestInvSingleItems"] = {
                [INVENTORY.Setting.TotalSlots] = 10,
                [INVENTORY.Setting.SlotCapacity] = 1,
                [INVENTORY.Setting.Priority] = 4
            },
            ["TestInvSingleStack"] = {
                [INVENTORY.Setting.TotalSlots] = 10,
                [INVENTORY.Setting.SlotCapacity] = 10,
                [INVENTORY.Setting.UseStacks] = false,
                [INVENTORY.Setting.Priority] = 1
            },
            ["TestInvBasicOverflow"] = {
                [INVENTORY.Setting.TotalSlots] = 10,
                [INVENTORY.Setting.SlotCapacity] = 10,
                [INVENTORY.Setting.OverflowInventoryIds] = { "TestInvBasic" },
                [INVENTORY.Setting.AllowNonEmptyContainers] = true,
                [INVENTORY.Setting.Priority] = 3,
            },
            ["TestInvSingleStackOverflow"] = {
                [INVENTORY.Setting.TotalSlots] = 10,
                [INVENTORY.Setting.SlotCapacity] = 10,
                [INVENTORY.Setting.UseStacks] = false,
                [INVENTORY.Setting.OverflowInventoryIds] = { "TestInvBasic" },
                [INVENTORY.Setting.Priority] = 2
            },
            ["TestContainer"] = {
                [INVENTORY.Setting.TotalSlots] = 10,
                [INVENTORY.Setting.SlotCapacity] = 10,
                [INVENTORY.Setting.Priority] = 0,
                [INVENTORY.Setting.IsContainer] = true,
            },
            ["TestTagInventory1"] = {
                [INVENTORY.Setting.TotalSlots] = 10,
                [INVENTORY.Setting.SlotCapacity] = 10,
                [INVENTORY.Setting.Priority] = 1,
                [INVENTORY.Setting.AllowedItems] = { "tag1" }
            },
            ["TestTagInventory2"] = {
                [INVENTORY.Setting.TotalSlots] = 10,
                [INVENTORY.Setting.SlotCapacity] = 10,
                [INVENTORY.Setting.Priority] = 1,
                [INVENTORY.Setting.AllowedItems] = { "tag2", "TestItem1" }
            },
            ["TestTagInventory3"] = {
                [INVENTORY.Setting.TotalSlots] = 10,
                [INVENTORY.Setting.SlotCapacity] = 10,
                [INVENTORY.Setting.Priority] = 1,
                [INVENTORY.Setting.AllowedItems] = { "tag3" }
            },
            ["TestTagInventory1And2"] = {
                [INVENTORY.Setting.TotalSlots] = 10,
                [INVENTORY.Setting.SlotCapacity] = 10,
                [INVENTORY.Setting.Priority] = 1,
                [INVENTORY.Setting.AllowedItems] = { "tag1", "tag2" }
            },
            ["TestOverflowLoop1"] = {
                [INVENTORY.Setting.TotalSlots] = 10,
                [INVENTORY.Setting.SlotCapacity] = 10,
                [INVENTORY.Setting.Priority] = 1,
                [INVENTORY.Setting.OverflowInventoryIds] = { "TestOverflowLoop2" },
            },
            ["TestOverflowLoop2"] = {
                [INVENTORY.Setting.TotalSlots] = 10,
                [INVENTORY.Setting.SlotCapacity] = 10,
                [INVENTORY.Setting.Priority] = 2,
                [INVENTORY.Setting.OverflowInventoryIds] = { "TestOverflowLoop1" },
            }
        }
    })
    print("[UNIT] Inventory data added.")
    INVENTORY.RegisterInventory("TestInvBasic", false)
    INVENTORY.RegisterInventory("TestInvSingleItems", false)
    INVENTORY.RegisterInventory("TestInvSingleStack", false)
    INVENTORY.RegisterInventory("TestInvBasicOverflow", false)
    INVENTORY.RegisterInventory("TestInvSingleStackOverflow", false)
    INVENTORY.RegisterInventory("TestContainer", false)
    INVENTORY.RegisterInventory("TestTagInventory1", false)
    INVENTORY.RegisterInventory("TestTagInventory2", false)
    INVENTORY.RegisterInventory("TestTagInventory3", false)
    INVENTORY.RegisterInventory("TestTagInventory1And2", false)
    INVENTORY.RegisterInventory("TestOverflowLoop1", false)
    INVENTORY.RegisterInventory("TestOverflowLoop2", false)
    INVENTORY.RegisterInventory("TestChest1", true)
    print("[UNIT] Inventory setup complete.")
end

function ClearInventories()
    INVENTORY.ClearInventory(player, "TestInvBasic", false)
    INVENTORY.ClearInventory(player, "TestInvSingleItems", false)
    INVENTORY.ClearInventory(player, "TestInvSingleStack", false)
    INVENTORY.ClearInventory(player, "TestInvBasicOverflow", false)
    INVENTORY.ClearInventory(player, "TestInvSingleStackOverflow", false)
    INVENTORY.ClearInventory(player, "TestContainer", false)
    INVENTORY.ClearInventory(player, "TestTagInventory1", false)
    INVENTORY.ClearInventory(player, "TestTagInventory2", false)
    INVENTORY.ClearInventory(player, "TestTagInventory3", false)
    INVENTORY.ClearInventory(player, "TestTagInventory1And2", false)
    INVENTORY.ClearInventory(player, "TestOverflowLoop1", false)
    INVENTORY.ClearInventory(player, "TestOverflowLoop2", false)
end

function SetupItems()
    DATABASE.AppendData({
        Items = {
            ["TestTaggedItem1"] = {
                [INVENTORY.ItemSettings.Tags] = "tag1"
            },
            ["TestTaggedItem2"] = {
                [INVENTORY.ItemSettings.Tags] = "tag2"
            },
            ["TestTaggedItem1And2"] = {
                [INVENTORY.ItemSettings.Tags] = "tag1,tag2"
            },
            ["TestItem1"] = {
                [INVENTORY.ItemSettings.StackLimit] = 100
            },
            ["TestItem2"] = {
                [INVENTORY.ItemSettings.StackLimit] = 10
            },
            ["TestLimitedItem1"] = {
                [INVENTORY.ItemSettings.StackLimit] = 5
            },
            ["TestContainer"] = {
                ["IsInventory"] = true
            },
            ["TestChest1"] = {
                ["IsInventory"] = true
            }
        }
    })
    print("[UNIT] Items setup complete.")
end

function AddBlindlyTests()
    print("[UNIT] AddBlindlyTests() starting...")

    ClearInventories()

    -- Add to a basic inventory
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 1, nil)
    local amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 1 then
        Fail("Expected 1 item, found: " .. amount)
    end

    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 5, nil)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 6 then
        Fail("Expected 6 items, found: " .. amount)
    end

    -- Spill into the next slot
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 7, nil)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 13 then
        Fail("Expected 13 items, found: " .. amount)
    end

    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 10 then
        Fail("Expected 10 items in slot 1, found: " .. amount)
    end

    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 2)
    if amount ~= 3 then
        Fail("Expected 3 items in slot 2, found: " .. amount)
    end

    -- Add in another item type
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem2", 5, nil)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem2", nil)
    if amount ~= 5 then
        Fail("Expected 5 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem2", 3)
    if amount ~= 5 then
        Fail("Expected 5 items in slot 3, found: " .. amount)
    end

    -- Add to an inventory with slot capacity 1
    INVENTORY.AddToInventory(player, "TestInvSingleItems", INVENTORY.ItemType.Item, "TestItem1", 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleItems", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 1 then
        Fail("Expected 1 item, found: " .. amount)
    end

    INVENTORY.AddToInventory(player, "TestInvSingleItems", INVENTORY.ItemType.Item, "TestItem1", 2)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleItems", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 1 then
        Fail("Expected 1 item in slot 1, found: " .. amount)
    end

    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleItems", INVENTORY.ItemType.Item, "TestItem1", 3)
    if amount ~= 1 then
        Fail("Expected 1 item in slot 3, found: " .. amount)
    end

    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleItems", INVENTORY.ItemType.Item, "TestItem1", 4)
    if amount ~= 0 then
        Fail("Expected 0 items in slot 4, found: " .. amount)
    end

    -- Add to an inventory that only allows one stack per item type
    INVENTORY.AddToInventory(player, "TestInvSingleStack", INVENTORY.ItemType.Item, "TestItem1", 5)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleStack", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 5 then
        Fail("Expected 5 items, found: " .. amount)
    end

    INVENTORY.AddToInventory(player, "TestInvSingleStack", INVENTORY.ItemType.Item, "TestItem1", 10)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleStack", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 5 then
        Fail("Expected 5 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleStack", INVENTORY.ItemType.Item, "TestItem1", 2)
    if amount ~= 0 then
        Fail("Expected 0 items, found: " .. amount)
    end

    -- Fill an existing slot
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 5, 4)
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 3, nil)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 4)
    if amount ~= 8 then
        Fail("Expected 8 items, found: " .. amount)
    end

    -- Fill up inventory
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 100, nil)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 100 then
        Fail("Expected 100 items, found: " .. amount)
    end

    -- Spill over across slots due to a lower item stack limit
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestLimitedItem1", 9, nil)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestLimitedItem1", nil)
    if amount ~= 9 then
        Fail("Expected 9 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestLimitedItem1", 1)
    if amount ~= 5 then
        Fail("Expected 5 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestLimitedItem1", 2)
    if amount ~= 4 then
        Fail("Expected 4 items, found: " .. amount)
    end

    -- Add without a target inventory
    ClearInventories()
    INVENTORY.AddToInventory(player, nil, INVENTORY.ItemType.Item, "TestItem1", 1, nil)
    amount = INVENTORY.GetAmountInInventory(player, nil, INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end

    print("[UNIT] AddBlindlyTests() complete.")
end

function AddToSlotTests()
    print("[UNIT] AddToSlotTests() starting...")

    ClearInventories()

    -- Add to basic inventory slot
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 5, 4)
    local amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 4)
    if amount ~= 5 then
        Fail("Expected 5 items in slot 4, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 0 then
        Fail("Expected 0 items in slot 1, found: " .. amount)
    end

    -- Spill into new slot
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 10, 4)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 4)
    if amount ~= 10 then
        Fail("Expected 10 items in slot 4, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 5 then
        Fail("Expected 5 items in slot 1, found: " .. amount)
    end

    -- Skip over another item
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem2", 1, 2)
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 10, 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 3)
    if amount ~= 5 then
        Fail("Expected 5 items in slot 3, found: " .. amount)
    end

    -- Fill up inventory
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 100, 9)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 100 then
        Fail("Expected 100 items, found: " .. amount)
    end

    -- Multiple stack restriction
    INVENTORY.AddToInventory(player, "TestInvSingleStack", INVENTORY.ItemType.Item, "TestItem1", 5, 6)
    INVENTORY.AddToInventory(player, "TestInvSingleStack", INVENTORY.ItemType.Item, "TestItem1", 3, 2)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleStack", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 5 then
        Fail("Expected 5 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleStack", INVENTORY.ItemType.Item, "TestItem1", 2)
    if amount ~= 0 then
        Fail("Expected 0 items, found: " .. amount)
    end

    print("[UNIT] AddToSlotTests() complete.")
end

function OverflowTests()
    print("[UNIT] OverflowTests() starting...")

    ClearInventories()

    -- Add overflow when space is available
    INVENTORY.AddToInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1", 90)
    INVENTORY.AddToInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1", 15)
    local amount = INVENTORY.GetAmountInInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 100 then
        Fail("Expected 100 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 5 then
        Fail("Expected 5 items, found: " .. amount)
    end

    -- Add overflow when target inventory is full
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1", 100)
    INVENTORY.AddToInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1", 10)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end

    -- Add overflow with no target inventory
    ClearInventories()
    INVENTORY.AddToInventory(player, nil, INVENTORY.ItemType.Item, "TestItem1", 130)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 100 then
        Fail("Expected 100 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleItems", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 20 then
        Fail("Expected 20 items, found: " .. amount)
    end

    -- Overflow with inventories that have circular references to each other and too many items for all inventories
    ClearInventories()
    local result = INVENTORY.AddToInventory(player, "TestOverflowLoop1", INVENTORY.ItemType.Item, "TestItem1", 250)
    if result ~= false then
        Fail("Expected 'false', found: " .. tostring(result))
    end

    print("[UNIT] OverflowTests() complete.")
end

function RemoveTests()
    print("[UNIT] RemoveTests() starting...")

    ClearInventories()

    -- Add overflow when space is available
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 10)
    INVENTORY.RemoveFromInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 4)
    local amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 6 then
        Fail("Expected 6 items, found: " .. amount)
    end

    INVENTORY.RemoveFromInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 6)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 0 then
        Fail("Expected 0 items, found: " .. amount)
    end

    -- Don't remove more than is possible
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 10)
    INVENTORY.RemoveFromInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 20)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end

    -- Remove without specified inventory
    INVENTORY.RemoveFromInventory(player, nil, INVENTORY.ItemType.Item, "TestItem1", 5)
    amount = INVENTORY.GetAmountInInventory(player, nil, INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 5 then
        Fail("Expected 5 items, found: " .. amount)
    end

    -- Remove across slots test
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 100)
    INVENTORY.RemoveFromInventory(player, nil, INVENTORY.ItemType.Item, "TestItem1", 66)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", nil)
    if amount ~= 34 then
        Fail("Expected 34 items, found: " .. amount)
    end

    -- Remove from specific slot
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 30)
    INVENTORY.RemoveFromInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 5, 2)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 2)
    if amount ~= 5 then
        Fail("Expected 5 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1")
    if amount ~= 25 then
        Fail("Expected 25 items, found: " .. amount)
    end

    -- Don't remove wrong item type
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem2", 10)
    INVENTORY.RemoveFromInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 5, 4)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1")
    if amount ~= 25 then
        Fail("Expected 25 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem2", 4)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end

    -- Remove across slots that contain other items
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 10, 5)
    INVENTORY.RemoveFromInventory(player, nil, INVENTORY.ItemType.Item, "TestItem1", 20)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1")
    if amount ~= 15 then
        Fail("Expected 15 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem2", 4)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end

    -- Remove across more than one inventory
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 50)
    INVENTORY.AddToInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1", 50)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1")
    if amount ~= 50 then
        Fail("Expected 50 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1")
    if amount ~= 50 then
        Fail("Expected 50 items, found: " .. amount)
    end

    INVENTORY.RemoveFromInventory(player, nil, INVENTORY.ItemType.Item, "TestItem1", 75)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1")
    if amount ~= 0 then
        Fail("Expected 0 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1")
    if amount ~= 25 then
        Fail("Expected 25 items, found: " .. amount)
    end

    -- Remove with cyclic overflow
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestOverflowLoop1", INVENTORY.ItemType.Item, "TestItem1", 10)
    INVENTORY.AddToInventory(player, "TestOverflowLoop2", INVENTORY.ItemType.Item, "TestItem1", 10)
    local result = INVENTORY.RemoveFromInventory(player, "TestOverflowLoop1", INVENTORY.ItemType.ItemType, "TestItem1", 100)
    if result ~= false then
        Fail("Expected 'false', found: " .. tostring(result))
    end

    print("[UNIT] RemoveTests() complete.")
end

function TransferTests()
    print("[UNIT] TransferTests() starting...")

    ClearInventories()

    -- To specific slot in different empty inventory with enough space
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 10)
    INVENTORY.TransferToInventory(player, "TestInvBasic", 1, "TestInvBasicOverflow", 1)
    local amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1")
    if amount ~= 0 then
        Fail("Expected 0 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end

    -- To anywhere in different empty inventory
    INVENTORY.TransferToInventory(player, "TestInvBasicOverflow", 1, "TestInvBasic", nil)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1")
    if amount ~= 0 then
        Fail("Expected 0 items, found: " .. amount)
    end

    -- To specific slot in same inventory
    INVENTORY.TransferToInventory(player, "TestInvBasic", 1, "TestInvBasic", 5)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 5)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1")
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end

    -- Transfer partial amount to fill slot in other inventory
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 10)
    INVENTORY.AddToInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1", 6)
    INVENTORY.TransferToInventory(player, "TestInvBasic", 1, "TestInvBasicOverflow", 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 6 then
        Fail("Expected 6 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end

    -- Block transfer that violates single-stack restriction
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 10)
    INVENTORY.AddToInventory(player, "TestInvSingleStack", INVENTORY.ItemType.Item, "TestItem1", 10)
    INVENTORY.TransferToInventory(player, "TestInvBasic", 1, "TestInvSingleStack", 2)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleStack", INVENTORY.ItemType.Item, "TestItem1")
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end

    -- Swap different items between two inventories
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 10)
    INVENTORY.AddToInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem2", 10)
    INVENTORY.TransferToInventory(player, "TestInvBasic", 1, "TestInvBasicOverflow", 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem2", 1)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end

    -- Transfer into empty low capacity slot in other invenotry
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 10)
    INVENTORY.TransferToInventory(player, "TestInvBasic", 1, "TestInvSingleItems", 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 9 then
        Fail("Expected 9 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleItems", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end

    -- Block swap between different items when source can't fit fully into target slot
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 10)
    INVENTORY.AddToInventory(player, "TestInvSingleItems", INVENTORY.ItemType.Item, "TestItem2", 1)
    INVENTORY.TransferToInventory(player, "TestInvBasic", 1, "TestInvSingleItems", 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleItems", INVENTORY.ItemType.Item, "TestItem2", 1)
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end

    -- Block swap when target can't fit into source slot
    INVENTORY.TransferToInventory(player, "TestInvSingleItems", 1, "TestInvBasic", 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvSingleItems", INVENTORY.ItemType.Item, "TestItem2", 1)
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end

    -- Move item to empty slot in same inventory
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 10)
    INVENTORY.TransferToInventory(player, "TestInvBasic", 1, "TestInvBasic", 5)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 0 then
        Fail("Expected 0 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 5)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end

    -- Fill other partial slot in same inventory
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 4, 3)
    INVENTORY.TransferToInventory(player, "TestInvBasic", 5, "TestInvBasic", 3)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 3)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 5)
    if amount ~= 4 then
        Fail("Expected 4 items, found: " .. amount)
    end

    -- Swap different items in same inventory
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem2", 10)
    INVENTORY.TransferToInventory(player, "TestInvBasic", 3, "TestInvBasic", 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem1", 1)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestItem2", 3)
    if amount ~= 10 then
        Fail("Expected 10 items, found: " .. amount)
    end

    -- Fill a partial slot with a lowered stack limit
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestLimitedItem1", 2, 1)
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestLimitedItem1", 5, 3)
    INVENTORY.TransferToInventory(player, "TestInvBasic", 3, "TestInvBasic", 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestLimitedItem1", 1)
    if amount ~= 5 then
        Fail("Expected 5 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestLimitedItem1", 3)
    if amount ~= 2 then
        Fail("Expected 2 items, found: " .. amount)
    end

    print("[UNIT] TransferTests() complete.")
end

function ContainerTests()
    print("[UNIT] ContainerTests() starting...")

    -- Add one
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Inventory, "TestChest1", 1)
    local amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Inventory, "TestChest1")
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end

    -- Add more to same slot
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Inventory, "TestChest1", 2)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Inventory, "TestChest1")
    if amount ~= 3 then
        Fail("Expected 3 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Inventory, "TestChest1", 1)
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Inventory, "TestChest1", 2)
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Inventory, "TestChest1", 3)
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end

    -- Adding containers with items in them
    ClearInventories()
    Task.Wait(1)
    INVENTORY.AddToInventory(player, "TestContainer", INVENTORY.ItemType.Item, "TestItem1", 1)
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Inventory, "TestContainer", 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Inventory, "TestContainer")
    if amount ~= 0 then
        Fail("Expected 0 items, found: " .. amount)
    end

    INVENTORY.AddToInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Inventory, "TestContainer", 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasicOverflow", INVENTORY.ItemType.Inventory, "TestContainer")
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end

    print("[UNIT] ContainerTests() complete.")
end

function TagTests()
    print("[UNIT] TagTests() starting...")
    ClearInventories()

    -- Add with matching tag
    INVENTORY.AddToInventory(player, "TestTagInventory1", INVENTORY.ItemType.Item, "TestTaggedItem1", 1)
    local amount = INVENTORY.GetAmountInInventory(player, "TestTagInventory1", INVENTORY.ItemType.Item, "TestTaggedItem1")
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end

    -- Block add with incorrect tag
    INVENTORY.AddToInventory(player, "TestTagInventory1", INVENTORY.ItemType.Item, "TestTaggedItem2", 15)
    amount = INVENTORY.GetAmountInInventory(player, "TestTagInventory1", INVENTORY.ItemType.Item, "TestTaggedItem2")
    if amount ~= 0 then
        Fail("Expected 0 items, found: " .. amount)
    end

    -- Add with no tags but matching id
    INVENTORY.AddToInventory(player, "TestTagInventory2", INVENTORY.ItemType.Item, "TestItem1", 20)
    amount = INVENTORY.GetAmountInInventory(player, "TestTagInventory2", INVENTORY.ItemType.Item, "TestItem1")
    if amount ~= 20 then
        Fail("Expected 20 items, found: " .. amount)
    end

    -- Add tagged item to inventory with no tags
    INVENTORY.AddToInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestTaggedItem1", 15)
    amount = INVENTORY.GetAmountInInventory(player, "TestInvBasic", INVENTORY.ItemType.Item, "TestTaggedItem1")
    if amount ~= 15 then
        Fail("Expected 15 items, found: " .. amount)
    end

    -- Add item with multiple tags
    INVENTORY.AddToInventory(player, "TestTagInventory1", INVENTORY.ItemType.Item, "TestTaggedItem1And2", 5)
    INVENTORY.AddToInventory(player, "TestTagInventory2", INVENTORY.ItemType.Item, "TestTaggedItem1And2", 5)
    amount = INVENTORY.GetAmountInInventory(player, "TestTagInventory1", INVENTORY.ItemType.Item, "TestTaggedItem1And2")
    if amount ~= 5 then
        Fail("Expected 5 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestTagInventory2", INVENTORY.ItemType.Item, "TestTaggedItem1And2")
    if amount ~= 5 then
        Fail("Expected 5 items, found: " .. amount)
    end

    -- Check multiple items where all are supported
    ClearInventories()
    local items = {}
    items["TestItem1"] = 10
    items["TestTaggedItem2"] = 10
    local result = INVENTORY.CanAddItemsToInventory(player, "TestTagInventory2", items)
    if result ~= true then
        Fail("Expected 'true', found: " .. tostring(result))
    end

    -- Check multiple items where only some are supported
    items = {}
    items["TestTaggedItem1"] = 10
    items["TestTaggedItem2"] = 10
    local result = INVENTORY.CanAddItemsToInventory(player, "TestTagInventory1", items)
    if result ~= false then
        Fail("Expected 'false', found: " .. tostring(result))
    end

    -- Transfer tagged item in same inventory
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestTagInventory1", INVENTORY.ItemType.Item, "TestTaggedItem1", 1)
    INVENTORY.TransferToInventory(player, "TestTagInventory1", 1, "TestTagInventory1", 5)
    amount = INVENTORY.GetAmountInInventory(player, "TestTagInventory1", INVENTORY.ItemType.Item, "TestTaggedItem1", 5)
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end

    -- Block transfer of source tagged item to disallowed inventory
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestTagInventory1", INVENTORY.ItemType.Item, "TestTaggedItem1", 1)
    INVENTORY.TransferToInventory(player, "TestTagInventory1", 1, "TestTagInventory3", 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestTagInventory1", INVENTORY.ItemType.Item, "TestTaggedItem1", 1)
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestTagInventory3", INVENTORY.ItemType.Item, "TestTaggedItem1", 1)
    if amount ~= 0 then
        Fail("Expected 0 items, found: " .. amount)
    end

    -- Block transfer of target tagged item to disallowed inventory
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestTagInventory1", INVENTORY.ItemType.Item, "TestTaggedItem1", 1)
    INVENTORY.AddToInventory(player, "TestTagInventory2", INVENTORY.ItemType.Item, "TestTaggedItem2", 1)
    INVENTORY.TransferToInventory(player, "TestTagInventory1", 1, "TestTagInventory2", 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestTagInventory1", INVENTORY.ItemType.Item, "TestTaggedItem1", 1)
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestTagInventory2", INVENTORY.ItemType.Item, "TestTaggedItem2", 1)
    if amount ~= 1 then
        Fail("Expected 1 items, found: " .. amount)
    end

    -- Transfer between two allowed inventories
    ClearInventories()
    INVENTORY.AddToInventory(player, "TestTagInventory1And2", INVENTORY.ItemType.Item, "TestTaggedItem1", 2)
    INVENTORY.AddToInventory(player, "TestTagInventory1And2", INVENTORY.ItemType.Item, "TestTaggedItem2", 5)
    INVENTORY.TransferToInventory(player, "TestTagInventory1And2", 1, "TestTagInventory1And2", 1)
    amount = INVENTORY.GetAmountInInventory(player, "TestTagInventory1And2", INVENTORY.ItemType.Item, "TestTaggedItem2")
    if amount ~= 5 then
        Fail("Expected 5 items, found: " .. amount)
    end
    amount = INVENTORY.GetAmountInInventory(player, "TestTagInventory1And2", INVENTORY.ItemType.Item, "TestTaggedItem1")
    if amount ~= 2 then
        Fail("Expected 2 items, found: " .. amount)
    end

    print("[UNIT] TagTests() complete.")
end

function UnregisterTests()
    print("[UNIT] UnregisterTests() starting...")

    INVENTORY.UnregisterInventory("TestInvBasic")
    INVENTORY.UnregisterInventory("TestInvSingleItems")
    INVENTORY.UnregisterInventory("TestInvSingleStack")
    INVENTORY.UnregisterInventory("TestInvBasicOverflow")
    INVENTORY.UnregisterInventory("TestInvSingleStackOverflow")
    INVENTORY.UnregisterInventory("TestContainer")
    INVENTORY.UnregisterInventory("TestTagInventory1")
    INVENTORY.UnregisterInventory("TestTagInventory2")
    INVENTORY.UnregisterInventory("TestTagInventory3")
    INVENTORY.UnregisterInventory("TestTagInventory1And2")
    INVENTORY.UnregisterInventory("TestOverflowLoop1")
    INVENTORY.UnregisterInventory("TestOverflowLoop2")
    INVENTORY.UnregisterInventory("TestContainer")
    INVENTORY.UnregisterInventory("TestChest1")

    local inventoryContext = World.FindObjectByName("Inventories Context (Local)")
    if not inventoryContext then
        Fail("Could not find Inventories Context container object.")
    else
        local amount = #inventoryContext:GetChildren()
        if amount ~= 0 then
            Fail("Expected 0 Inventory Objects, found: " .. amount)
        end
    end

    print("[UNIT] UnregisterTests() complete.")
end

Task.Spawn(function()
    while #Game.GetPlayers() == 0 do
        Task.Wait()
    end

    player = Game.GetPlayers()[1]
    RunUnitTests()
end, 1)
