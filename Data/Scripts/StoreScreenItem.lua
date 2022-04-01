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
    A simple Item Slot that displays a Purchaseable icon and name. This version makes use of some Input System components
    to handle broadcasting events.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

local INPUT = require(script:GetCustomProperty("APIInputManager")) ---@type APIInteractionManager
local ICON_MANAGER = require(script:GetCustomProperty("APIIconManager")) ---@type APIIconManager

local ICON = COMPONENT_ROOT:GetCustomProperty("Icon"):WaitForObject() ---@type UIImage
local NAME = COMPONENT_ROOT:GetCustomProperty("Name"):WaitForObject() ---@type UIText
local AMOUNT = COMPONENT_ROOT:GetCustomProperty("Amount"):WaitForObject() ---@type UIText
local SOLD_OUT = COMPONENT_ROOT:GetCustomProperty("SoldOut"):WaitForObject() ---@type UIText
local LOCKED = COMPONENT_ROOT:GetCustomProperty("Locked"):WaitForObject() ---@type UIText
local DISABLED_ICON_TINT = COMPONENT_ROOT:GetCustomProperty("DisabledIconTint") ---@type Color

-- Private Variables
local purchaseableData
local purchaseableIndex
local iconCameraId

function Initialize(data, index, cameraId)
    purchaseableData = data
    purchaseableIndex = index
    iconCameraId = cameraId

    -- Override icon if needed
    if purchaseableData.IconCameraId and purchaseableData.IconCameraId ~= "" then
        iconCameraId = purchaseableData.IconCameraId
    end

    -- Set data on the BroadcastEvent Component so it will relay it when it fires.
    INPUT.SetData(COMPONENT_ROOT, nil, purchaseableIndex)

    Setup()
end

function Setup()
    if purchaseableData then
        if purchaseableData.IsKitbashed2DIcon then
            ICON:SetImage(nil)
            ICON:SetColor(Color.New(0, 0, 0, 0))
            World.SpawnAsset(purchaseableData.IconAsset, { parent = ICON })
        elseif purchaseableData.Is3DIcon then
            ICON_MANAGER.SetIcon(ICON, iconCameraId, purchaseableData.IconAsset, CameraCaptureResolution.VERY_SMALL)
        elseif purchaseableData.IsImageIcon then
            ICON:SetImage(purchaseableData.IconAsset)
        else
            ICON.visibility = Visibility.FORCE_OFF
        end

        NAME.text = purchaseableData.Name
    else
        ICON.visibility = Visibility.FORCE_OFF
        NAME.text = ""
    end
end

function SetLocked()
    if SOLD_OUT.visibility ~= Visibility.FORCE_ON then
        ICON:SetColor(DISABLED_ICON_TINT)
        LOCKED.visibility = Visibility.FORCE_ON
        AMOUNT.visibility = Visibility.FORCE_OFF
    end
end

function SetSoldOut()
    ICON:SetColor(DISABLED_ICON_TINT)
    AMOUNT.visibility = Visibility.FORCE_OFF
    SOLD_OUT.visibility = Visibility.FORCE_ON
    LOCKED.visibility = Visibility.FORCE_OFF
end

function SetUnavailable()
    ICON:SetColor(DISABLED_ICON_TINT)
    AMOUNT.visibility = Visibility.FORCE_OFF
    SOLD_OUT.visibility = Visibility.FORCE_OFF
    LOCKED.visibility = Visibility.FORCE_OFF
end

function SetAvailable(limitedAmount)
    if limitedAmount then
        AMOUNT.visibility = Visibility.FORCE_ON
        AMOUNT.text = tostring(limitedAmount)
    end

    ICON:SetColor(Color.WHITE)
    SOLD_OUT.visibility = Visibility.FORCE_OFF
    LOCKED.visibility = Visibility.FORCE_OFF
end
