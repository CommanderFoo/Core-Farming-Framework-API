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
    This script is a central API for all things related to purchasing and selling items. This API exists on both the
    client and server.
--]]

local DATABASE = require(script:GetCustomProperty("APIDatabase")) ---@type APIDatabase
local INVENTORY = require(script:GetCustomProperty("APIInventory")) ---@type APIInventory
local CURRENCY = require(script:GetCustomProperty("APICurrency")) ---@type APICurrency
local DROPS = require(script:GetCustomProperty("APIDrops")) ---@type APIDrops
local ITEM_PICKUPS = require(script:GetCustomProperty("APIItemPickups")) ---@type APIItemPickups
local UPGRADES = require(script:GetCustomProperty("APIPlayerUpgrades")) ---@type APIPlayerUpgrades

-- Constants
local PURCHASING_TAG = "PCH_"
local VERSION_TAG = "_V"
local PURCHASING_DATA_VERSION = 1
local GLOBAL_STORE_ID = "__GlobalStore"

-- Private Variables
local stores = {}
local pendingPerkPurchaseableData = {}
local storeStorageKeys = {}

---@class APIPurchasing
local API = {}

API.Events = {
    LoadPurchases = PURCHASING_TAG .. "Load",
    StoreRegistered = PURCHASING_TAG .. "Registered",
    PurchaseComplete = PURCHASING_TAG .. "PurchaseComplete",
    Purchased = PURCHASING_TAG .. "Purchased",
    SaleComplete = PURCHASING_TAG .. "SaleComplete"
}

---@class PurchaseableData
---@field Name string
---@field Description string
---@field Tags string
---@field PerkReference NetReference
---@field GlobalPurchaseLimit integer
---@field IconCameraId string
---@field IconAsset string
---@field Is3DIcon boolean
---@field IsKitbashed2DIcon boolean
---@field IsImageIcon boolean
---@field DropInWorld boolean
---@field DropBehaviorId string|nil -- Overrides all below properties by referencing them as a Drop Behavior Data
---@field DropForAllPlayers boolean|nil
---@field SinglePlayerDrops boolean|nil
---@field MaxPickupsPerDrop integer|nil
---@field DropMinDistance number|nil
---@field DropMaxDistance number|nil
---@field DropTimeoutSeconds number|nil
---@field DropItemPickupTemplate string|nil

---@class SellableData
---@field Name string
---@field Description string
---@field Tags string
---@field IconCameraId string
---@field IconAsset string
---@field Is3DIcon boolean
---@field IsKitbashed2DIcon boolean
---@field IsImageIcon boolean
---@field DropInWorld boolean
---@field DropBehaviorId string|nil -- Overrides all below properties by referencing them as a Drop Behavior Data
---@field DropForAllPlayers boolean|nil
---@field SinglePlayerDrops boolean|nil
---@field MaxPickupsPerDrop integer|nil
---@field DropMinDistance number|nil
---@field DropMaxDistance number|nil
---@field DropTimeoutSeconds number|nil
---@field DropItemPickupTemplate string|nil

---Sets up the required listeners and loads all purchase history when a Player joins.
---@param player Player
function OnPlayerJoined(player)
    player.perkChangedEvent:Connect(HandlePerkChangedEvent)

    if Environment.IsClient() then
        if player ~= Game.GetLocalPlayer() then return end
        Events.BroadcastToServer(API.Events.LoadPurchases)

        player.privateNetworkedDataChangedEvent:Connect(HandlePrivateNetworkedDataChanged)

        -- Process any existing keys
        local keys = player:GetPrivateNetworkedDataKeys()
        for _, key in ipairs(keys) do
            HandlePrivateNetworkedDataChanged(player, key)
        end
    end
end

---Server Only. Registers and loads a Store's purchase history.
---@param storeId string
---@param storageKey string|nil
function API.RegisterStore(storeId, storageKey)
    if not storeId then
        warn("RegisterStore can not be called with a nil Inventory Id")
        return
    end

    if not Environment.IsServer() then
        warn("RegisterStore can only be called on the server")
        return
    end

    if API.IsStoreRegistered(storeId) then
        return
    end

    stores[storeId] = {}
    storeStorageKeys[storeId] = storageKey

    --print(string.format("Registered Store: %s (%s)", storeId, storageKey))

    Events.Broadcast(API.Events.StoreRegistered, storeId)

    -- Send information related to this Store to all Players
    for _, player in ipairs(Game.GetPlayers()) do
        LoadStoreSave(player, storeId)
    end
end

---Returns an array of all of the available store ids.
---@return table
function API.GetStores()
    local ids = {}
    for id, _ in pairs(stores) do
        ids[#ids+1] = id
    end

    ids[#ids+1] = GLOBAL_STORE_ID

    return ids
end

---Returns true if this key starts with the purchasing tag
---@param key string
---@return boolean
function API.IsPurchasingKey(key)
    return string.sub(key, 1, #PURCHASING_TAG) == PURCHASING_TAG
end

---Parses the Store Id from a purchasing key
---@param key string
---@return string
function API.GetStoreIdFromKey(key)
    return string.sub(key, #PURCHASING_TAG + 1)
end

---Returns true if the Store has been registered.
---@param storeId string
---@return boolean
function API.IsStoreRegistered(storeId)
    return stores[storeId] ~= nil
end

---Returns true if the Store has been loaded for a specific Player.
---@param player Player
---@param storeId string
---@return boolean
function API.IsStoreLoaded(player, storeId)
    if not API.IsStoreRegistered(storeId) then return false end
    return stores[storeId][player] ~= nil
end

---Clears the save data for a player that's associated with a particular store.
---@param player Player
---@param storeId string
function API.ClearStoreSave(player, storeId)
    if stores[storeId] then
        stores[storeId][player] = {}
        SaveStore(player, storeId)
        SyncStoreWithClient(player, storeId)
    end
end

---Loads all purchase history for a player.
---@param player Player
function HandleLoadPurchases(player)
    if not Environment.IsServer() then return false end

    for storeId, _ in pairs(stores) do
        LoadStoreSave(player, storeId)
    end
end

---Server Only. Loads the Store for a player and sends an update to their client.
---@param player Player
---@return boolean
function LoadStoreSave(player, storeId)
    if not Environment.IsServer() then return false end

    -- print(string.format("Loading save data for Store %s for Player: %s (%s)", storeId, player.name, player.id))

    local playerData

    local storageKey = storeStorageKeys[storeId]

    if storageKey and storageKey.isAssigned then
        playerData = Storage.GetSharedPlayerData(storageKey, player)
        if not playerData[storeId] then
            playerData[storeId] = {}
            playerData[storeId .. VERSION_TAG] = PURCHASING_DATA_VERSION
            Storage.SetSharedPlayerData(storageKey, player, playerData)
        end
    else
        playerData = Storage.GetPlayerData(player)
        if not playerData[storeId] then
            playerData[storeId] = {}
            playerData[storeId .. VERSION_TAG] = PURCHASING_DATA_VERSION
            Storage.SetPlayerData(player, playerData)
        end
    end

    stores[storeId][player] = playerData[storeId]

    SyncStoreWithClient(player, storeId)

    return true
end

---Server Only. Saves purchase history into Storage for a Player. Uses Local or Shared Storage depending on the
---Inventory settings.
---@param player Player
---@param storeId string
---@return boolean
function SaveStore(player, storeId)
    if not Environment.IsServer() then return false end

    -- print(string.format("Saving data for Store: %s for Player: %s (%s)", storeId, player.name, player.id))

    local storageKey = storeStorageKeys[storeId]

    if storageKey and storageKey.isAssigned then
        local playerData = Storage.GetSharedPlayerData(storageKey, player)
        playerData[storeId] = stores[storeId][player]
        playerData[storeId .. VERSION_TAG] = PURCHASING_DATA_VERSION

        local result = Storage.SetSharedPlayerData(storageKey, player, playerData)
        if result ~= StorageResultCode.SUCCESS then
            Warning(storeId, string.format("Could not save data for Store: %s for Player: %s (%s) - Result: %s", storeId, player.name, player.id, result))
            return false
        end
    else
        local playerData = Storage.GetPlayerData(player)
        playerData[storeId] = stores[storeId][player]
        playerData[storeId .. VERSION_TAG] = PURCHASING_DATA_VERSION

        local result = Storage.SetPlayerData(player, playerData)
        if result ~= StorageResultCode.SUCCESS then
            Warning(storeId, string.format("Could not save data for Store: %s for Player: %s (%s) - Result: %s", storeId, player.name, player.id, result))
            return false
        end
    end

    return true
end

---Submits the store data to the player through private networking data
---@param player Player
---@param storeId string
function SyncStoreWithClient(player, storeId)
    -- TODO more robust data queueing and processing
    local storeSaveData = stores[storeId][player]
    local result = player:SetPrivateNetworkedData(PURCHASING_TAG .. storeId, storeSaveData)
    if result ~= PrivateNetworkedDataResultCode.SUCCESS then
        warn(string.format("Could not send Store: %s data to client for Player: %s (%s) - Result: %s", storeId, player.name, player.id, result))
    end
end

---Called whenever client private networked data is changed. This syncs Store save data between the server and client.
---@param player Player
---@param key string
function HandlePrivateNetworkedDataChanged(player, key)
    if API.IsPurchasingKey(key) then
        local storeId = API.GetStoreIdFromKey(key)
        local storeSaveData = player:GetPrivateNetworkedData(key)

        -- TODO support actions

        if not stores[storeId] then
            stores[storeId] = {}
        end

        stores[storeId][player] = storeSaveData
        --print(string.format("Client updated Store data: %s for %s (%s)", storeId, player.name, player.id))
    end
end

---Returns true if the Player can afford an amount of this purchaseable.
---@param player Player
---@param purchaseableData PurchaseableData
---@param amount integer
---@return boolean
function API.CanAfford(player, purchaseableData, amount)
    if not purchaseableData then
        return false
    end

    -- Perks are always affordable if they are repeatable
    if API.IsPerkPurchase(purchaseableData) and not player:HasPerk(purchaseableData.PerkReference) then
        return true
    end

    if not HasInputs(player, purchaseableData.Inputs, amount) then
        return false
    end

    return true
end

---Determines how much of a purchaseable is available for purchase. This takes into account global purchase limits.
---Returns nil if purchases are unlimited.
---@param player Player
---@param purchaseableData PurchaseableData
---@param storeId string|nil
---@return integer|nil
function API.GetAvailableAmount(player, purchaseableData, storeId)
    local amount = purchaseableData.GlobalPurchaseLimit
    if not amount or amount <= 0 then
        return nil
    end

    for id,storeSaveData in pairs(stores) do
        if id == storeId then
            -- TODO Apply store specific limits once we have per-store limit data
        end

        if storeSaveData[player] then
            local purchases = storeSaveData[player].Purchases
            if purchases then
                local entry = purchases[purchaseableData.__Id]
                if entry then
                    amount = amount - entry.Amount
                end
            end
        end
    end

    if amount < 0 then
        amount = 0
    end

    return amount
end

---Returns true if this Purchaseable Data is associated with a Perk.
---@param purchaseableData PurchaseableData
---@return boolean
function API.IsPerkPurchase(purchaseableData)
    return purchaseableData.PerkReference and purchaseableData.PerkReference.isAssigned and purchaseableData.PerkReference.referenceType == NetReferenceType.CREATOR_PERK
end

---Completes a purchase for a Player.
---@param player Player
---@param purchaseableData PurchaseableData
---@param amount integer
---@return boolean
---@return string
function API.Purchase(player, purchaseableData, amount, storeId)
    local errorMessage
    if API.IsPerkPurchase(purchaseableData) then
        errorMessage = "This Purchaseable must be purchased through the Perk System"
        warn(errorMessage)
        return false, errorMessage
    end

    if not API.CanAfford(player, purchaseableData, amount) then
        errorMessage ="Cannot afford this purchase"
        warn(errorMessage)
        return false, errorMessage
    end

    -- Attempt to add the Drops
    local addedDrops = false
    addedDrops, errorMessage = AddDrops(player, purchaseableData, amount)
    if not addedDrops then
        warn(errorMessage)
        return false, errorMessage
    end

    -- Remove the costs
    RemoveInputs(player, purchaseableData.Inputs, amount)
    HandleCompletingPurchase(player, storeId, purchaseableData.__Id, amount)

    -- Send event on client
    -- TODO: Have server send drops to client via Private Networked Data and send event from there
    if Environment.IsClient() then
        Events.Broadcast(API.Events.PurchaseComplete, addedDrops)
        Events.BroadcastToServer(API.Events.Purchased, storeId, purchaseableData.__Id, amount)
    end

    return true
end

---Sets a pending Perk purchase. This is needed due to the Perk Window being separate from the Purchase UI.
---@param player Player
---@param purchaseableData PurchaseableData
function API.SetPendingPerkPurchase(player, purchaseableData)
    pendingPerkPurchaseableData[player] = purchaseableData
end

---Returns true if the Player has the required amount of materials to sell an amount of a sellable.
---@param player Player
---@param sellableData SellableData
---@param amount integer
---@return boolean
function API.CanSell(player, sellableData, amount)
    if not sellableData then
        return false
    end

    if not HasInputs(player, sellableData.Inputs, amount) then
        return false
    end

    return true
end

---Completes a sale for a Player.
---@param player Player
---@param sellableData SellableData
---@param amount integer
---@return boolean
---@return string
function API.Sell(player, sellableData, amount)
    local errorMessage

    if not HasInputs(player, sellableData.Inputs, amount, false) then
        errorMessage = "Not enough items in Inventory to sell"
        warn(errorMessage)
        return false, errorMessage
    end

    -- Attempt to add the Drops
    local addedDrops = false
    addedDrops, errorMessage = AddDrops(player, sellableData, amount)
    if not addedDrops then
        warn(errorMessage)
        return false, errorMessage
    end

    -- Remove items
    RemoveInputs(player, sellableData.Inputs, amount)

    -- Send event on client
    -- TODO: Have server send drops to client via Private Networked Data and send event from there
    if Environment.IsClient() then
        Events.Broadcast(API.Events.SaleComplete, addedDrops)
    end

    return true
end

---Returns the maximum amount of a Sellable that a player is currently able to sell.
---@param player Player
---@param sellableData SellableData
---@return integer
function API.GetSellLimit(player, sellableData)
    local maxSellable

    for _, inputData in pairs(sellableData.Inputs) do
        if type(inputData) == "table" then
            local sellAmount
            if inputData.ItemId and inputData.ItemId ~= "" then
                sellAmount = math.floor(INVENTORY.GetAmountInInventory(player, nil, INVENTORY.ItemType.Item, inputData.ItemId) / inputData.Amount)
            elseif inputData.CurrencyId and inputData.CurrencyId ~= "" then
                sellAmount = math.floor(CURRENCY.GetCurrencyAmount(player, inputData.CurrencyId) / inputData.Amount)
            end

            if sellAmount and (not maxSellable or sellAmount < maxSellable) then
                maxSellable = sellAmount
            end
        end
    end

    return maxSellable or 0
end

function HasRequirements(player, requirementDatas)
    if requirementDatas then
        for _, requirementData in pairs(requirementDatas) do
            if requirementData.UpgradeId and requirementData.UpgradeId ~= "" then
                if not UPGRADES.HasUpgrade(player.id, requirementData.UpgradeId) then
                    return false
                end
            elseif requirementData.ItemId and requirementData.ItemId ~= "" then
                if not INVENTORY.HasAmountInInventory(player, nil, INVENTORY.ItemType.Item, requirementData.ItemId, requirementData.Amount) then
                    return false
                end
            elseif requirementData.CurrencyId and requirementData.CurrencyId ~= "" then
                if CURRENCY.GetCurrencyAmount(player, requirementData.CurrencyId) < requirementData.Amount then
                    return false
                end
            elseif requirementData.ResourceName and requirementData.ResourceName ~= "" then
                if player:GetResource(requirementData.ResourceName) < requirementData.Amount then
                    return false
                end
            end
        end
    end

    return true
end


---Returns true if the Player has an amount of the supplied input datas.
---@param player Player
---@param inputDatas table
---@param amount integer
---@return boolean
function HasInputs(player, inputDatas, amount)
    if inputDatas then
        for _, inputData in pairs(inputDatas) do
            if type(inputData) == "table" then
                if inputData.ItemId and inputData.ItemId ~= "" then
                    if not INVENTORY.HasAmountInInventory(player, nil, INVENTORY.ItemType.Item, inputData.ItemId, inputData.Amount * amount) then
                        return false
                    end
                elseif inputData.CurrencyId and inputData.CurrencyId ~= "" then
                    if CURRENCY.GetCurrencyAmount(player, inputData.CurrencyId) < inputData.Amount * amount then
                        return false
                    end
                end
            end
        end
    end

    return true
end

---Removes an amount of Input Datas from a Player.
---@param player Player
---@param inputDatas table
---@param amount integer
function RemoveInputs(player, inputDatas, amount)
    if inputDatas then
        for _, inputData in pairs(inputDatas) do
            if type(inputData) == "table" then
                if inputData.ItemId and inputData.ItemId ~= "" then
                    INVENTORY.RemoveFromInventory(player, nil, INVENTORY.ItemType.Item, inputData.ItemId, inputData.Amount * amount)
                elseif inputData.CurrencyId and inputData.CurrencyId ~= "" then
                    CURRENCY.RemoveCurrencyAmount(player, inputData.CurrencyId, inputData.Amount * amount)
                end
            end
        end
    end
end

---Calculates and adds drops to a Players Inventory and Currency amounts.
---@param player Player
---@param storeItemData table
---@param amount integer
---@return DropResults|nil
---@return string|nil
function AddDrops(player, storeItemData, amount)
    local errorMessage

    if not storeItemData.Drops then
        errorMessage = "Data does not contain any Drops data"
        return nil, errorMessage
    end

    local calculatedDrops = DROPS.CalculateDrops(storeItemData.Drops, amount)

    -- Ensure that the drops will fit
    if not INVENTORY.CanAddToInventoryFromDrops(player, nil, calculatedDrops, false) then
        errorMessage = "Not enough room in Inventory"
        return nil, errorMessage
    end

    if not CURRENCY.HasRoomForCurrencyFromDrops(player, calculatedDrops) then
        errorMessage = "Currency will not fit into maximum amount"
        return nil, errorMessage
    end

    -- Add the drops
    if storeItemData.DropInWorld then
        local dropBehaviorData
        if storeItemData.DropBehaviorId then
            if DATABASE.DropBehaviors then
                if DATABASE.DropBehaviors[storeItemData.DropBehaviorId] then
                    dropBehaviorData = DATABASE.DropBehaviors[storeItemData.DropBehaviorId]
                else
                    warn("Could not find the Drop Behavior Data in the Database for Store Data")
                end
            else
                warn("Could not find the DropBehaviors category in the Database for Store Data")
            end
        else
            dropBehaviorData = storeItemData
        end

        if dropBehaviorData then
            ITEM_PICKUPS.CreateItemPickupsForDrops(
                player,
                calculatedDrops,
                dropBehaviorData.DropItemPickupTemplate,
                player:GetWorldPosition(),
                dropBehaviorData.DropMinDistance,
                dropBehaviorData.DropMaxDistance,
                dropBehaviorData.DropForAllPlayers,
                dropBehaviorData.SinglePlayerDrops,
                dropBehaviorData.DropTimeoutSeconds,
                dropBehaviorData.MaxPickupsPerDrop
            )
        end
    else
        for itemId, dropAmount in pairs(calculatedDrops.Items) do
            INVENTORY.AddToInventory(player, nil, INVENTORY.ItemType.Item, itemId, dropAmount, 0, false)
        end

        for currencyId, dropAmount in pairs(calculatedDrops.Currencies) do
            CURRENCY.AddCurrencyAmount(player, currencyId, dropAmount)
        end
    end

    for upgradeId, _ in pairs(calculatedDrops.Upgrades) do
        UPGRADES.AddUpgrade(player, upgradeId)
    end

    return calculatedDrops
end

---Called when a purchase and the purchase history needs to be updated.
function HandleCompletingPurchase(player, storeId, purchaseableId, amountPurchased)
    storeId = storeId or GLOBAL_STORE_ID
    local storeData = stores[storeId] or {}
    local playerStoreData = storeData[player] or {}
    local purchases = playerStoreData.Purchases or {}
    local entry = purchases[purchaseableId] or {}
    local amount = entry.Amount or 0

    entry.Amount = amount + amountPurchased

    purchases[purchaseableId] = entry
    playerStoreData.Purchases = purchases
    storeData[player] = playerStoreData
    stores[storeId] = storeData

    if Environment.IsServer() then
        SaveStore(player, storeId)
        SyncStoreWithClient(player, storeId)
    end
end

---Called when Player Perk status changes. If that Perk is currently pending purchase for a Player we assume it has just
---been purchased.
---@param player Player
---@param perkReference NetReference
function HandlePerkChangedEvent(player, perkReference)
     if pendingPerkPurchaseableData[player] and perkReference == pendingPerkPurchaseableData[player].PerkReference then
        AddDrops(player, pendingPerkPurchaseableData[player])
        pendingPerkPurchaseableData[player] = nil
     end
end

---Returns a table of Input Datas.
---@param storeItemData PurchaseableData|SellableData
---@return table
function GetInputDatas(storeItemData)
    -- Support Data Tables and older approach
    local inputDatas = {}
    if storeItemData.InputItemId1 or storeItemData.InputCurrencyId1 then
        local inputs = {}
        local index = 1
        while true do
            local inputItemId = storeItemData["InputItemId" .. tostring(index)]
            local inputCurrencyId = storeItemData["InputCurrencyId" .. tostring(index)]
            local inputAmount = storeItemData["InputAmount" .. tostring(index)]
            if (inputItemId ~= "" or inputCurrencyId ~= "") and inputAmount > 0 then
                table.insert(inputs, {
                    ItemId = inputItemId,
                    CurrencyId = inputCurrencyId,
                    Amount = inputAmount
                })
                index = index + 1
            else
                break
            end
        end
        inputDatas = inputs
    else
        inputDatas = storeItemData.Inputs
    end

    return inputDatas
end

---Returns a table of Drop Datas.
---@param storeItemData PurchaseableData|SellableData
function GetDropDatas(storeItemData)
    -- Support Data Tables and older approach
    local drops = {}
    if storeItemData.DropIds then
        local dropIds = { CoreString.Split(storeItemData.DropIds, ",", { removeEmptyResults  = true }) }
        for _, dropId in ipairs(dropIds) do
            dropId = CoreString.Trim(dropId)
            local dropData = DATABASE.Drops[dropId]
            if dropData then
                table.insert(drops, dropData)
            end
        end
    else
        drops = storeItemData.Drops
    end
    return drops
end

---Formats data to ensure Data Tables work with older data format
function OnPurchaseablesDataChanged()
    if not DATABASE.Purchaseables or #DATABASE.Purchaseables == 0 then return end
    for _, purchaseableData in pairs(DATABASE.Purchaseables) do
        purchaseableData.Inputs = GetInputDatas(purchaseableData)
        purchaseableData.Drops = GetDropDatas(purchaseableData)
    end
end

function OnSellablesDataChanged()
    if not DATABASE.Sellables or #DATABASE.Sellables == 0 then return end
    for _, sellableData in pairs(DATABASE.Sellables) do
        sellableData.Inputs = GetInputDatas(sellableData)
        sellableData.Drops = GetDropDatas(sellableData)
    end
end

-- Handle client requests
if Environment.IsServer() then
    Events.ConnectForPlayer(API.Events.LoadPurchases, HandleLoadPurchases)
    Events.ConnectForPlayer(API.Events.Purchased, HandleCompletingPurchase)

    Task.Spawn(function()
        API.RegisterStore(GLOBAL_STORE_ID)

        while not DATABASE.Stores do
            Task.Wait()
        end

        for storeId, storeData in pairs(DATABASE.Stores) do
            if type(storeData) == "table" then
                API.RegisterStore(storeId, storeData.StorageKey)
            end
        end
    end)
end

Game.playerJoinedEvent:Connect(OnPlayerJoined)

OnPurchaseablesDataChanged()
OnSellablesDataChanged()

DATABASE.RegisterDataChangeHandler(OnPurchaseablesDataChanged, "Purchaseables")
DATABASE.RegisterDataChangeHandler(OnSellablesDataChanged, "Sellables")

return API