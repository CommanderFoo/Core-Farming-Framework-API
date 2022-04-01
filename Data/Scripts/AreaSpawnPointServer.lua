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
---@type CoreObject
local TARGET = script:GetCustomProperty("Target"):WaitForObject()

-- User Defined Properties
---@type CoreObject
local AREA = COMPONENT_ROOT:GetCustomProperty("Area"):WaitForObject()
---@type string
local SPAWN_POINT_KEY = COMPONENT_ROOT:GetCustomProperty("SpawnPointKey")

-- Required APIs
---@type APISpawnPoints
local SPAWN_POINTS = require(script:GetCustomProperty("APISpawnPoints"))
---@type APIAreas
local AREAS = require(script:GetCustomProperty("APIAreas"))

-- Private Variables
local areaId = nil

if Object.IsValid(AREA) then
    areaId = AREA.id
else
    -- Wait for Areas to register
    Task.Wait()

    local rootAreaId = AREAS.FindAreaByAncestors(COMPONENT_ROOT)
    if rootAreaId == nil then
        error(COMPONENT_ROOT.name .. " isn't inside an Area")
    end

    areaId = rootAreaId
end

function GetState()
    ---@class SpawnPointState
    local result = {}
    result.targetPosition = TARGET:GetWorldPosition()
    result.targetRotation = TARGET:GetWorldRotation()
    result.key = SPAWN_POINT_KEY
    result.id = areaId
    return result
end

local functionTable = {}
functionTable.GetState = GetState

SPAWN_POINTS.RegisterSpawnPoint(COMPONENT_ROOT.id, functionTable)

COMPONENT_ROOT.destroyEvent:Connect(function()
    SPAWN_POINTS.UnregisterSpawnPoint(COMPONENT_ROOT.id)
end)