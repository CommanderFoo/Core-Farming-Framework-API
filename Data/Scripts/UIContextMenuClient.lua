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
    A generic customalizable Context Menu widget.

    It displays when it receives the broadcasted DISPLAY_EVENT. Any data provided included the display event
    is then passed back out through the INTERACTION_EVENT when the user selects an option.

    The menu can also be displayed manually with a direct call to Display().
--]]

local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()---@type UIControl
local DISPLAY_EVENT = script:GetCustomProperty("DisplayEvent") ---@type string
local DISPLAY_OFFSET = script:GetCustomProperty("DisplayOffset") ---@type Vector2
local INTERACTION_EVENT = script:GetCustomProperty("InteractionEvent") ---@type string
local SLOT_ASSET = script:GetCustomProperty("SlotAsset") ---@type UIControl
local SLOT_HEIGHT = script:GetCustomProperty("SlotHeight") ---@type number
local MOUSE_BLOCKER = script:GetCustomProperty("MouseBlocker"):WaitForObject() ---@type UIButton
local UI_LIBRARY = require(script:GetCustomProperty("APIUILibrary")) ---@type APIUILibrary

local displayEventListener = nil

local currentData = nil
local slotLookup = {}

function Display(position, options, data)
    ClearSlots()
    currentData = data

    local y = 0
    local index = 1

    for _,option in pairs(options) do
        local slot = World.SpawnAsset(SLOT_ASSET, { parent = COMPONENT_ROOT })
        slot.y = y
        y = y + SLOT_HEIGHT

        slot:FindChildByName("Text").text = tostring(option)

        local button = slot:FindChildByType("UIButton")
        button.clickedEvent:Connect(OnSlotClicked)

        slotLookup[button] = { root = slot, index = index, option = option }
        index = index + 1
    end
    COMPONENT_ROOT.height = y

    COMPONENT_ROOT.x = position.x + DISPLAY_OFFSET.x
    COMPONENT_ROOT.y = position.y + DISPLAY_OFFSET.y
    UI_LIBRARY.ClampToScreen(COMPONENT_ROOT)
    COMPONENT_ROOT.visibility = Visibility.FORCE_ON
end

function OnDestroy()
    if displayEventListener then
        displayEventListener:Disconnect()
        displayEventListener = nil
    end
end

function ClearSlots()
    for _,slot in pairs(slotLookup) do
        slot.root:Destroy()
    end

    slotLookup = {}
end

function Hide()
    ClearSlots()
    COMPONENT_ROOT.visibility = Visibility.FORCE_OFF
end

function OnBindingPressed(player, binding)
    if binding == "ability_primary" then
        if not UI_LIBRARY.IsCursorOver(COMPONENT_ROOT, false) then
            Hide()
        end
    end
end

function OnDisplayEvent(position, options, data)
    Display(position, options, data)
end

function OnSlotClicked(slotButton)
    Events.Broadcast(INTERACTION_EVENT, slotLookup[slotButton].option, currentData)
    Hide()
end

Hide()

if DISPLAY_EVENT and DISPLAY_EVENT ~= "" then
    displayEventListener = Events.Connect(DISPLAY_EVENT, OnDisplayEvent)
end

if MOUSE_BLOCKER then
    MOUSE_BLOCKER.pressedEvent:Connect(Hide)
end

COMPONENT_ROOT.destroyEvent:Connect(OnDestroy)
Game.GetLocalPlayer().bindingPressedEvent:Connect(OnBindingPressed)