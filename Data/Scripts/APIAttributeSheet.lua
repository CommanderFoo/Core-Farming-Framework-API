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
    An attribute sheet holds a list of attributes defined by names. It allows you to register
    modifier functions which take the attribute sheet as their first parameter to modify attributes. 
    
    Example:
    
    local ATTRIBUTE_SHEET = require(script:GetCustomProperty("APIAttributeSheet")) ---@type APIAttributeSheet

    -- Make a new attribute sheet
    local myAttributeSheet = ATTRIBUTE_SHEET.New()

    -- Add attributes
    myAttributeSheet:AddAttribute("Strength", 100)
    myAttributeSheet:AddAttribute("Wisdom", 100) 
    myAttributeSheet:AddAttribute("Charisma", 100)
    myAttributeSheet:AddAttribute("Dexterity", 100)  

    -- Example function will give a 10% buff to strength
    function ExampleBuff(sheet)
        sheet:IncreaseMultiplier("Strength", 0.1)
    end

    -- Example of a 10% debuff to wisdom
    function ExampleDefuff(sheet)
        sheet:IncreaseMultiplier("Wisdom", -0.1)
    end  

    -- Add our modifiers to the attribute sheet
    myAttributeSheet:AddModifier(ExampleBuff)
    myAttributeSheet:AddModifier(ExampleDefuff)

    -- Recalculate the totals (which will reset the attributes and call the modifier functions)
    myAttributeSheet:UpdateTotals()

    print("Strength:", myAttributeSheet:GetAttributeValue("Strength") )
    print("Wisdom:", myAttributeSheet:GetAttributeValue("Wisdom")

--]]

---@type Attribute
local ATTRIBUTE = require(script:GetCustomProperty("APIAttribute"))

---@class AttributeSheet
---@field attributes table<string, Attribute>
---@field modifiers fun(param:AttributeSheet)[]
local AttributeSheet = {}

AttributeSheet.__index = AttributeSheet

---Make a new attribute sheet
---@return AttributeSheet
function AttributeSheet.New()
    local self = {}
    ---@type table<string, Attribute>
    self.attributes = {}
    self.modifiers = {}
    setmetatable(self, AttributeSheet)
    return self
end

---Adds a new attribute
---@param name string name of the attribute
---@param value number base value of the attribute
---@return Attribute
function AttributeSheet:AddAttribute(name, value)
    local attribute = ATTRIBUTE.New(value)
    self.attributes[name] = attribute
    return attribute
end

---Removes the attribute from the sheet
---@param name string name of the attribute to remove
function AttributeSheet:RemoveAttribute(name)
    assert(type(name) == "string")
    self.attributes[name] = nil
end

---Removes all the attributes from the attribute sheet
function AttributeSheet:ClearAttributes()
    self.attributes = {}
end

---Removes everything from the attribute sheet
function AttributeSheet:Reset()
    self.attributes = {}
    self.modifiers = {}
end

---Gets an attribute by name
---@param name string
---@return Attribute
function AttributeSheet:GetAttribute(name)
    return self.attributes[name]
end

---Adds a modifier
---@param modifier fun(param:AttributeSheet)
function AttributeSheet:AddModifier(modifier)
    table.insert(self.modifiers, modifier)
end

---Removes a modifier
function AttributeSheet:RemoveModifier(removeModifier)
    for index, modifier in pairs(self.modifiers) do
        if modifier == removeModifier then
            table.remove(self.modifiers, index)
        end
    end
end

---Removes all the modifiers
function AttributeSheet:ClearModifiers()
    self.modifiers = {}
end

---Updates the totals of all the attributes
function AttributeSheet:UpdateTotals()
    for _, attribute in pairs(self.attributes) do
        attribute:Reset()
    end
    for _, modifier in ipairs(self.modifiers) do
        modifier(self)
    end
    for _, attribute in pairs(self.attributes) do
        attribute:UpdateTotal()
    end
end

---Call from within a modifier to increase the addition of an attribute (by name)
---@param name string
---@param value number
function AttributeSheet:IncreaseAddition(name, value)
    local attribute = self.attributes[name]
    if attribute then
        attribute:IncreaseAddition(value)
    end
end

---Call from within a modifier to increase the multiplier of an attribute (by name)
---@param name string
---@param value number
function AttributeSheet:IncreaseMultiplier(name, value)
    local attribute = self.attributes[name]
    if attribute then
        attribute:IncreaseMultiplier(value)
    end
end

function AttributeSheet:GetAttributeValue(name)
    ---@type Attribute
    local attribute = self.attributes[name]
    return attribute.total
end

return AttributeSheet



