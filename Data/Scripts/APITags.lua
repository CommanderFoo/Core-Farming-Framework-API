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
    This script provides a standard interface for working with tag properties on data.
--]]

---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))

---@class APITags
local API = {}

local TAGS = "Tags"

---Determines if there is at least one match between two sets of tags.
---@param tagsA table|string
---@param tagsB table|string
---@return boolean
function API.AnyMatch(tagsA, tagsB)
    if type(tagsA) == "string" then
        tagsA = API.SplitTagsString(tagsA)
    end

    if type(tagsB) == "string" then
        tagsB = API.SplitTagsString(tagsB)
    end

    for _, typeA in pairs(tagsA) do
        for _, typeB in pairs(tagsB) do
            if typeA == typeB then
                return true
            end
        end
    end

    return false
end

---Retrieves all data entries in a given data group from APIDatabase if their ids or tags match the provided tags.
---Returns a table of all the results indexed by data id by default.
---@param dataGroupName string
---@param tags table|string
---@param returnAsArray boolean
---@return table
function API.FindMatchingData(dataGroupName, tags, returnAsArray)
    local results = {}
    local array = {}

    if not tags then
        return results
    end

    local dataGroup = DATABASE[dataGroupName]
    if not dataGroup then
        return results
    end

    if type(tags) == "string" then
        tags = API.SplitTagsString(tags)
    end

    local index = 1
    for _, data in ipairs(DATABASE[dataGroupName]) do
        local dataId = data.__Id
        if API.AnyMatch(dataId, tags) or API.AnyMatch(data[TAGS], tags) then
            array[index] = data
            results[dataId] = data
            index = index + 1
        end
    end

    if returnAsArray == true then
        return array
    end

    return results
end

---Looks up the standardized Tags property on a data entry.
---@param dataGroupName string
---@param dataId string
---@return string
function API.GetTagsString(dataGroupName, dataId)
    local dataGroup = DATABASE[dataGroupName]
    if dataGroup then
        local dataEntry = dataGroup[dataId]
        if dataEntry then
            return dataEntry[TAGS]
        end
    end
end

---Splits a standardized tag string into an array of tags.
---@param tagsString string
---@return table
function API.SplitTagsString(tagsString)
    local results = {}

    if tagsString and CoreString.Trim(tagsString) ~= "" then
        results = { CoreString.Split(tagsString, ",") }
        for index, id in ipairs(results) do
            results[index] = CoreString.Trim(id)
        end
    end

    return results
end

return API