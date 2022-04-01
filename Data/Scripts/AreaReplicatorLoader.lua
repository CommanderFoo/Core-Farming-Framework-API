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
local AREA_REPLICATOR = COMPONENT_ROOT:GetCustomProperty("Replicator"):WaitForObject()

-- Required APIs
---@type APIAreaLoaders
local AREA_LOADERS = require(script:GetCustomProperty("APIAreaLoaders"))
---@type APIAreas
local AREAS = require(script:GetCustomProperty("APIAreas"))
---@type APIReplicator
local REPLICATOR = require(script:GetCustomProperty("APIReplicator"))

-- Allow areas to register
Task.Wait()

-- Private Variables
local areaId = AREAS.FindAreaByAncestors(COMPONENT_ROOT)

-- Exit early if this is not within an Area
if not areaId then
    error(string.format("%s needs to be within the hierarchy of an Area", COMPONENT_ROOT.name))
end

local replicatorId = REPLICATOR.FindReplicatorIdentifier(AREA_REPLICATOR)
local loadingProgress = 0
local isLoaded = false

function LoadArea()
    isLoaded = true
    loadingProgress = 0
    REPLICATOR.ActivateReplicator(replicatorId, true)
    loadingProgress = 1
end

function UnloadArea()
    isLoaded = false
    loadingProgress = 0
    REPLICATOR.DeactivateReplicator(replicatorId, true)
    loadingProgress = 1
end

function GetState()
    local result = {}
    result.areaId = areaId
    result.progress = loadingProgress
    return result
end

function OnPlayerAreaChanged(player, newAreaId, lastAreaId)
    if newAreaId == areaId then
        REPLICATOR.ActivateReplicatorForPlayer(replicatorId, player.id)
    else
        REPLICATOR.DeactivateReplicatorForPlayer(replicatorId, player.id)
    end
end

local functionTable = {}
functionTable.LoadArea = LoadArea
functionTable.UnloadArea = UnloadArea
functionTable.GetState = GetState

AREA_LOADERS.RegisterAreaLoader(COMPONENT_ROOT.id, functionTable)

-- Make sure replicator has finished loading itself, and the area loader has finished processing itself
Task.Wait()
Task.Wait()
Task.Wait()

if not isLoaded then
    REPLICATOR.DeactivateReplicator(replicatorId, true)
end

if Environment.IsServer() then
    Events.Connect(AREAS.Events.PlayerAreaChanged, OnPlayerAreaChanged)

    for _, player in ipairs(Game.GetPlayers()) do
        OnPlayerAreaChanged(player, AREAS.GetPlayerArea(player), nil)
    end
end