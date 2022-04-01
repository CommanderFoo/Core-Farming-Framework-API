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

local OUTPUT_ICON = COMPONENT_ROOT:GetCustomProperty("OutputIcon"):WaitForObject()
local OUTPUT_NAME = COMPONENT_ROOT:GetCustomProperty("OutputName"):WaitForObject()
local COLLECT_BUTTON = COMPONENT_ROOT:GetCustomProperty("CollectButton"):WaitForObject()

-- Constants
local LOCAL_PLAYER = Game.GetLocalPlayer()

-- Private Variables
local craftingStationId
local iconCameraId
local listeners

function Initialize(id, dataId, cameraId)
    COMPONENT_ROOT.visibility = Visibility.FORCE_ON

    craftingStationId = id
    iconCameraId = cameraId

    local currentRecipeId
    local currentAmount
    if craftingStationId then
        local craftingStationState = CRAFTING.GetCraftingStationState(craftingStationId)
        currentRecipeId = craftingStationState.recipeId
        currentAmount = craftingStationState.amountToCraft
    else
        local craftingState = CRAFTING.GetCraftingState(LOCAL_PLAYER.id)
        currentRecipeId = craftingState.recipeId
        currentAmount = craftingState.amountToCraft
    end

    OUTPUT_NAME.text = CRAFTING.GetOutputText(currentRecipeId, currentAmount)
    OUTPUT_ICON.visibility = Visibility.INHERIT

    local recipeData = DATABASE.Recipes[currentRecipeId]
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

    listeners = {
        COLLECT_BUTTON.clickedEvent:Connect(OnCollectButtonClicked)
    }
end

function Cleanup()
    for _, listener in ipairs(listeners) do
        listener:Disconnect()
    end
    listeners = nil

    if Object.IsValid(COMPONENT_ROOT) then
        COMPONENT_ROOT.visibility = Visibility.FORCE_OFF
    end
end

function OnCollectButtonClicked()
    local canCollect, errorMessage = CRAFTING.CanCollect(LOCAL_PLAYER, craftingStationId)
    if canCollect then
        COLLECT_BUTTON.isInteractable = false
        CRAFTING.Collect(LOCAL_PLAYER, craftingStationId)
    else
        Events.Broadcast("Error", errorMessage)
    end
end

COMPONENT_ROOT.visibility = Visibility.FORCE_OFF