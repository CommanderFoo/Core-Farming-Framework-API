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
    This component will spawn an object when a Buff is applied.
--]]

-- Required APIs
---@type APIReactiveComponent
local REACTIVE_COMPONENT = require(script:GetCustomProperty("APIReactiveComponent"))

-- User Exposed Properties
local BUFF_ID = script:GetCustomProperty("BuffId")
local ASSET = script:GetCustomProperty("Asset")
local LOCAL_SPACE = script:GetCustomProperty("LocalSpace")
local OFFSET = script:GetCustomProperty("Offset")
local ROTATION = script:GetCustomProperty("Rotation")
local SCALE = script:GetCustomProperty("Scale")
local DELAY_SECONDS = script:GetCustomProperty("DelaySeconds")
local DESTROY_WHEN_INACTIVE = script:GetCustomProperty("DestroyWhenInactive")

local component = REACTIVE_COMPONENT.NewBuffComponent(script, script, BUFF_ID, false, REACTIVE_COMPONENT.BehaviorType.SpawnObject, {
    Asset = ASSET,
    LocalSpace = LOCAL_SPACE,
    Offset = OFFSET,
    Rotation = ROTATION,
    Scale = SCALE,
    DelaySeconds = DELAY_SECONDS,
    DestroyWhenInactive = DESTROY_WHEN_INACTIVE
}, false)