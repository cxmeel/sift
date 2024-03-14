local Util = require("@Sift/Util")

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

  Performs a shallow comparison between two or more dictionaries. Returns `true` if all dictionaries are equal.

  ```lua
  local dictionary1 = { a = "foo", b = { c = "bar" } }
  local dictionary2 = { a = "foo", b = { c = "bar" } }
  local dictionary3 = { a = "foo", c = "baz" }

  equals(dictionary1, dictionary2) -- true
  equals(dictionary1, dictionary2, dictionary3) -- false
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
