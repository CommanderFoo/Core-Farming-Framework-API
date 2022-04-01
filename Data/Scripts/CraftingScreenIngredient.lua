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
    A simple Recipe Ingredient Slot that displays an ingredient icon, name and required amount.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

---@type APIIconManager
local ICON_MANAGER = require(script:GetCustomProperty("APIIconManager"))
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APIInventory
local INVENTORY = require(script:GetCustomProperty("APIInventory"))
---@type APICurrency
local CURRENCY = require(script:GetCustomProperty("APICurrency"))

local ICON = COMPONENT_ROOT:GetCustomProperty("Icon"):WaitForObject()
local NAME = COMPONENT_ROOT:GetCustomProperty("Name"):WaitForObject()
local AMOUNT = COMPONENT_ROOT:GetCustomProperty("Amount"):WaitForObject()
local HAS_ENOUGH_COLOR = COMPONENT_ROOT:GetCustomProperty("HasEnoughColor")
local NOT_ENOUGH_COLOR = COMPONENT_ROOT:GetCustomProperty("NotEnoughColor")

-- Constants
local LOCAL_PLAYER = Game.GetLocalPlayer()

-- Private Variables
local inputData
local ingredientData
local iconCameraId
local amount

function Initialize(data, cameraId, amt)
    inputData = data
    iconCameraId = cameraId
    amount = amt

    if inputData.ItemId ~= "" then
        ingredientData = DATABASE.Items[inputData.ItemId]
    elseif inputData.CurrencyId ~= "" then
        ingredientData = DATABASE.Currencies[inputData.CurrencyId]
    end

    if not ingredientData then
        warn("Could not find Item or Currency data")
        return
    end

    COMPONENT_ROOT.destroyEvent:Connect(Cleanup)

    Setup()
end

function Setup()
    ICON.visibility = Visibility.INHERIT
    if ingredientData.IsKitbashed2DIcon then
        ICON:SetImage(nil)
        ICON:SetColor(Color.New(0, 0, 0, 0))
        World.SpawnAsset(ingredientData.IconAsset, { parent = ICON })
    elseif ingredientData.Is3DIcon then
        ICON_MANAGER.SetIcon(ICON, iconCameraId, ingredientData.IconAsset, CameraCaptureResolution.VERY_SMALL)
    elseif ingredientData.IsImageIcon then
        ICON:SetImage(ingredientData.IconAsset)
    else
        ICON.visibility = Visibility.FORCE_OFF
    end

    NAME.text = ingredientData.Name

    SetAmountText()
end

function Cleanup()

end

function SetAmountText()
    if HasEnoughIngredients() then
        AMOUNT:SetColor(HAS_ENOUGH_COLOR)
    else
        AMOUNT:SetColor(NOT_ENOUGH_COLOR)
    end

    AMOUNT.text = string.format("%d / %d", math.min(GetPlayerAmount(), inputData.Amount * amount), inputData.Amount * amount)
end

function GetPlayerAmount()
    if inputData.ItemId ~= "" then
        return INVENTORY.GetAmountInInventory(LOCAL_PLAYER, nil, INVENTORY.ItemType.Item, inputData.ItemId)
    elseif inputData.CurrencyId ~= "" then
        return CURRENCY.GetCurrencyAmount(LOCAL_PLAYER, inputData.CurrencyId)
    end
    return 0
end

function UpdateAmount(amt)
    amount = amt
    SetAmountText()
end

function HasEnoughIngredients()
    return GetPlayerAmount() >= inputData.Amount * amount
end