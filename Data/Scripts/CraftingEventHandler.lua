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
    This script listens for Crafting events and runs the appropriate commands on the Crafting API.
--]]

local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()

---@type APICrafting
local CRAFTING = require(script:GetCustomProperty("APICrafting"))

---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))

-- Constants
local CRAFTING_TAG = "CFT_"
local EVENT_OPEN_CRAFTING_SCREEN = CRAFTING_TAG .. "openScreen"
local DEFAULT_SCREEN_ID = "Crafting Screen"

local UI_TAG = "UI_"
local EVENT_SHOW_SCREEN = UI_TAG .. "showScreen"

---Client Only. Opens the Crafting Screen for a specific crafting station.
---@param craftingStationId string
---@param craftingStationDataId string
function HandleOpenCraftingScreen(craftingStationId, craftingStationDataId)
    local screenId = DEFAULT_SCREEN_ID
    local craftingStationData = DATABASE.CraftingStations[craftingStationDataId]
    if craftingStationData and craftingStationData.OverrideScreenId and craftingStationData.OverrideScreenId ~= "" then
        screenId = craftingStationData.OverrideScreenId
    end

    local screenData = DATABASE.Screens[screenId]
    if screenData then
        Events.Broadcast(EVENT_SHOW_SCREEN, screenId, craftingStationId, craftingStationDataId)
    else
        warn(string.format("No screen data for Screen id: %s found", screenId))
    end
end

if Environment.IsClient() then
    Events.Connect(EVENT_OPEN_CRAFTING_SCREEN, HandleOpenCraftingScreen)
end