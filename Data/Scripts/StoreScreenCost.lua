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
    A simple Cost Slot that displays an icon, name and required amount.
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
local costData
local totalAmount
local iconCameraId

function Initialize(data, amount, cameraId)
    inputData = data
    totalAmount = amount
    iconCameraId = cameraId

    if inputData.ItemId ~= "" then
        costData = DATABASE.Items[inputData.ItemId]
    elseif inputData.CurrencyId ~= "" then
        costData = DATABASE.Currencies[inputData.CurrencyId]
    end

    if not costData then
        warn("Could not find Item or Currency data")
        return
    end

    Setup()
end

function Setup()
    if costData.IsKitbashed2DIcon then
        ICON:SetImage(nil)
        ICON:SetColor(Color.New(0, 0, 0, 0))
        World.SpawnAsset(costData.IconAsset, { parent = ICON })
    elseif costData.Is3DIcon then
        ICON_MANAGER.SetIcon(ICON, iconCameraId, costData.IconAsset, CameraCaptureResolution.VERY_SMALL)
    elseif costData.IsImageIcon then
        ICON:SetImage(costData.IconAsset)
    else
        ICON.visibility = Visibility.FORCE_OFF
    end

    NAME.text = costData.Name

    if CanPurchase() then
        AMOUNT:SetColor(HAS_ENOUGH_COLOR)
    else
        AMOUNT:SetColor(NOT_ENOUGH_COLOR)
    end

    AMOUNT.text = string.format("%d / %d", GetPlayerAmount(), inputData.Amount * totalAmount)
end

function GetPlayerAmount()
    if inputData.ItemId ~= "" then
        return INVENTORY.GetAmountInInventory(LOCAL_PLAYER, nil, INVENTORY.ItemType.Item, inputData.ItemId)
    elseif inputData.CurrencyId ~= "" then
        return CURRENCY.GetCurrencyAmount(LOCAL_PLAYER, inputData.CurrencyId)
    end
    return 0
end

function CanPurchase()
    return GetPlayerAmount() >= inputData.Amount
end