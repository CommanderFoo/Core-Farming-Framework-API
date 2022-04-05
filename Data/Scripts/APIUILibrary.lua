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

---@class APIUILibrary
local API = {}

---@class TimeFormatStyle
API.TimeFormatStyle = {
    Clock = 1,
    Character = 2
}

API.InputShortName = {
    ["Right Bumper"] = "RB",
    ["Left Bumper"] = "LB",
    ["Right Trigger"] = "RT",
    ["Left Trigger"] = "LT",
    ["Right Stick Button"] = "RS",
    ["Left Stick Button"] = "LS",
    ["Right Mouse Button"] = "RMB",
    ["Left Mouse Button"] = "LMB",
    ["Middle Mouse Button"] = "MMB",
    ["A Button"] = "A",
    ["B Button"] = "B",
    ["X Button"] = "X",
    ["Y Button"] = "Y",
    ["Select Button"] = "SEL",
    ["Start Button"] = "STR",
    ["Up"] = "↑",
    ["Down"] = "↓",
    ["Left"] = "←",
    ["Right"] = "→",
    ["D-pad Up"] = "↑",
    ["D-pad Down"] = "↓",
    ["D-pad Left"] = "←",
    ["D-pad Right"] = "→",
    ["Left Stick Up"] = "LS↑",
    ["Left Stick Down"] = "LS↓",
    ["Left Stick Left"] = "LS←",
    ["Left Stick Right"] = "LS→",
    ["Right Stick Up"] = "RS↑",
    ["Right Stick Down"] = "RS↓",
    ["Right Stick Left"] = "RS←",
    ["Right Stick Right"] = "RS→",
    ["Delete"] = "DEL",
    ["Insert"] = "INS",
    ["Page Up"] = "PGUP",
    ["Page Down"] = "PGDN",
    ["Space Bar"] = "SPBR",
    ["Backspace"] = "BKSP",
    ["Hyphen"] = "-",
    ["Left Bracket"] = "(",
    ["Right Bracket"] = ")",
    ["Backslash"] = "\\",
    ["Semicolon"] = ";",
    ["Comma"] = ",",
    ["Apostrophe"] = "\"",
    ["Period"] = ".",
    ["Slash"] = "/",
    ["Pause"] = "PS",
    ["Num 0"] = "0",
    ["Num 1"] = "1",
    ["Num 2"] = "2",
    ["Num 3"] = "3",
    ["Num 4"] = "4",
    ["Num 5"] = "5",
    ["Num 6"] = "6",
    ["Num 7"] = "7",
    ["Num 8"] = "8",
    ["Num 9"] = "9",
    ["Num +"] = "+",
    ["Num -"] = "-",
    ["Num *"] = "*",
    ["Num /"] = "/",
    ["Num ."] = ".",
}

---Clamps the object to the inside of the screen area.
---@param object UIControl
---@param margins Vector2|nil
function API.ClampToScreen(object, margins)
    margins = margins or Vector2.New()

    local screenSize = UI.GetScreenSize()
    local x, y = API.GetAbsolutePosition(object)
    local xPivotOffset = object.x - x
    local yPivotOffset = object.y - y

    if x < margins.x then
        object.x = margins.x + xPivotOffset
    elseif x + object.width > screenSize.x - margins.x then
        object.x = screenSize.x - margins.x - object.width + xPivotOffset
    end

    if y < margins.y then
        object.y = margins.y + yPivotOffset
    elseif y + object.height > screenSize.y - margins.y then
        object.y = screenSize.y - margins.y - object.height + yPivotOffset
    end
end

---Returns true if the first element is higher than the second.
---@param control1 UIControl
---@param control2 UIControl
---@return boolean
function API.IsAboveUIControl(control1, control2)
    if not Object.IsValid(control1) or not Object.IsValid(control2) then return false end

    -- Handle same parent
    if control1.parent == control2.parent then
        for _, child in ipairs(control1.parent:GetChildren()) do
            if child == control1 then return false end
            if child == control2 then return true end
        end
    end

    -- Find common parent
    local commonParent
    local control1Parents = {}
    local control2Parents = {}
    local object = control1

    while object ~= World.GetRootObject() do
        -- If Control 2 is the parent of Control 1, then Control 1 is above 2
        if object == control2 then
            return true
        end

        table.insert(control1Parents, object)
        object = object.parent
    end

    local control1Parent, control2Parent
    local index = 1

    local function IsControl1Parent(obj)
        for _, value in ipairs(control1Parents) do
            if obj == value then return true end
        end
        return false
    end

    object = control2
    while object ~= World.GetRootObject() do
        -- If Control 1 is the parent of Control 2, then Control 2 is above 1
        if object == control1 then
            return false
        end

        table.insert(control2Parents, object)

        if IsControl1Parent(object) then
            commonParent = control1Parents[index]
            control1Parent = control1Parents[index - 1]
            control2Parent = control2Parents[index - 1]
            break
        end

        object = object.parent
        index = index + 1
    end

    -- See which control is above the other using sibling order
    if commonParent then
        for _, child in ipairs(commonParent:GetChildren()) do
            if child == control1Parent then return false end
            if child == control2Parent then return true end
        end
    end

    return false
end

---Returns true if the cursor is over an object.
---@param object UIControl
---@param includeHidden boolean
---@return boolean
function API.IsCursorOver(object, includeHidden)
    if not includeHidden and not API.IsObjectVisible(object) then
        return false
    end

    local cursorPosition = UI.GetCursorPosition()
    local absoluteX, absoluteY = API.GetAbsolutePosition(object)

    return cursorPosition.x >= absoluteX
        and cursorPosition.x <= absoluteX + object.width
        and cursorPosition.y >= absoluteY
        and cursorPosition.y <= absoluteY + object.height
end

---Returns true if the control is currently visible on screen. Takes UIScrollPanels into account.
---@param object UIControl
---@return boolean
function API.IsObjectVisible(object)
    -- Exit early for hidden objects
    if not object:IsVisibleInHierarchy() then
        return false
    end

    -- Exit early for non UIControls
    if not object:IsA("UIControl") then
        return true
    end

    -- Check scroll panel bounds
    local parentScrollPanel = object:FindAncestorByType("UIScrollPanel")
    if parentScrollPanel then
        local x, y = object.x, object.y
        if API.IsCenter(object.anchor) then
            x = x - object.width / 2
        elseif API.IsRight(object.anchor) then
            x = x - object.width
        end

        if API.IsMiddle(object.anchor) then
            y = y - object.height / 2
        elseif API.IsBottom(object.anchor) then
            y = y - object.height
        end

        if parentScrollPanel.orientation == Orientation.HORIZONTAL then
            return x + object.width > parentScrollPanel.scrollPosition and x < parentScrollPanel.scrollPosition + parentScrollPanel.width
        else
            return y + object.height > parentScrollPanel.scrollPosition and y < parentScrollPanel.scrollPosition + parentScrollPanel.height
        end
    end

    return true
end

---Returns the absolute position of an object.
---@param object UIControl
---@return number
---@return number
function API.GetAbsolutePosition(object)
    return API.GetAbsolutePosition_R(object, 0, 0)
end

---A recursive function that climbs the hierarchy to calculate an objects absolute position.
---@param object UIControl
---@param x number
---@param y number
---@return number
---@return number
function API.GetAbsolutePosition_R(object, x, y)
    if object then
        if object.parent then
            local parentX, parentY = API.GetAbsolutePosition_R(object.parent, x, y)
            x = parentX + x
            y = parentY + y
        end

        local localX, localY = API.GetTopLeftPosition(object)
        x = localX + x
        y = localY + y
    end

    return x, y
end

---Returns the x and y coordinates for the top left position of a UIControl. Takes UIScrollPanels into account.
---@param object UIControl
---@param parentWidth number
---@param parentHeight number
---@return number
---@return number
function API.GetTopLeftPosition(object, parentWidth, parentHeight)
    if not object:IsA("UIControl") then
        return 0, 0
    end

    local x, y = object.x, object.y
    if API.IsCenter(object.anchor) then
        x = x - object.width / 2
    elseif API.IsRight(object.anchor) then
        x = x - object.width
    end

    if API.IsMiddle(object.anchor) then
        y = y - object.height / 2
    elseif API.IsBottom(object.anchor) then
        y = y - object.height
    end

    if not object.parent or object.parent.name == "Root" or object.parent:IsA("UIContainer") then
        local screenSize = UI.GetScreenSize()
        parentWidth = screenSize.x
        parentHeight = screenSize.y
    else
        parentWidth = parentWidth or object.parent.width
        parentHeight = parentHeight or object.parent.height
    end

    -- Handle scrollers
    if object:IsA("UIScrollPanel") then
        if object.orientation == Orientation.HORIZONTAL then
            x = x - object.scrollPosition
        else
            y = y - object.scrollPosition
        end
    end

    if API.IsCenter(object.dock) then
        x = x + parentWidth / 2
    elseif API.IsRight(object.dock) then
        x = x + parentWidth
    end
    if API.IsMiddle(object.dock) then
        y = y + parentHeight / 2
    elseif API.IsBottom(object.dock) then
        y = y + parentHeight
    end

    return x, y
end

---Returns true if the UIPivot is a left aligned pivot.
---@param uiPivot UIPivot
---@return boolean
function API.IsLeft(uiPivot)
    return uiPivot == UIPivot.TOP_LEFT or uiPivot == UIPivot.MIDDLE_LEFT or uiPivot == UIPivot.BOTTOM_LEFT
end

---Returns true if the UIPivot is a center aligned pivot.
---@param uiPivot UIPivot
---@return boolean
function API.IsCenter(uiPivot)
    return uiPivot == UIPivot.BOTTOM_CENTER or uiPivot == UIPivot.MIDDLE_CENTER or uiPivot == UIPivot.TOP_CENTER
end

---Returns true if the UIPivot is a right aligned pivot.
---@param uiPivot UIPivot
---@return boolean
function API.IsRight(uiPivot)
    return uiPivot == UIPivot.BOTTOM_RIGHT or uiPivot == UIPivot.MIDDLE_RIGHT or uiPivot == UIPivot.TOP_RIGHT
end

---Returns true if the UIPivot is a top aligned pivot.
---@param uiPivot UIPivot
---@return boolean
function API.IsTop(uiPivot)
    return uiPivot == UIPivot.TOP_LEFT or uiPivot == UIPivot.TOP_CENTER or uiPivot == UIPivot.TOP_RIGHT
end

---Returns true if the UIPivot is a middle aligned pivot.
---@param uiPivot UIPivot
---@return boolean
function API.IsMiddle(uiPivot)
    return uiPivot == UIPivot.MIDDLE_CENTER or uiPivot == UIPivot.MIDDLE_LEFT or uiPivot == UIPivot.MIDDLE_RIGHT
end

---Returns true if the UIPivot is a bottom aligned pivot.
---@param uiPivot UIPivot
---@return boolean
function API.IsBottom(uiPivot)
    return uiPivot == UIPivot.BOTTOM_CENTER or uiPivot == UIPivot.BOTTOM_LEFT or uiPivot == UIPivot.BOTTOM_RIGHT
end

---comment
---@param seconds number
---@param timeFormatStyle TimeFormatStyle
---@return string
function API.FormatTime(seconds, timeFormatStyle)
    local days = math.floor(seconds / 86400)
    local hours = math.floor((seconds % 86400) / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    seconds = math.floor(seconds % 60)

    if timeFormatStyle == API.TimeFormatStyle.Clock then
        if days > 0 then
            return string.format("%d:%02d:%02d:%02d", days, hours, minutes, seconds)
        elseif hours > 0 then
            return string.format("%02d:%02d:%02d", hours, minutes, seconds)
        elseif minutes > 0 then
            return string.format("%02d:%02d", minutes, seconds)
        else
            return string.format("%ds", seconds)
        end
    elseif not timeFormatStyle or timeFormatStyle == API.TimeFormatStyle.Character then
        if days > 0 then
            return string.format("%dd %dh %dm %ds", days, hours, minutes, seconds)
        elseif hours > 0 then
            return string.format("%dh %dm %ds", hours, minutes, seconds)
        elseif minutes > 0 then
            return string.format("%dm %ds", minutes, seconds)
        else
            return string.format("%ds", seconds)
        end
    end
    return tostring(seconds)
end

---Returns a shortened version of an input for use in UI.
---@param inputType string
---@return string
function API.FormatInputType(inputType)
    if inputType and API.InputShortName[inputType] then
        return API.InputShortName[inputType]
    end
	return inputType or ""
end

return API