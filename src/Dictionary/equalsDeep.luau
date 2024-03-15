local Util = require("@sift/Util")

local function compareDeep(a, b)
    if typeof(a) ~= "table" or typeof(b) ~= "table" then
        return a == b
    end

    for key, value in a do
        if not compareDeep(value, b[key]) then
            return false
        end
    end

    for key, value in b do
        if not compareDeep(value, a[key]) then
            return false
        end
    end

    return true
end

--[=[
  @within Dictionary

  Compares two dictionaries for equality using deep comparison.

  ```lua
  local dictionary = { hello = "world", goodbye = { world = "hello" } }
  local other1 = { hello = "world", goodbye = { world = "hello" } }
  local other2 = { hello = "hello", world = "goodbye" }

  equalsDeep(dictionary, other1) -- true
  equalsDeep(dictionary, other1, other2) -- false
  ```
]=]
local function equalsDeep(...: { [any]: any }): boolean
    if Util.areEqual(...) then
        return true
    end

    local args = { ... }
    local first = table.remove(args, 1) :: { [any]: any }

    for _, dictionary in args do
        if not compareDeep(first, dictionary) then
            return false
        end
    end

    return true
end

return equalsDeep
