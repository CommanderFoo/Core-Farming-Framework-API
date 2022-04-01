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

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

---@type APICrafting
local CRAFTING = require(script:GetCustomProperty("APICrafting"))
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APIIconManager
local ICON_MANAGER = require(script:GetCustomProperty("APIIconManager"))
---@type APIUILibrary
local UI = require(script:GetCustomProperty("APIUILibrary"))

local OUTPUT_ICON = COMPONENT_ROOT:GetCustomProperty("OutputIcon"):WaitForObject() ---@type UIImage
local OUTPUT_NAME = COMPONENT_ROOT:GetCustomProperty("OutputName"):WaitForObject() ---@type UIText
local TIME_REMAINING_TEXT = COMPONENT_ROOT:GetCustomProperty("TimeRemainingText"):WaitForObject() ---@type UIText
local PROGRESS = COMPONENT_ROOT:GetCustomProperty("Progress"):WaitForObject() ---@type UIProgressBar

-- Constants
local LOCAL_PLAYER = Game.GetLocalPlayer()

-- Private Variables
local iconCameraId
local craftingStationId

function Initialize(id, dataId, cameraId)
    COMPONENT_ROOT.visibility = Visibility.FORCE_ON

    craftingStationId = id
    iconCameraId = cameraId

    local state
    if craftingStationId then
        state = CRAFTING.GetCraftingStationState(craftingStationId)
    else
        state = CRAFTING.GetCraftingState(LOCAL_PLAYER.id)
    end

    OUTPUT_NAME.text = CRAFTING.GetOutputText(state.recipeId, state.amountToCraft)
    OUTPUT_ICON.visibility = Visibility.INHERIT

    local recipeData = DATABASE.Recipes[state.recipeId]
    if recipeData.IsKitbashed2DIcon then
        OUTPUT_ICON:SetImage(nil)
        OUTPUT_ICON:SetColor(Color.New(0, 0, 0, 0))
        World.SpawnAsset(recipeData.IconAsset, { parent = OUTPUT_ICON })
    elseif recipeData.Is3DIcon then
        ICON_MANAGER.SetIcon(OUTPUT_ICON, iconCameraId, recipeData.IconAsset, CameraCaptureResolution.MEDIUM)
    elseif recipeData.IsImageIcon then
        OUTPUT_ICON:SetImage(recipeData.IconAsset)
    else
        OUTPUT_ICON.visibility = Visibility.FORCE_OFF
    end
end

function Cleanup()
    if Object.IsValid(COMPONENT_ROOT) then
        COMPONENT_ROOT.visibility = Visibility.FORCE_OFF
    end
end

function Tick(deltaTime)
    if not COMPONENT_ROOT:IsVisibleInHierarchy() then
        return
    end

    local state
    if craftingStationId then
        state = CRAFTING.GetCraftingStationState(craftingStationId)
    else
        state = CRAFTING.GetCraftingState(LOCAL_PLAYER.id)
    end

    PROGRESS.progress = state.craftAmount
    TIME_REMAINING_TEXT.text = string.format("Time Remaining: %s", UI.FormatTime(state.craftTimeRemaining + 1, UI.TimeFormatStyle.Character))
end

COMPONENT_ROOT.visibility = Visibility.FORCE_OFF