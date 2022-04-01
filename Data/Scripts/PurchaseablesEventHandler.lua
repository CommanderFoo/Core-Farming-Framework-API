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
    This script listens for Purchase events and runs the appropriate commands on the Purchasing API or shows feedback.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

---@type APIPurchasing
local PURCHASING = require(script:GetCustomProperty("APIPurchasing"))
---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))

local PURCHASE_COMPLETE_EFFECTS_TEMPLATE = COMPONENT_ROOT:GetCustomProperty("PurchaseCompleteEffectsTemplate")
local PURCHASE_COMPLETE_EFFECTS_OFFSET = COMPONENT_ROOT:GetCustomProperty("PurchaseCompleteEffectsOffset")
local SALE_COMPLETE_EFFECTS_TEMPLATE = COMPONENT_ROOT:GetCustomProperty("SaleCompleteEffectsTemplate")
local SALE_COMPLETE_EFFECTS_OFFSET = COMPONENT_ROOT:GetCustomProperty("SaleCompleteEffectsOffset")
local SHOW_TRANSACTION_FLY_UP_TEXT = COMPONENT_ROOT:GetCustomProperty("ShowTransactionFlyUpText")
local TEXT_COLOR = COMPONENT_ROOT:GetCustomProperty("TextColor")
local TEXT_OFFSET = COMPONENT_ROOT:GetCustomProperty("TextOffset")
local TEXT_SECONDS = COMPONENT_ROOT:GetCustomProperty("TextSeconds")
local TEXT_IS_BIG = COMPONENT_ROOT:GetCustomProperty("TextIsBig")
local TEXT_FONT = COMPONENT_ROOT:GetCustomProperty("TextFont")

if TEXT_SECONDS < 0 then
    TEXT_SECONDS = 0
end

-- Constants
local PURCHASING_TAG = "PCH_"
local EVENT_PURCHASEABLE_CLICKED = PURCHASING_TAG .. "purchaseableClicked"
local EVENT_STORE_CATALOG_CLICKED = PURCHASING_TAG .. "storeCatalogClicked"
local EVENT_BUY_TAB_CLICKED = PURCHASING_TAG .. "buyTabClicked"
local EVENT_SELL_TAB_CLICKED = PURCHASING_TAG .. "sellTabClicked"

local UI_TAG = "UI_"
local EVENT_SHOW_SCREEN = UI_TAG .. "showScreen"

---Opens the Purchase Item Screen for a specific purchaseable.
---@param purchaseableData PurchaseableData
function HandleOpenPurchaseItemScreen(purchaseableData)
    local screenData = DATABASE.Screens["Purchase Item Screen"]
    if screenData then
        Events.Broadcast(EVENT_SHOW_SCREEN, "Purchase Item Screen", purchaseableData)
    else
        warn("No screen data for Purchase Item Screen found")
    end
end

---Opens the Store Screen for a set of Purchaseables or Sellables.
---@param purchaseableDatas PurchaseableData[]
---@param sellableDatas SellableData[]
---@param storeName string
---@param showBuyScreen boolean
---@param purchaseScreenId string
---@param sellScreenId string
function HandleOpenStoreScreen(purchaseableDatas, sellableDatas, storeName, showBuyScreen, purchaseScreenId, sellScreenId, storeId)
    local screenId
    if showBuyScreen then
        screenId = purchaseScreenId
    else
        screenId = sellScreenId
    end

    local screenData = DATABASE.Screens[screenId]
    if screenData then
        Events.Broadcast(EVENT_SHOW_SCREEN, screenId, purchaseableDatas, sellableDatas, storeName, showBuyScreen, purchaseScreenId, sellScreenId, storeId)
    else
        warn(string.format("No screen data for screen: %s found", screenId))
    end
end

function HandleSaleComplete(drops)
    if SALE_COMPLETE_EFFECTS_TEMPLATE and SALE_COMPLETE_EFFECTS_TEMPLATE ~= "" then
        local effect = World.SpawnAsset(SALE_COMPLETE_EFFECTS_TEMPLATE, { position = Game.GetLocalPlayer():GetWorldPosition() + SALE_COMPLETE_EFFECTS_OFFSET })

        -- Make sure these get cleaned up
        if effect.lifeSpan == 0 then
            effect.lifeSpan = 5
        end
    end

    if SHOW_TRANSACTION_FLY_UP_TEXT then
        Task.Spawn(function()
            ShowFlyupText(drops)
        end)
    end
end

function HandlePurchaseComplete(drops)
    if PURCHASE_COMPLETE_EFFECTS_TEMPLATE and PURCHASE_COMPLETE_EFFECTS_TEMPLATE ~= "" then
        local effect = World.SpawnAsset(PURCHASE_COMPLETE_EFFECTS_TEMPLATE, { position = Game.GetLocalPlayer():GetWorldPosition() + PURCHASE_COMPLETE_EFFECTS_OFFSET })

        -- Make sure these get cleaned up
        if effect.lifeSpan == 0 then
            effect.lifeSpan = 5
        end
    end

    if SHOW_TRANSACTION_FLY_UP_TEXT then
        Task.Spawn(function()
            ShowFlyupText(drops)
        end)
    end
end

function ShowFlyupText(drops)
    local playerPosition = Game.GetLocalPlayer():GetWorldPosition()

    for itemId, amount in pairs(drops.Items) do
        local itemData = DATABASE.Items[itemId]
        if itemData then
            UI.ShowFlyUpText(string.format("%s x%d", itemData.Name, amount), playerPosition + TEXT_OFFSET, { 
                color = TEXT_COLOR,
                duration = TEXT_SECONDS,
                isBig = TEXT_IS_BIG,
                font = TEXT_FONT
            })

            Task.Wait(0.2)
        end
    end

    for currencyId, amount in pairs(drops.Currencies) do
        local currencyData = DATABASE.Currencies[currencyId]
        if currencyData then
            UI.ShowFlyUpText(string.format("%s x%d", currencyData.Name, amount), playerPosition + TEXT_OFFSET, { 
                color = TEXT_COLOR,
                duration = TEXT_SECONDS,
                isBig = TEXT_IS_BIG,
                font = TEXT_FONT
            })

            Task.Wait(0.2)
        end
    end
end

if Environment.IsClient() then
    Events.Connect(EVENT_PURCHASEABLE_CLICKED, HandleOpenPurchaseItemScreen)
    Events.Connect(EVENT_STORE_CATALOG_CLICKED, HandleOpenStoreScreen)
    Events.Connect(EVENT_BUY_TAB_CLICKED, HandleOpenStoreScreen)
    Events.Connect(EVENT_SELL_TAB_CLICKED, HandleOpenStoreScreen)
    Events.Connect(PURCHASING.Events.SaleComplete, HandleSaleComplete)
    Events.Connect(PURCHASING.Events.PurchaseComplete, HandlePurchaseComplete)
end