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
    This component will enable or diable an object when a Producer changes state. This component must be attached to a
    Crafting Station client template to work.
--]]

-- Required APIs
---@type APIReactiveComponent
local REACTIVE_COMPONENT = require(script:GetCustomProperty("APIReactiveComponent"))

-- User Exposed Properties
local OBJECT_TO_TOGGLE = script:GetCustomProperty("ObjectToToggle"):WaitForObject()
local DELAY_SECONDS = script:GetCustomProperty("DelaySeconds")
local DISABLE_ON_CHANGE = script:GetCustomProperty("DisableOnChange")
local RECIPES = script:GetCustomProperty("Recipes")
local CHANGE_ON_CRAFT = script:GetCustomProperty("ChangeOnCraft")
local CHANGE_ON_READY = script:GetCustomProperty("ChangeOnReady")
local CHANGE_ON_COLLECTED = script:GetCustomProperty("ChangeOnCollected")

local component = REACTIVE_COMPONENT.NewCraftingStationComponent(script, OBJECT_TO_TOGGLE, RECIPES, CHANGE_ON_CRAFT, CHANGE_ON_READY, CHANGE_ON_COLLECTED, false, REACTIVE_COMPONENT.BehaviorType.ToggleEnabled, {
    DisableOnChange = DISABLE_ON_CHANGE,
    DelaySeconds = DELAY_SECONDS
}, false)