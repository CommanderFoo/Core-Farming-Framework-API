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

---@class APIAreaLoaders
local API = {}

local loaders = {}

---Registers an AreaLoader.
---@param id string
---@param functionTable table
function API.RegisterAreaLoader(id, functionTable)
    loaders[id] = functionTable
end

---Loads a specific AreaLoader.
---@param id string
function API.LoadAreaLoader(id)
    Task.Spawn(function() loaders[id].LoadArea() end)
end

---Unloads a specific AreaLoader.
---@param id string
function API.UnloadAreaLoader(id)
    Task.Spawn(function() loaders[id].UnloadArea() end)
end

---Returns the state for a specific AreaLoader.
---@param id string
---@return table
function API.GetAreaLoaderState(id)
    return loaders[id].GetState()
end

---Returns all AreaLoaders associated with a specific Area.
---@param areaId string
---@return table
function API.GetLoadersForArea(areaId)
    local result = {}
    for id, loader in pairs(loaders) do
        if loader.GetState().areaId == areaId then
            table.insert(result, id)
        end
    end
    return result
end

return API