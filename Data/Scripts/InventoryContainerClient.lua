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
    This script runs on each Inventory Container on the client. This is not meant for use with the CoreObject Hierarchy
    Replicator, but as hand placed containers in the scene.
--]]

local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

---@type APIInteractionManager
local INTERACTION = require(script:GetCustomProperty("APIInteractionManager"))
local BROADCAST_EVENT_COMPONENT = script:GetCustomProperty("BroadcastEventComponent"):WaitForObject()
local INVENTORY_ID = COMPONENT_ROOT:GetCustomProperty("InventoryId")

if not INVENTORY_ID or INVENTORY_ID == "" then
    error(string.format("The \"InventoryId\" Custom property must be filled out on object: %s (%s)", COMPONENT_ROOT.name, COMPONENT_ROOT.id))
    return
end

function Initialize()
    -- Set the broadcast event component data (screenId, inventoryId)
    INTERACTION.SetData(COMPONENT_ROOT, BROADCAST_EVENT_COMPONENT, INVENTORY_ID, INVENTORY_ID)
end

-- Let components register
Task.Wait()

Initialize()