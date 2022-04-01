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
local RESET_LOT_ON_UNLOAD = COMPONENT_ROOT:GetCustomProperty("ResetLotOnUnload")

-- Required APIs
---@type APIAreaLoaders
local AREA_LOADERS = require(script:GetCustomProperty("APIAreaLoaders"))
---@type APIAreas
local AREAS = require(script:GetCustomProperty("APIAreas"))
---@type APIPlayerLots
local PLAYER_LOTS = require(script:GetCustomProperty("APIPlayerLots"))

-- Allow lots and areas to register
Task.Wait()

--- Private Variables
local areaId = AREAS.FindAreaByAncestors(COMPONENT_ROOT)
local lotId = PLAYER_LOTS.FindLotByAncestors(COMPONENT_ROOT)

PLAYER_LOTS.SetLotActive(lotId, false)

local loadingProgress = 0

function LoadArea()
    loadingProgress = 0
    PLAYER_LOTS.SetLotActive(lotId, true)
    loadingProgress = 1
end

function UnloadArea()
    loadingProgress = 0
    if Environment.IsServer() then
        if RESET_LOT_ON_UNLOAD then
            PLAYER_LOTS.ResetLot(lotId)
        end
    end

    PLAYER_LOTS.SetLotActive(lotId, false)
    loadingProgress = 1
end

function GetState()
    local result = {}
    result.areaId = areaId
    result.progress = loadingProgress
    return result
end

local functionTable = {}
functionTable.LoadArea = LoadArea
functionTable.UnloadArea = UnloadArea
functionTable.GetState = GetState

AREA_LOADERS.RegisterAreaLoader(COMPONENT_ROOT.id, functionTable)

function OnPlayerAreaChanged(player, newAreaId, lastAreaId)
    if areaId == newAreaId then
        PLAYER_LOTS.SetLotActiveForPlayer(lotId, player, true)
    else
        PLAYER_LOTS.SetLotActiveForPlayer(lotId, player, false)
    end
end

if Environment.IsServer() then
    Events.Connect(AREAS.Events.PlayerAreaChanged, OnPlayerAreaChanged)
end