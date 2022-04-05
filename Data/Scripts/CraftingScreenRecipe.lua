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
    A simple Recipe Slot that displays a recipe icon and name. This version makes use of some Input System components to
    handle broadcasting events.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

---@type APICrafting
local CRAFTING = require(script:GetCustomProperty("APICrafting"))
---@type APIInteractionManager
local INTERACTION = require(script:GetCustomProperty("APIInteractionManager"))
---@type APIIconManager
local ICON_MANAGER = require(script:GetCustomProperty("APIIconManager"))
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))

local ICON = COMPONENT_ROOT:GetCustomProperty("Icon"):WaitForObject()
local NAME = COMPONENT_ROOT:GetCustomProperty("Name"):WaitForObject()
local DISABLED_ICON_TINT = COMPONENT_ROOT:GetCustomProperty("DisabledIconTint") ---@type Color

-- Private Variables
local recipeId
local iconCameraId

function Initialize(id, cameraId)
    recipeId = id
    iconCameraId = cameraId

    -- Set data on the BroadcastEvent Component so it will relay it when it fires.
    INTERACTION.SetData(COMPONENT_ROOT, nil, recipeId)

    Setup()
end

function Setup()
    local recipeData = CRAFTING.GetRecipeData(recipeId)
    if recipeData then
        -- Override icon if needed
        if recipeData.IconCameraId and recipeData.IconCameraId ~= "" then
            iconCameraId = recipeData.IconCameraId
        end

        ICON.visibility = Visibility.INHERIT
        if recipeData.IsKitbashed2DIcon then
            ICON:SetImage(nil)
            ICON:SetColor(Color.New(0, 0, 0, 0))
            World.SpawnAsset(recipeData.IconAsset, { parent = ICON })
        elseif recipeData.Is3DIcon then
            ICON_MANAGER.SetIcon(ICON, iconCameraId, recipeData.IconAsset, CameraCaptureResolution.VERY_SMALL)
        elseif recipeData.IsImageIcon then
            ICON:SetImage(recipeData.IconAsset)
        else
            ICON.visibility = Visibility.FORCE_OFF
        end

        NAME.text = DATABASE.Recipes[recipeId].Name
    else
        ICON.visibility = Visibility.FORCE_OFF
        NAME.text = ""
    end
end

function SetAvailable()
    ICON:SetColor(Color.WHITE)
end

function SetUnavailable()
    ICON:SetColor(DISABLED_ICON_TINT)
end