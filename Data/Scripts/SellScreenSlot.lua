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
    A simple Slot that displays an item along with its icon and amount. This version makes use of some input system
    components to handle broadcasting events.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
---@type APIInteractionManager
local INPUT = require(script:GetCustomProperty("APIInteractionManager"))
---@type APIIconManager
local ICON_MANAGER = require(script:GetCustomProperty("APIIconManager"))
---@type APIInventory
local INVENTORY = require(script:GetCustomProperty("APIInventory"))

local TOGGLE_TOOLTIP_COMPONENT = script:GetCustomProperty("ToggleTooltipComponent"):WaitForObject()
local CLICK_EVENT_COMPONENT = script:GetCustomProperty("ClickEventComponent"):WaitForObject()

local BACKGROUND = COMPONENT_ROOT:GetCustomProperty("Background"):WaitForObject()
local ICON = COMPONENT_ROOT:GetCustomProperty("Icon"):WaitForObject()
local AMOUNT = COMPONENT_ROOT:GetCustomProperty("Amount"):WaitForObject()
local DRAG_PROXY_TEMPLATE = COMPONENT_ROOT:GetCustomProperty("DragProxyTemplate")

-- Private Variables
local slotIndex
local sellableData
local iconCameraId
local listeners = {}

function Initialize(data, index, cameraId)
    sellableData = data
    slotIndex = index
    iconCameraId = cameraId

    -- Set data on the BroadcastEvent Components so they relay it when they fire.
    INPUT.SetData(COMPONENT_ROOT, CLICK_EVENT_COMPONENT, slotIndex)

    -- Set Tooltip data
    if sellableData then
        INPUT.SetData(COMPONENT_ROOT, TOGGLE_TOOLTIP_COMPONENT, string.format("%s\n%s", sellableData.Name, sellableData.Description))

        -- Override icon if needed
        if sellableData.IconCameraId ~= "" then
            iconCameraId = sellableData.IconCameraId
        end
    end

    COMPONENT_ROOT.destroyEvent:Connect(Cleanup)

    Setup()
end

function Cleanup()
    for _, listener in ipairs(listeners) do
        listener:Disconnect()
    end

    listeners = {}
    slotIndex = nil
end

function Setup()
    if sellableData then
        BACKGROUND.visibility = Visibility.INHERIT
        if sellableData.IsKitbashed2DIcon then
            ICON:SetImage(nil)
            ICON:SetColor(Color.New(0, 0, 0, 0))
            World.SpawnAsset(sellableData.IconAsset, { parent = ICON })
        elseif sellableData.Is3DIcon then
            ICON_MANAGER.SetIcon(ICON, iconCameraId, sellableData.IconAsset, CameraCaptureResolution.SMALL)
        elseif sellableData.IsImageIcon then
            ICON:SetImage(sellableData.IconAsset)
        else
            ICON.visibility = Visibility.FORCE_OFF
        end

        AMOUNT.text = string.format("x%d", INVENTORY.GetAmountInInventory(Game.GetLocalPlayer(), nil, INVENTORY.ItemType.Item, sellableData.ItemId))
    else
        -- This slot is empty
        BACKGROUND.visibility = Visibility.FORCE_OFF
        ICON.visibility = Visibility.FORCE_OFF
        AMOUNT.text = ""
    end
end

-- Spawn and return a copy of this slot
function GetDragProxy()
    local dragProxy = World.SpawnAsset(DRAG_PROXY_TEMPLATE)
    local controllerRef = dragProxy:GetCustomProperty("Controller")
    local controller

    if controllerRef and controllerRef.isAssigned then
        controller = controllerRef:WaitForObject().context
        if controller then
            controller.Initialize(sellableData, INVENTORY.GetAmountInInventory(Game.GetLocalPlayer(), nil, INVENTORY.ItemType.Item, sellableData.ItemId), iconCameraId)
        end
    end

    return dragProxy
end