local Util = require("@sift/Util")

local function compare(a, b)
    if typeof(a) ~= "table" or typeof(b) ~= "table" then
        return a == b
    end

    for key, value in a do
        if b[key] ~= value then
            return false
        end
    end

    for key, value in b do
        if a[key] ~= value then
            return false
        end
    end

    return true
end

--[=[
  @within Dictionary

  Compares two dictionaries for equality.

  ```lua
  local dictionary = { hello = "world", goodbye = "world" }
  local other1 = { hello = "world", goodbye = "world" }
  local other2 = { hello = "hello", world = "goodbye" }

  equals(dictionary, other1) -- true
  equals(dictionary, other1, other2) -- false
  ```
]=]
local function equals(...: { [any]: any }): boolean
    if Util.areEqual(...) then
        return true
    end

    local args = { ... }
    local first = table.remove(args, 1) :: { [any]: any }

    for _, dictionary in args do
        if not compare(first, dictionary) then
            return false
        end
    end

    return true
end

return equals
