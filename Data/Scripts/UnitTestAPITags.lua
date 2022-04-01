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
    This script allows testing of the APITags system to check for breakages in functionality after updates.
    To run it:
    - Create an empty scene
    - Drag this script into the root level of the Hierarchy (Default Context)
    - Enable Player Storage in the scene's Game Settings
    - Enter Play mode and wait a few seconds

    Completion may take a few seconds.
    Some warnings are expected in the Event Log.
    Errors indicate unintended failure.
--]]

---@type APIDatabase
local DATABASE = require(script:GetCustomProperty("APIDatabase"))
---@type APITags
local TAGS = require(script:GetCustomProperty("APITags"))

local outputs = {}

function Fail(message)
    outputs[#outputs+1] = "UNIT TEST FAILED: " .. message .. "\n" .. CoreDebug.GetTaskStackTrace()
end

function OutputResults()
    for index, msg in ipairs(outputs) do
        Task.Spawn(function()
            error(msg)
        end, (index * 0.25)) -- Stagger output so they end up in correct order
    end
end

function RunUnitTests()
    print("[UNIT] Running unit tests for: APITags")

    ParseStringTests()
    MatchingTests()

    print("[UNIT] Completed unit tests for: APITags")
    OutputResults()
end

function ParseStringTests()
    print("[UNIT] ParseStringTests() starting...")

    -- Multiple tag string
    local tags = TAGS.SplitTagsString("tag1, tag2, tag3 ")
    if #tags ~= 3 then
        Fail("Expected 3 tags, found: " .. #tags)
    end
    if tags[1] ~= "tag1" then
        Fail("Expected 'tag1', found: " .. tags[1])
    end
    if tags[2] ~= "tag2" then
        Fail("Expected 'tag2', found: " .. tags[2])
    end
    if tags[3] ~= "tag3" then
        Fail("Expected 'tag3', found: " .. tags[3])
    end

    -- Single tag string
    tags = TAGS.SplitTagsString("tag1")
    if #tags ~= 1 then
        Fail("Expected 1 tags, found: " .. #tags)
    end
    if tags[1] ~= "tag1" then
        Fail("Expected 'tag1', found: " .. tags[1])
    end

    -- Empty and nil tag strings
    tags = TAGS.SplitTagsString("")
    if #tags ~= 0 then
        Fail("Expected 0 tags, found: " .. #tags)
    end
    tags = TAGS.SplitTagsString("     ")
    if #tags ~= 0 then
        Fail("Expected 0 tags, found: " .. #tags)
    end
    tags = TAGS.SplitTagsString(nil)
    if #tags ~= 0 then
        Fail("Expected 0 tags, found: " .. #tags)
    end

    print("[UNIT] ParseStringTests() complete.")
end

function MatchingTests()
    print("[UNIT] MatchingTests() starting...")

    -- String format matches
    local result = TAGS.AnyMatch("tag1", "tag1")
    if result ~= true then
        Fail("Expected 'true', received: " .. tostring(result))
    end

    result = TAGS.AnyMatch("tag1", "asdf,tag1 , 3213")
    if result ~= true then
        Fail("Expected 'true', received: " .. tostring(result))
    end

    result = TAGS.AnyMatch("asdf,tag1 , 3213", "tag1")
    if result ~= true then
        Fail("Expected 'true', received: " .. tostring(result))
    end

    result = TAGS.AnyMatch("tag1, tag2", "tag2, tag1")
    if result ~= true then
        Fail("Expected 'true', received: " .. tostring(result))
    end

    result = TAGS.AnyMatch("tag1,tag2,tag3", "tag4,tag5,tag6")
    if result ~= false then
        Fail("Expected 'false', received: " .. tostring(result))
    end

    -- Table format matches
    local result = TAGS.AnyMatch({ "tag1" }, { "tag1" })
    if result ~= true then
        Fail("Expected 'true', received: " .. tostring(result))
    end

    result = TAGS.AnyMatch({ "tag1" }, { "asdf", "tag1", "3213" })
    if result ~= true then
        Fail("Expected 'true', received: " .. tostring(result))
    end

    result = TAGS.AnyMatch({ "asdf", "tag1", "3213" }, { "tag1" })
    if result ~= true then
        Fail("Expected 'true', received: " .. tostring(result))
    end

    result = TAGS.AnyMatch({ "tag1", "tag2" }, { "tag2", "tag1" })
    if result ~= true then
        Fail("Expected 'true', received: " .. tostring(result))
    end

    result = TAGS.AnyMatch({ "tag1", "tag2", "tag3" }, { "tag4", "tag5", "tag6" })
    if result ~= false then
        Fail("Expected 'false', received: " .. tostring(result))
    end

    print("[UNIT] MatchingTests() complete.")
end

Task.Spawn(function()
    while #Game.GetPlayers() == 0 do
        Task.Wait()
    end

    player = Game.GetPlayers()[1]
    RunUnitTests()
end, 1)
