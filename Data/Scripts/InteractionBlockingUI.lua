--[[
Copyright 2022 Manticore Games, Inc.

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
    This script will disable an interaction module when the cursor moves over the target area of the UI
    and reenables it when the cursor leaves that area or this script is destroyed.
--]]

-- Custom
local TARGET_AREA = script:GetCustomProperty("TargetArea"):WaitForObject() ---@type UIControl
local DISABLE_INTERACTION_MODULE = require(script:GetCustomProperty("DisableInteractionModule"))

-- API
local MARKER_ASSET = script:GetCustomProperty("MarkerAsset")
local INTERACTION = require(script:GetCustomProperty("APIInteractionManager")) ---@type APIInteractionManager

local topLeftMarker = nil ---@type UIControl
local bottomRightMarker = nil ---@type UIControl
local isEnabled = nil

function Initialize()
    topLeftMarker = World.SpawnAsset(MARKER_ASSET, { parent = TARGET_AREA, name = "TopLeftMarker" }) ---@type UIControl
    bottomRightMarker = World.SpawnAsset(MARKER_ASSET, { parent = TARGET_AREA, name = "BottomRightMarker" }) ---@type UIControl
    bottomRightMarker.anchor = UIPivot.BOTTOM_RIGHT
    bottomRightMarker.dock = UIPivot.BOTTOM_RIGHT
    script.destroyEvent:Connect(OnDestroy)
end

function OnDestroy()
    if isEnabled == false then
        INTERACTION.EnableModule(DISABLE_INTERACTION_MODULE.Module)
    end
end

function Tick()
    local position = topLeftMarker:GetAbsolutePosition()
    local size = bottomRightMarker:GetAbsolutePosition() - position

    local cursorPos = UI.GetCursorPosition()
    if cursorPos.x >= position.x and cursorPos.x <= position.x + size.x
        and cursorPos.y >= position.y and cursorPos.y <= position.y + size.y then
        if isEnabled == nil or isEnabled == true then
            isEnabled = false
            INTERACTION.DisableModule(DISABLE_INTERACTION_MODULE.Module)
        end
    else
        if isEnabled == false then
            isEnabled = true
            INTERACTION.EnableModule(DISABLE_INTERACTION_MODULE.Module)
        end
    end
end

Initialize()