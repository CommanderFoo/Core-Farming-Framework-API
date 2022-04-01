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
    This is a simple script to allow for setting the display object and Purchaseable data for sisplay in a Purchase Item
    Screen. It assumes there is a BroadcastEventComponentClient child that it can set the Purchaseable data on. This
    BroadcastEventComponent should broadcast a "PCH_purchaseableClicked" event on the client.

    Purchaseable data can be set by id or reference.

    If set by id, the Purchaseable data must reside in a Database or have been added to APIDatabase in another way.

    If set by reference, the Purchaseable data must exist on this object.
--]]

local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

---@type APIInteractionManager
local INPUT_MANAGER = require(script:GetCustomProperty("APIInteractionManager"))
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))

local OUTLINE = script:GetCustomProperty("OutlineObject"):WaitForObject()
local BROADCAST_EVENT_COMPONENT = script:GetCustomProperty("BroadcastEventComponent"):WaitForObject()

local DISPLAY_OBJECT = COMPONENT_ROOT:GetCustomProperty("DisplayObject"):WaitForObject()
local PURCHASEABLE_ID = COMPONENT_ROOT:GetCustomProperty("PurchaseableId")
local PURCHASEABLE_DATA_REF = COMPONENT_ROOT:GetCustomProperty("PurchaseableData")
local PURCHASEABLE_DATA

if PURCHASEABLE_DATA_REF and PURCHASEABLE_DATA_REF.isAssigned then
    PURCHASEABLE_DATA = PURCHASEABLE_DATA_REF:WaitForObject()
end

-- Private Variables
local purchaseableData

function Initialize()
    -- Find Purchaseable Data
    local purchaseableId
    if PURCHASEABLE_ID and PURCHASEABLE_ID ~= "" then
        if not DATABASE.Purchaseables then
            warn("Database does not contain a \"Purchaseables\" group of datas")
            return
        end

        purchaseableId = PURCHASEABLE_ID
        purchaseableData = DATABASE.Purchaseables[purchaseableId]
    elseif PURCHASEABLE_DATA then
        purchaseableId = PURCHASEABLE_DATA.name
        purchaseableData = DATABASE.ParseCoreObject(PURCHASEABLE_DATA, true, false)
    end

    if not purchaseableData then
        if PURCHASEABLE_ID then
            warn(string.format("Could not find any Purchaseable Data for Purchaseable id: %s on object: %s. Purchaseable Data should be in a Database under a \"Purchaseables\" parent if referenced by id.", PURCHASEABLE_ID, COMPONENT_ROOT.name))
        elseif PURCHASEABLE_DATA then
            warn(string.format("Could not find any Purchaseable Data on object: %s. Purchaseable Data should be a direct child if referenced as an object.", COMPONENT_ROOT.name))
        else
            warn(string.format("Could not find any Purchaseable Data for Purchaseable id: %s on object: %s. Purchaseable Data can be in a Database under a \"Purchaseables\" parent if referenced by id, or a direct child of this object.", PURCHASEABLE_ID, COMPONENT_ROOT.name))
        end
        return
    end

    -- Setup event data
    INPUT_MANAGER.SetData(COMPONENT_ROOT, BROADCAST_EVENT_COMPONENT, purchaseableData)

    -- Setup outline
    if Object.IsValid(DISPLAY_OBJECT) then
        OUTLINE:SetSmartProperty("Object To Outline", DISPLAY_OBJECT:GetReference())
    else
        OUTLINE:SetSmartProperty("Object To Outline", nil)
    end

    OUTLINE.visibility = Visibility.FORCE_OFF
end

-- Let the Input Components register
Task.Wait()

Initialize()