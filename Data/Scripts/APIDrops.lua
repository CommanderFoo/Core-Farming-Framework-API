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
    This script handles drop calculations. Drop data is expected to be in the following format:

    Drops
    |___ Drop 1
    |   |___ ItemId (string)     \
    |   |___ CurrencyId (string)  > First one of these that is filled out is used
    |   |___ UpgradeId (string)  /
    |   |___ MinAmount (integer)
    |   |___ MaxAmount (integer)
    |   |___ WeightedChance (integer) - This will be used instead of PercentChance if it has a value greater than 0
    |   |___ PercentChance (float)
    |___ Drop 2
    |   |___ ItemId (string)     \
    |   |___ CurrencyId (string)  > First one of these that is filled out is used
    |   |___ UpgradeId (string)  /
    |   |___ MinAmount (integer)
    |   |___ MaxAmount (integer)
    |   |___ WeightedChance (integer) - This will be used instead of PercentChance if it has a value greater than 0
    |   |___ PercentChance (float)
    |___ etc...
--]]

---@class APIDrops
local API = {}

---Returns a table of Item and Currency ids and amounts if successfully rolled.
---@param drops table
---@param amount integer
---@param results DropResults|nil
---@param calculatePotential boolean
---@return DropResults
function API.CalculateDrops(drops, amount, results, calculatePotential)
    amount = amount or 1

    if calculatePotential == nil then
        calculatePotential = false
    end

    local percentDrops = {}
    local weightedDrops = {}

    ---@class DropResults
    results = results or {}
    results.Items = results.Items or {}
    results.Currencies = results.Currencies or {}
    results.Upgrades = results.Upgrades or {}

    ---Adds an Item, Currency or Upgrade drop to a DropResults table.
    ---@param dropData table
    ---@param dropResults DropResults
    ---@param getMaxAmount boolean
    local function AddDropToDropResults(dropData, dropResults, getMaxAmount)
        if dropData.ItemId ~= "" then
            if not dropResults.Items[dropData.ItemId] then
                dropResults.Items[dropData.ItemId] = 0
            end
            dropResults.Items[dropData.ItemId] = dropResults.Items[dropData.ItemId] + GetAmount(dropData, getMaxAmount)
        elseif dropData.CurrencyId ~= "" then
            if not dropResults.Currencies[dropData.CurrencyId] then
                dropResults.Currencies[dropData.CurrencyId] = 0
            end
            dropResults.Currencies[dropData.CurrencyId] = dropResults.Currencies[dropData.CurrencyId] + GetAmount(dropData, getMaxAmount)
        elseif dropData.UpgradeId ~= "" then
            if not dropResults.Upgrades[dropData.UpgradeId] then
                dropResults.Upgrades[dropData.UpgradeId] = 0
            end
            dropResults.Upgrades[dropData.UpgradeId] = dropResults.Upgrades[dropData.UpgradeId] + GetAmount(dropData, getMaxAmount)
        end
    end

    -- Split drops based on type
    for _, dropData in pairs(drops) do
        if type(dropData) == "table" then
            if dropData.ItemId ~= "" or dropData.CurrencyId ~= "" or dropData.UpgradeId ~= "" then
                local weightedChance = dropData.WeightedChance or 0
                if weightedChance > 0 then
                    table.insert(weightedDrops, dropData)
                else
                    table.insert(percentDrops, dropData)
                end
            end
        end
    end

    if calculatePotential then
        if #weightedDrops > 0 then
            for _, dropData in ipairs(weightedDrops) do
                AddDropToDropResults(dropData, results, true)
            end
        end

        if #percentDrops > 0 then
            for _, dropData in ipairs(percentDrops) do
                AddDropToDropResults(dropData, results, true)
            end
        end
    else
        -- Roll weighted drops
        if #weightedDrops > 0 then
            local totalWeight = 0
            for _, dropData in ipairs(weightedDrops) do
                totalWeight = totalWeight + dropData.WeightedChance
            end

            for i = 1, amount, 1 do
                local roll = math.random(1, totalWeight)
                local currentWeight = 0
                for _, dropData in ipairs(weightedDrops) do
                    currentWeight = currentWeight + dropData.WeightedChance
                    if currentWeight >= roll then
                        AddDropToDropResults(dropData, results, false)
                        break
                    end
                end
            end
        end

        -- Roll percent drops
        if #percentDrops > 0 then
            for _, dropData in ipairs(percentDrops) do
                local percentChance = CoreMath.Clamp(dropData.PercentChance or 0, 0, 100.0)
                for i = 1, amount, 1 do
                    local roll = math.random(0.0, 100.0)
                    if roll <= percentChance then
                        AddDropToDropResults(dropData, results, false)
                    end
                end
            end
        end
    end

    return results
end

---Returns a table containing Item ids and their percent chance of dropping.
---@param drops table
---@return PercentResults
function API.GetDropPercents(drops)
    ---@class PercentResults
    local percentResults = {
        Items = {},
        Currencies = {},
        Upgrades = {}
    }

    -- Get the total weight for use later
    local totalWeight = 0
    for _, dropData in pairs(drops) do
        if type(dropData) == "table" then
            if (dropData.ItemId ~= "" or dropData.CurrencyId ~= "" or dropData.UpgradeId ~= "") and dropData.WeightedChance and dropData.WeightedChance > 0 then
                totalWeight = totalWeight + dropData.WeightedChance
            end
        end
    end

    -- Collect all of the percent chances for each Item
    for _, dropData in pairs(drops) do
        if type(dropData) == "table" then
            if dropData.ItemId ~= "" or dropData.CurrencyId ~= "" or dropData.UpgradeId ~= "" then
                if dropData.ItemId ~= "" and not percentResults.Items[dropData.ItemId] then
                    percentResults.Items[dropData.ItemId] = {}
                elseif dropData.CurrencyId ~= "" and not percentResults.Currencies[dropData.CurrencyId] then
                    percentResults.Currencies[dropData.CurrencyId] = {}
                elseif dropData.UpgradeId ~= "" and not percentResults.Upgrades[dropData.UpgradeId] then
                    percentResults.Upgrades[dropData.UpgradeId] = {}
                end

                if dropData.WeightedChance and dropData.WeightedChance > 0 then
                    if dropData.ItemId ~= "" then
                        table.insert(percentResults.Items[dropData.ItemId], {
                            MinAmount = dropData.MinAmount,
                            MaxAmount = dropData.MaxAmount,
                            Percent = dropData.WeightedChance / totalWeight
                        })
                    elseif dropData.CurrencyId ~= "" then
                        table.insert(percentResults.Currencies[dropData.CurrencyId], {
                            MinAmount = dropData.MinAmount,
                            MaxAmount = dropData.MaxAmount,
                            Percent = dropData.WeightedChance / totalWeight
                        })
                    elseif dropData.UpgradeId ~= "" then
                        table.insert(percentResults.Upgrades[dropData.UpgradeId], {
                            MinAmount = dropData.MinAmount,
                            MaxAmount = dropData.MaxAmount,
                            Percent = dropData.WeightedChance / totalWeight
                        })
                    end
                else
                    if dropData.ItemId ~= "" then
                        table.insert(percentResults.Items[dropData.ItemId], {
                            MinAmount = dropData.MinAmount,
                            MaxAmount = dropData.MaxAmount,
                            Percent = (dropData.PercentChance or 0) / 100.0
                        })
                    elseif dropData.CurrencyId ~= "" then
                        table.insert(percentResults.Currencies[dropData.CurrencyId], {
                            MinAmount = dropData.MinAmount,
                            MaxAmount = dropData.MaxAmount,
                            Percent = (dropData.PercentChance or 0) / 100.0
                        })
                    elseif dropData.UpgradeId ~= "" then
                        table.insert(percentResults.Upgrades[dropData.UpgradeId], {
                            MinAmount = dropData.MinAmount,
                            MaxAmount = dropData.MaxAmount,
                            Percent = (dropData.PercentChance or 0) / 100.0
                        })
                    end
                end
            end
        end
    end

    -- Iterate over each item and calculate the actual chance of it dropping (Handles multiple drops with the same id)
    local results = {
        Items = {},
        Currencies = {},
        Upgrades = {}
    }

    for itemId, percentData in pairs(percentResults.Items) do
        local min, max, percent = GetActualValues(percentData)
        results.Items[itemId] = {
            MinAmount = min,
            MaxAmount = max,
            Percent = percent
        }
    end

    for currencyId, percentData in pairs(percentResults.Currencies) do
        local min, max, percent = GetActualValues(percentData)
        results.Currencies[currencyId] = {
            MinAmount = min,
            MaxAmount = max,
            Percent = percent
        }
    end

    for upgradeId, percentData in pairs(percentResults.Upgrades) do
        local min, max, percent = GetActualValues(percentData)
        results.Upgrades[upgradeId] = {
            MinAmount = min,
            MaxAmount = max,
            Percent = percent
        }
    end

    return results
end

function GetActualValues(percentData)
    local min = 0
    local max = 0
    local inversePercent

    for _, percentDataItem in ipairs(percentData) do
        min = min + percentDataItem.MinAmount
        max = max + percentDataItem.MaxAmount

        if inversePercent then
            inversePercent = inversePercent * (1.0 - percentDataItem.Percent)
        else
            inversePercent = (1.0 - percentDataItem.Percent)
        end
    end

    return min, max, 1.0 - inversePercent
end

---Returns a random amount between the minimum and maximum amounts (inclusive) on a drop data.
---@param dropData table
---@return integer
function GetAmount(dropData, getMaxAmount)
    local min = dropData.MinAmount or dropData.Amount or 1
    local max = dropData.MaxAmount or dropData.Amount or 1

    if getMaxAmount == nil then
        getMaxAmount = false
    end

    if min < 0 then
        min = 0
    end

    if max < min then
        max = min
    end

    if getMaxAmount then
        return max
    else
        return math.random(min, max)
    end
end

return API