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

-- Internal Properties
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

-- User Exposed Properties
local ENABLED = COMPONENT_ROOT:GetCustomProperty("Enabled")
local RESET_DATA_BINDING = COMPONENT_ROOT:GetCustomProperty("ResetDataBinding")

-- Required APIs
local INVENTORY = require(script:GetCustomProperty("APIInventory")) ---@type APIInventory
local CURRENCY = require(script:GetCustomProperty("APICurrency")) ---@type APICurrency
local EQUIPMENT = require(script:GetCustomProperty("APIEquipment")) ---@type APIEquipment
local PLAYER_LOTS = require(script:GetCustomProperty("APIPlayerLots")) ---@type APIPlayerLots
local CRAFTING = require(script:GetCustomProperty("APICrafting")) ---@type APICrafting
local PURCHASING = require(script:GetCustomProperty("APIPurchasing")) ---@type APIPurchasing
local UPGRADES = require(script:GetCustomProperty("APIPlayerUpgrades")) ---@type APIPlayerUpgrades

-- Private Variables
local listeners = {}

function HandleBindingReleased(player, binding)
    if binding == RESET_DATA_BINDING then
        -- Reset Inventories
        INVENTORY.ClearAllInventories(player, true)

        -- Reset Currencies
        for currencyId, _ in pairs(CURRENCY.GetCurrencies()) do
            CURRENCY.SetCurrencyAmount(player, currencyId, CURRENCY.GetSetting(currencyId, CURRENCY.Setting.StartingAmount))
        end

        -- Destroy all Equipment
        EQUIPMENT.UnequipAll(player)

        -- Reset Player Lot
        local lotIds = PLAYER_LOTS.FindPlayerOwnedLots(player.id)
        for _, lotId in ipairs(lotIds) do
            PLAYER_LOTS.ClearPlayerLotSaveData(lotId)
            PLAYER_LOTS.ResetLot(lotId)
            PLAYER_LOTS.SetLotOwner(lotId, player.id)
        end

        -- Reset Crafting
        CRAFTING.ResetCrafting(player)

        -- Reset Stores
        for _, storeId in pairs(PURCHASING.GetStores()) do
            PURCHASING.ClearStoreSave(player, storeId)
        end

        -- Reset Upgrades
        UPGRADES.ResetUpgrades(player)
    end
end

function HandlePlayerJoined(player)
    listeners[player] = player.bindingReleasedEvent:Connect(HandleBindingReleased)
end

function HandlePlayerLeft(player)
    if listeners[player] then
        listeners[player]:Disconnect()
        listeners[player] = nil
    end
end

if ENABLED then
    Game.playerJoinedEvent:Connect(HandlePlayerJoined)
    Game.playerLeftEvent:Connect(HandlePlayerLeft)
end