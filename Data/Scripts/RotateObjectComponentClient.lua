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
    This can be added to an object to make it rotate by leveraging the Modular Interaction System. Just add this script
    to the object in a ClientContext and setup the Custom Properties. Refer to the Interaction System README for more
    details.
--]]

-- Internal Variables
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
local INTERACTION_MODULE = script:GetCustomProperty("APIInteractionModule")
local SUB_TARGET = script:GetCustomProperty("SubTarget"):WaitForObject()
local OBJECT_TO_ROTATE = script:GetCustomProperty("ObjectToRotate"):WaitForObject()
local PRESS_BINDING = script:GetCustomProperty("PressBinding")
local ROTATE_ON_BEGIN_HOVER = script:GetCustomProperty("RotateOnBeginHover")
local BEGIN_HOVER_ROTATION = script:GetCustomProperty("BeginHoverRotation")
local BEGIN_HOVER_CURVE = script:GetCustomProperty("BeginHoverCurve")
local BEGIN_HOVER_DURATION = script:GetCustomProperty("BeginHoverDuration")
local BEGIN_HOVER_USE_LOCAL_SPACE = script:GetCustomProperty("BeginHoverUseLocalSpace")
local ROTATE_ON_END_HOVER = script:GetCustomProperty("RotateOnEndHover")
local END_HOVER_ROTATION = script:GetCustomProperty("EndHoverRotation")
local END_HOVER_CURVE = script:GetCustomProperty("EndHoverCurve")
local END_HOVER_DURATION = script:GetCustomProperty("EndHoverDuration")
local END_HOVER_USE_LOCAL_SPACE = script:GetCustomProperty("EndHoverUseLocalSpace")
local ROTATE_ON_BEGIN_PRESS = script:GetCustomProperty("RotateOnBeginPress")
local BEGIN_PRESS_ROTATION = script:GetCustomProperty("BeginPressRotation")
local BEGIN_PRESS_CURVE = script:GetCustomProperty("BeginPressCurve")
local BEGIN_PRESS_DURATION = script:GetCustomProperty("BeginPressDuration")
local BEGIN_PRESS_USE_LOCAL_SPACE = script:GetCustomProperty("BeginPressUseLocalSpace")
local ROTATE_ON_END_PRESS = script:GetCustomProperty("RotateOnEndPress")
local END_PRESS_ROTATION = script:GetCustomProperty("EndPressRotation")
local END_PRESS_CURVE = script:GetCustomProperty("EndPressCurve")
local END_PRESS_DURATION = script:GetCustomProperty("EndPressDuration")
local END_PRESS_USE_LOCAL_SPACE = script:GetCustomProperty("EndPressUseLocalSpace")

if INTERACTION_MODULE == nil or INTERACTION_MODULE == "" then
    warn(string.format("An Interaction Module must be set on Component: %s (%s)", script.name, script.id))
    return
end

local INTERACTION = require(INTERACTION_MODULE)

-- Private Variables
local rotateRoot = OBJECT_TO_ROTATE or COMPONENT_ROOT
local rotationData = {
    BeginHover = {
        Rotation = BEGIN_HOVER_ROTATION,
        Curve = BEGIN_HOVER_CURVE,
        Duration = BEGIN_HOVER_DURATION,
        UseLocalSpace = BEGIN_HOVER_USE_LOCAL_SPACE
    },
    EndHover = {
        Rotation = END_HOVER_ROTATION,
        Curve = END_HOVER_CURVE,
        Duration = END_HOVER_DURATION,
        UseLocalSpace = END_HOVER_USE_LOCAL_SPACE
    },
    BeginPress = {
        Rotation = BEGIN_PRESS_ROTATION,
        Curve = BEGIN_PRESS_CURVE,
        Duration = BEGIN_PRESS_DURATION,
        UseLocalSpace = BEGIN_PRESS_USE_LOCAL_SPACE
    },
    EndPress = {
        Rotation = END_PRESS_ROTATION,
        Curve = END_PRESS_CURVE,
        Duration = END_PRESS_DURATION,
        UseLocalSpace = END_PRESS_USE_LOCAL_SPACE
    }
}
local rotateTask

--[[
    Callbacks
--]]

function OnHoverBegin(position, normal)
    if ROTATE_ON_BEGIN_HOVER then
        Rotate(rotationData.BeginHover)
    end
end

function OnHoverEnd(position, normal)
    if ROTATE_ON_END_HOVER then
        Rotate(rotationData.EndHover)
    end
end

function OnPressBegin(binding, position, normal)
    if ROTATE_ON_BEGIN_PRESS and (PRESS_BINDING == "" or PRESS_BINDING == binding) then
        Rotate(rotationData.BeginPress)
    end
end

function OnPressEnd(binding, position, normal)
    if ROTATE_ON_END_PRESS and (PRESS_BINDING == "" or PRESS_BINDING == binding) then
        Rotate(rotationData.EndPress)
    end
end

--[[
    Helper Functions
--]]

function Rotate(rotationData)
    -- Duration must be 0 or greater
    local duration = rotationData.Duration
    if duration < 0 then
        duration = 0
    end

    if rotateTask then
        rotateTask:Cancel()
    end

    rotateTask = Task.Spawn(function()
        local totalIterations = math.floor(duration * 30)
        local iterations = 0
        local value = 0
        while iterations < totalIterations do
            value = rotationData.Curve:GetValue(iterations / totalIterations)
            rotateRoot:RotateTo(rotationData.Rotation * value, 0, rotationData.UseLocalSpace)
            iterations = iterations + 1
            Task.Wait()
        end

        value = rotationData.Curve:GetValue(1)
        rotateRoot:RotateTo(rotationData.Rotation * value, 0, rotationData.UseLocalSpace)
    end)
end

--[[
    Initialization
--]]

local functionTable = {
    HoverBegin = OnHoverBegin,
    HoverEnd = OnHoverEnd,
    PressBegin = OnPressBegin,
    PressEnd = OnPressEnd
}

-- Register with the input module. This can fail if any of the parameters are invalid
if not INTERACTION.RegisterTarget(COMPONENT_ROOT, SUB_TARGET, functionTable) then
    warn(string.format("Could not initialize %s (%s)", script.name, script.id))
    return
end

COMPONENT_ROOT.destroyEvent:Connect(INTERACTION.UnregisterTarget)