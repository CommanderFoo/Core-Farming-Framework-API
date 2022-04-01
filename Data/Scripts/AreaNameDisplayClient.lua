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
local NAME_TEXT = script:GetCustomProperty("NameText"):WaitForObject()

-- User Exposed Properties
local UNKNOWN_AREA_TEXT = COMPONENT_ROOT:GetCustomProperty("UnknownAreaText")

-- Required APIs
---@type APIAreas
local AREAS = require(script:GetCustomProperty("APIAreas"))

-- Wait for Areas to register
Task.Wait()

-- Private Variables
local areaId = AREAS.GetPlayerArea(Game.GetLocalPlayer())
local handlers

function UpdateAreaText(areaId)
    local areaState = AREAS.GetAreaState(areaId)
    if areaState then
        NAME_TEXT.text = areaState.name
    else
        NAME_TEXT.text = UNKNOWN_AREA_TEXT
    end
end

function OnPlayerAreaChanged(areaId)
    UpdateAreaText(areaId)
end

function OnDestroyed()
    for _, handler in ipairs(handlers) do
        handler:Disconnect()
    end
    handlers = {}
end

UpdateAreaText(areaId)

handlers = {
    Events.Connect(AREAS.Events.AreaFinishedLoading, OnPlayerAreaChanged)
}

script.destroyEvent:Connect(OnDestroyed)