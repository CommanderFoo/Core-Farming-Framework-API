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
---@type CoreObject
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

-- User Exposed Properties
---@type CoreObject
local AREA = COMPONENT_ROOT:GetCustomProperty("Area"):WaitForObject()
local LOADERS_PER_FRAME = COMPONENT_ROOT:GetCustomProperty("LoadersPerFrame") or 0

if AREA == nil then
    AREA = COMPONENT_ROOT.parent
end

-- Required APIs
---@type APIAreas
local AREAS = require(script:GetCustomProperty("APIAreas"))
---@type APIAreaLoaders
local AREA_LOADERS = require(script:GetCustomProperty("APIAreaLoaders"))
---@type APIActiveCoreObjects
local ACTIVE = require(script:GetCustomProperty("APIActiveCoreObjects"))

-- Private Variables
local areaId = AREA.id
local areaName = AREA.name
local isLoaded = false
local isLoading = false
local isUnloading = false
local loadingProgress = 0
local assignKey = nil

function Tick()
    if isLoading or isUnloading then
        UpdateProgress()
    end

    local anyPlayers = #AREAS.GetPlayersInArea(areaId) > 0
    if isLoaded then
        if not anyPlayers then
            UnloadArea()
        end
    else
        if anyPlayers then
            LoadArea()
        end
    end
end

function UpdateProgress()
    local loaders = AREA_LOADERS.GetLoadersForArea(areaId)
    local totalProgress = #loaders
    local progress = 0

    for _, loaderId in ipairs(loaders) do
        progress = progress + AREA_LOADERS.GetAreaLoaderState(loaderId).progress
    end

    if progress == totalProgress then
        if isLoading then
            isLoading = false
            FinishedLoading()
        end
        if isUnloading then
            isUnloading = false
            FinishedUnloading()
        end

    end

    loadingProgress = progress / totalProgress
end

function FinishedLoading()
    Events.Broadcast(AREAS.Events.AreaFinishedLoading, areaId)
end

function FinishedUnloading()
    Events.Broadcast(AREAS.Events.AreaFinishedUnloading, areaId)
end

function LoadArea()
    isLoading = true
    isLoaded = true

    ACTIVE.SetActive(AREA, true)

    local loadedThisFrame = 0
    local loaders = AREA_LOADERS.GetLoadersForArea(areaId)
    for _, loaderId in ipairs(loaders) do
        AREA_LOADERS.LoadAreaLoader(loaderId)

        loadedThisFrame = loadedThisFrame + 1
        if LOADERS_PER_FRAME > 0 and loadedThisFrame >= LOADERS_PER_FRAME then
            loadedThisFrame = 0
            UpdateProgress()
            Task.Wait()
        end
    end

    loadingProgress = 1
end

function UnloadArea()
    isUnloading = true
    isLoaded = false
    assignKey = nil

    ACTIVE.SetActive(AREA, false)

    local loaders = AREA_LOADERS.GetLoadersForArea(areaId)
    for _, loaderId in ipairs(loaders) do
        AREA_LOADERS.UnloadAreaLoader(loaderId)
    end

    loadingProgress = 0
end

function GetState()
    local result = {}
    result.name = areaName
    result.coreObject = AREA
    result.loadingProgress = loadingProgress
    result.isLoaded = isLoaded and not isLoading
    result.isUnloaded = not isLoaded and not isUnloading
    result.isLoading = isLoading
    result.isUnloading = isUnloading
    result.isAssignable = AREAS.IsInAssignableAreaGroup(AREA)
    result.isAssigned = assignKey ~= nil
    result.assignKey = assignKey
    return result
end

function Assign(key)
    assignKey = key
end

local functionTable = {}
functionTable.GetState = GetState
functionTable.LoadArea = LoadArea
functionTable.UnloadArea = UnloadArea
functionTable.Assign = Assign

AREAS.RegisterArea(areaId, functionTable)
ACTIVE.SetActive(AREA, false)