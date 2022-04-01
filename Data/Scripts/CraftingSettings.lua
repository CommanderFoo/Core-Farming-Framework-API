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
    This script allows Crafting setup and configuration in the hierarchy. The Crafting API will also use default settings
    for anything not configured here.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
local CRAFTING = require(script:GetCustomProperty("APICrafting")) ---@type APICrafting
local DATABASE = require(script:GetCustomProperty("APIDatabase")) ---@type APIDatabase

local ALLOW_GLOBAL_CRAFTING = COMPONENT_ROOT:GetCustomProperty("AllowGlobalCrafting")
local GLOBAL_CRAFTING_STATION_ID = COMPONENT_ROOT:GetCustomProperty("GlobalCraftingStationId")

Task.Spawn(function()
    while not DATABASE.CraftingStations do
        Task.Wait()
    end

    local settings = DATABASE.CraftingStations[GLOBAL_CRAFTING_STATION_ID]
    if not settings then
        warn("Unable to find global crafting settings for id: " .. GLOBAL_CRAFTING_STATION_ID)
    else
        CRAFTING.SetSettings({
            [CRAFTING.Setting.AllowGlobalCrafting] = ALLOW_GLOBAL_CRAFTING,
            [CRAFTING.Setting.StorageKey] = settings.StorageKey,
            [CRAFTING.Setting.ClearAbandonedStationTimeout] = settings.ClearAbandonedStationTimeout,
            [CRAFTING.Setting.GlobalAllowAllRecipes] = settings.AllowAllRecipes,
            [CRAFTING.Setting.GlobalRecipes] = settings.Recipes
        })
    end
end)
