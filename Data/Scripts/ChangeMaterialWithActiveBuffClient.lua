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
    This script simply registers to a buff target and listens for the buff being added or removed to visually
    change a target object
--]]

-- Required APIs
---@type APIReactiveComponent
local REACTIVE_COMPONENT = require(script:GetCustomProperty("APIReactiveComponent"))

-- User Exposed Properties
local BUFF_ID = script:GetCustomProperty("BuffId")
local CHANGE_MATERIAL = script:GetCustomProperty("ChangeMaterial")
local CHANGE_COLOR = script:GetCustomProperty("ChangeColor")
local DEFAULT_MATERIAL = script:GetCustomProperty("DefaultMaterial")
local DEFAULT_COLOR = script:GetCustomProperty("DefaultColor")
local OBJECT_TO_CHANGE = script:GetCustomProperty("ObjectToChange"):WaitForObject()
local DELAY_SECONDS = script:GetCustomProperty("DelaySeconds")
local CHANGE_DESCENDANTS = script:GetCustomProperty("ChangeDescendants")

REACTIVE_COMPONENT.NewBuffComponent(script, OBJECT_TO_CHANGE, BUFF_ID, false, REACTIVE_COMPONENT.BehaviorType.ChangeMaterial, {
    ActiveMaterial = CHANGE_MATERIAL,
    ActiveColor = CHANGE_COLOR,
    InactiveMaterial = DEFAULT_MATERIAL,
    InactiveColor = DEFAULT_COLOR,
    IncludeDescendants = CHANGE_DESCENDANTS,
    DelaySeconds = DELAY_SECONDS
}, true)