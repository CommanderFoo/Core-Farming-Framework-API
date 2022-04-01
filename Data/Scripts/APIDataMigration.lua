--[[
Copyright 2022 Manticore Games, Inc.

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
    Allows the creator to define data changes between versions and migrates players from one version to another applying
    the changes to the player's save data.
--]]

-- Server only
if not Environment.IsServer() then return {} end

-- Required APIs
local DATABASE = require(script:GetCustomProperty("APIDatabase")) ---@type APIDatabase
local BitString = require(script:GetCustomProperty("BitString")) ---@type APIBitString

-- Set later to avoid circular dependencies
local INVENTORY = nil ---@type APIInventory
local CURRENCY = nil ---@type APICurrency

---@class APIDataMigration
local API = {}

-- Private variables
local versions = {}
local currentVersion = 0
local isLoaded = false

API.VERSION_KEY = "__v"

function API.SetInventoryAPI(inventoryAPI)
    INVENTORY = inventoryAPI
end

function API.SetCurrencyAPI(currencyAPI)
    CURRENCY = currencyAPI
end

function API.GetCurrentVersion()
    return currentVersion
end

---Migrates Inventory data between versions if needed.
---@param player Player
---@param playerData table
---@param inventoryId string
---@return boolean
function API.MigrateInventoryData(player, playerData, inventoryId)
    while not isLoaded do
        Task.Wait()
    end

    local success, result = pcall(function()
        local inventoryKey = INVENTORY.GetInventoryKey(inventoryId)
        local dataVersion = playerData[inventoryKey .. API.VERSION_KEY] or 0
        local didMigrate = false

        for version, migrationDatas in pairs(versions) do
            for _, migrationData in ipairs(migrationDatas) do
                if version > dataVersion then
                    didMigrate = ChangeInventoryItemId(playerData[inventoryKey], migrationData) or didMigrate
                    didMigrate = AddItem(inventoryId, playerData[inventoryKey], migrationData) or didMigrate
                    didMigrate = ClearInventory(inventoryId, playerData, migrationData) or didMigrate
                    didMigrate = ResetInventory(inventoryId, player, playerData, migrationData) or didMigrate
                end

                -- Changing Inventory Id can't use a version check since the new Inventory will be marked as the current version
                if ChangeInventoryId(inventoryId, playerData, migrationData) then
                    didMigrate = true
                end
            end
        end

        if didMigrate then
            playerData[inventoryKey .. API.VERSION_KEY] = currentVersion
            print(string.format("Migrated Inventory saved data to version: %d for Inventory ID: %s for Player: %s (%s)", currentVersion, inventoryId, player.name, player.id))
        end

        return didMigrate
    end)

    if not success then
        warn(string.format("Unable to migrate Inventory saved data to version: %d for Inventory ID: %s for Player: %s (%s) - %s", currentVersion, inventoryId, player.name, player.id, result))
    end

    return result
end

---Migrates Currency data between versions if needed.
---@param player Player
---@param playerData table
---@param currencyId string
---@return boolean
function API.MigrateCurrencyData(player, playerData, currencyId)
    while not isLoaded do
        Task.Wait()
    end

    local success, result = pcall(function()
        local currencyKey = CURRENCY.GetCurrencyKey(currencyId)
        local dataVersion = playerData[currencyKey .. API.VERSION_KEY] or 0
        local didMigrate = false

        for version, migrationDatas in pairs(versions) do
            for _, migrationData in ipairs(migrationDatas) do
                if version > dataVersion then
                    didMigrate = AddCurrency(currencyId, playerData[currencyKey], migrationData) or didMigrate
                end

                -- Changing Currency Id can't use a version check since the new Currency will be marked as the current version
                if ChangeCurrencyId(currencyId, playerData, migrationData) then
                    didMigrate = true
                end
            end
        end

        if didMigrate then
            playerData[currencyKey .. API.VERSION_KEY] = currentVersion
            print(string.format("Migrated Currency saved data to version: %d for Currency ID: %s for Player: %s (%s)", currentVersion, currencyId, player.name, player.id))
        end

        return didMigrate
    end)

    if not success then
        warn(string.format("Unable to migrate Currency saved data to version: %d for Currency ID: %s for Player: %s (%s) - %s", currentVersion, currencyId, player.name, player.id, result))
    end

    return result
end

---Migrates Placeable data between versions if needed.
---@param playerData table
---@param placeablesKey string
---@param userFunctions table
---@param userSettings table
---@return boolean
function API.MigratePlaceableData(playerData, placeablesKey, userFunctions, userSettings)
    while not isLoaded do
        Task.Wait()
    end

    local function EncodeInstance(instance)
        local writer = BitString.Writer.New()
        userFunctions.WriteInstance(userSettings, writer, instance)
        return writer:GetString()
    end

    local success, result = pcall(function()
        local buffer = playerData[placeablesKey] or ""
        local dataVersion = playerData[placeablesKey .. API.VERSION_KEY] or 0
        local didMigrate = false

        local instances = {}
        local reader = BitString.Reader.New(buffer)
        while reader:BitsAvailable() do
            local instance = userFunctions.ReadInstance(userSettings, reader)
            table.insert(instances, instance)
        end

        local instancesToRemove = {}
        for version, migrationDatas in pairs(versions) do
            for _, migrationData in ipairs(migrationDatas) do
                if version > dataVersion then
                    for _, instance in ipairs(instances) do
                        didMigrate = ChangePlaceableId(instance, migrationData) or didMigrate
                        if ShouldRemovePlaceableId(instance, migrationData) then
                            instancesToRemove[instance] = true
                            didMigrate = true
                        end
                    end
                end
            end
        end

        if didMigrate then
            local newBuffer = {}
            for _, instance in ipairs(instances) do
                if not instancesToRemove[instance] then
                    table.insert(newBuffer, EncodeInstance(instance))
                end
            end

            buffer = table.concat(newBuffer)

            playerData[placeablesKey] = buffer
            playerData[placeablesKey .. API.VERSION_KEY] = currentVersion

            print(string.format("Migrated Placeable saved data to version: %d for Placeables: %s", currentVersion, placeablesKey))
        end

        return didMigrate
    end)

    if not success then
        warn(string.format("Unable to migrate Placeable saved data to version: %d for Placeables: %s - %s", currentVersion, placeablesKey, result))
    end

    return result
end

function API.MigrateUpgradeData(player, playerData, upgradeId, addedUpgradesKey)
    while not isLoaded do
        Task.Wait()
    end

    local success, result = pcall(function()
        local upgradesString = playerData[addedUpgradesKey] or ""
        local upgrades = { CoreString.Split(upgradesString, "%", { removeEmptyResults = true }) }
        local dataVersion = playerData[addedUpgradesKey .. API.VERSION_KEY] or 0
        local didMigrate = false

        for version, migrationDatas in pairs(versions) do
            if version > dataVersion then
                for _, migrationData in ipairs(migrationDatas) do
                    didMigrate = ChangeUpgradeId(upgrades, upgradeId, migrationData) or didMigrate
                    didMigrate = GiveUpgradeId(upgrades, migrationData) or didMigrate
                    didMigrate = RemoveUpgradeId(upgrades, upgradeId, migrationData) or didMigrate
                end
            end
        end

        if didMigrate then
            playerData[addedUpgradesKey] = table.concat(upgrades, "%")
            playerData[addedUpgradesKey .. API.VERSION_KEY] = currentVersion
            print(string.format("Migrated Upgrade saved data to version: %d for Upgrade ID: %s for Player: %s (%s)", currentVersion, upgradeId, player.name, player.id))
        end

        return didMigrate
    end)

    if not success then
        warn(string.format("Unable to migrate Upgrade saved data to version: %d for Upgrade ID: %s for Player: %s (%s) - %s", currentVersion, upgradeId, player.name, player.id, result))
    end

    return result
end

function ChangeInventoryItemId(inventoryData, migrationData)
    local didMigrate = false
    if migrationData.OldItemId and migrationData.OldItemId ~= "" and migrationData.NewItemId and migrationData.NewItemId ~= "" then
        for _, slotContent in pairs(inventoryData) do
            if slotContent[INVENTORY.Keys.ItemId] == migrationData.OldItemId then
                slotContent[INVENTORY.Keys.ItemId] = migrationData.NewItemId
                didMigrate = true
            end
        end
    end
    return didMigrate
end

function AddItem(inventoryId, inventoryData, migrationData)
    local didMigrate = false
    if migrationData.AddItemInventoryId == inventoryId and migrationData.AddItemId ~= nil and migrationData.AddItemId ~= "" and migrationData.AddItemAmount ~= nil and migrationData.AddItemAmount > 0 then
        local totalSlots = INVENTORY.GetSetting(inventoryId, INVENTORY.Setting.TotalSlots)
        local slotIndex = migrationData.AddItemSlotIndex

        if not slotIndex or slotIndex < 0 or slotIndex >= totalSlots then slotIndex = 0 end

        if slotIndex > 0 and inventoryData[slotIndex] and inventoryData[slotIndex][INVENTORY.Keys.ItemId] == nil then
            inventoryData[slotIndex][INVENTORY.Keys.ItemType] = INVENTORY.GetItemType(migrationData.AddItemId)
            inventoryData[slotIndex][INVENTORY.Keys.ItemId] = migrationData.AddItemId
            inventoryData[slotIndex][INVENTORY.Keys.Amount] = migrationData.AddItemAmount
            didMigrate = true
        elseif slotIndex > 0 and not inventoryData[slotIndex] then
            inventoryData[slotIndex] = {
                [INVENTORY.Keys.ItemType] = INVENTORY.GetItemType(migrationData.AddItemId),
                [INVENTORY.Keys.ItemId] = migrationData.AddItemId,
                [INVENTORY.Keys.Amount] = migrationData.AddItemAmount
            }
            didMigrate = true
        else
            local added = false
            for slotIndex = 1, totalSlots, 1 do
                if not inventoryData[slotIndex] then
                    inventoryData[slotIndex] = {
                        [INVENTORY.Keys.ItemType] = INVENTORY.GetItemType(migrationData.AddItemId),
                        [INVENTORY.Keys.ItemId] = migrationData.AddItemId,
                        [INVENTORY.Keys.Amount] = migrationData.AddItemAmount
                    }
                    didMigrate = true
                    added = true
                    break
                elseif inventoryData[slotIndex][INVENTORY.Keys.ItemId] == migrationData.AddItemId then
                    inventoryData[slotIndex][INVENTORY.Keys.Amount] = inventoryData[slotIndex][INVENTORY.Keys.Amount] + migrationData.AddItemAmount
                    didMigrate = true
                    added = true
                    break
                end
            end

            if not added then
                warn(string.format("Could not add Item: %s to Inventory ID: %s", migrationData.AddItemId, inventoryId))
            end
        end
    end
    return didMigrate
end

function ClearInventory(inventoryId, playerData, migrationData)
    if migrationData.ClearInventoryId == inventoryId then
        local inventoryKey = INVENTORY.GetInventoryKey(inventoryId)
        playerData[inventoryKey] = {}
        return true
    end
    return false
end

function ResetInventory(inventoryId, player, playerData, migrationData)
    if migrationData.ResetInventoryId == inventoryId then
        local inventoryKey = INVENTORY.GetInventoryKey(inventoryId)
        playerData[inventoryKey] = INVENTORY.CreateInventoryData(player, inventoryId)
        return true
    end
    return false
end

function ChangeInventoryId(inventoryId, playerData, migrationData)
    if migrationData.OldInventoryId and migrationData.OldInventoryId ~= "" and migrationData.NewInventoryId == inventoryId then
        local oldInventoryKey = INVENTORY.GetInventoryKey(migrationData.OldInventoryId)
        if playerData[oldInventoryKey] then
            local newInventoryKey = INVENTORY.GetInventoryKey(inventoryId)
            playerData[newInventoryKey] = playerData[oldInventoryKey]
            playerData[oldInventoryKey] = nil
            playerData[oldInventoryKey .. API.VERSION_KEY] = nil
            return true
        end
    end
    return false
end

function ChangeCurrencyId(currencyId, playerData, migrationData)
    if migrationData.OldCurrencyId and migrationData.OldCurrencyId ~= "" and migrationData.NewCurrencyId == currencyId then
        local oldCurrencyKey = CURRENCY.GetCurrencyKey(migrationData.OldCurrencyId)
        if playerData[oldCurrencyKey] then
            local newCurrencyKey = CURRENCY.GetCurrencyKey(currencyId)
            playerData[newCurrencyKey] = playerData[oldCurrencyKey]
            playerData[oldCurrencyKey] = nil
            playerData[oldCurrencyKey .. API.VERSION_KEY] = nil
            return true
        end
    end
    return false
end

function AddCurrency(currencyId, currencyData, migrationData)
    if currencyId == migrationData.AddCurrencyId and migrationData.AddCurrencyAmount and migrationData.AddCurrencyAmount > 0 and currencyData then
        local maxAmount = CURRENCY.GetSetting(currencyId, CURRENCY.Setting.MaxAmount)
        local amountAdded = migrationData.AddCurrencyAmount

        if maxAmount > 0 and currencyData + migrationData.AddCurrencyAmount > maxAmount then
            amountAdded = math.min(currencyData + migrationData.AddCurrencyAmount, maxAmount)
        end

        currencyData = currencyData + amountAdded
        return true
    end
    return false
end

function ChangePlaceableId(instance, migrationData)
    if migrationData.OldPlaceableId and migrationData.OldPlaceableId ~= "" and migrationData.NewPlaceableId and migrationData.NewPlaceableId ~= "" then
        if instance.placeableId == migrationData.OldPlaceableId then
            instance.placeableId = migrationData.NewPlaceableId
            return true
        end
    end
    return false
end

function ShouldRemovePlaceableId(instance, migrationData)
    return migrationData.RemovePlaceableId == instance.placeableId
end

function ChangeUpgradeId(upgrades, upgradeId, migrationData)
    local didMigrate = false
    if migrationData.NewUpgradeId == upgradeId and migrationData.OldUpgradeId and migrationData.OldUpgradeId ~= "" then
        for index, id in ipairs(upgrades) do
            if id == migrationData.OldUpgradeId then
                upgrades[index] = migrationData.NewUpgradeId
                didMigrate = true
            end
        end
    end
    return didMigrate
end

function GiveUpgradeId(upgrades, migrationData)
    if migrationData.GiveUpgradeId and migrationData.GiveUpgradeId ~= "" then
        for _, id in ipairs(upgrades) do
            if id == migrationData.GiveUpgradeId then
                -- Already has upgrade
                return false
            end
        end
        table.insert(upgrades, migrationData.GiveUpgradeId)
        return true
    end
    return false
end

function RemoveUpgradeId(upgrades, upgradeId, migrationData)
    local didMigrate = false
    if migrationData.RemoveUpgradeId == upgradeId then
        for i = #upgrades, 0, -1 do
            if upgrades[i] == migrationData.RemoveUpgradeId then
                table.remove(upgrades, i)
                didMigrate = true
            end
        end
    end
    return didMigrate
end

Task.Spawn(function()
    -- Wait for Database
    Task.Wait()

    if DATABASE.DataMigrations then
        -- Validate and sort the versions and migration steps
        for _, migrationData in ipairs(DATABASE.DataMigrations) do
            local migrationVersion = tonumber(migrationData.Version)
            if migrationVersion and type(migrationVersion) == "number" and migrationVersion > 0 then
                if not versions[migrationVersion] then
                    versions[migrationVersion] = {}
                end

                table.insert(versions[migrationVersion], migrationData)

                if migrationVersion > currentVersion then
                    currentVersion = migrationVersion
                end
            end
        end
    end

    isLoaded = true
end)

return API