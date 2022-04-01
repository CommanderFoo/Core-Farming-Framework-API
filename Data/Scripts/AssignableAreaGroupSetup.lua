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
local AREAS_GROUP = COMPONENT_ROOT:GetCustomProperty("AreasGroup"):WaitForObject()
local AREAS_GROUP_KEY = COMPONENT_ROOT:GetCustomProperty("AreasGroupKey")
local MAX_PLAYERS_PER_AREA = COMPONENT_ROOT:GetCustomProperty("MaxPlayersPerArea")

if AREAS_GROUP == nil then
    AREAS_GROUP = COMPONENT_ROOT.parent
end

if AREAS_GROUP_KEY == nil or AREAS_GROUP_KEY == "" then
    warn("You need to set the 'AreasGroupKey' on " .. COMPONENT_ROOT.name)
    return
end

if MAX_PLAYERS_PER_AREA < 0 then
    MAX_PLAYERS_PER_AREA = 0
end

-- Required APIs
---@type APIAreas
local AREAS = require(script:GetCustomProperty("APIAreas"))

AREAS.RegisterAssignableAreaGroup(AREAS_GROUP.id, AREAS_GROUP_KEY, MAX_PLAYERS_PER_AREA)