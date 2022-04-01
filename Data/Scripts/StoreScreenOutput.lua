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
    A simple Slot that displays an icon, name and potential amount / percent chance.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

---@type APIIconManager
local ICON_MANAGER = require(script:GetCustomProperty("APIIconManager"))

local ICON = COMPONENT_ROOT:GetCustomProperty("Icon"):WaitForObject()
local NAME = COMPONENT_ROOT:GetCustomProperty("Name"):WaitForObject()
local AMOUNT = COMPONENT_ROOT:GetCustomProperty("Amount"):WaitForObject()

-- Private Variables
local potentialOutput
local outputData
local multiplier
local iconCameraId

function Initialize(data, output, amount, cameraId)
    outputData = data
    potentialOutput = output
    multiplier = amount
    iconCameraId = cameraId

    Setup()
end

function Setup()
    if outputData.IsKitbashed2DIcon then
        ICON:SetImage(nil)
        ICON:SetColor(Color.New(0, 0, 0, 0))
        World.SpawnAsset(outputData.IconAsset, { parent = ICON })
    elseif outputData.Is3DIcon then
        ICON_MANAGER.SetIcon(ICON, iconCameraId, outputData.IconAsset, CameraCaptureResolution.VERY_SMALL)
    elseif outputData.IsImageIcon then
        ICON:SetImage(outputData.IconAsset)
    else
        ICON.visibility = Visibility.FORCE_OFF
    end

    NAME.text = outputData.Name

    local amountString = ""
    if potentialOutput.MinAmount >= potentialOutput.MaxAmount then
        amountString = string.format("x%d", potentialOutput.MinAmount * multiplier)
    else
        amountString = string.format("x%d - %d", potentialOutput.MinAmount * multiplier, potentialOutput.MaxAmount * multiplier)
    end

    if potentialOutput.Percent == 1.0 then
        AMOUNT.text = amountString
    else
        if potentialOutput.Percent > 0.01 then
            AMOUNT.text = string.format("%s (%.0f%%)", amountString, potentialOutput.Percent * 100)
        else
            AMOUNT.text = string.format("%s (%.2f%%)", amountString, potentialOutput.Percent * 100)
        end
    end
end