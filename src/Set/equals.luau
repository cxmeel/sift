local Util = require("@sift/Util")
local count = require("./count")

local function compare(a: any, b: any)
    if typeof(a) ~= "table" or typeof(b) ~= "table" then
        return a == b
    end

    local aLength = count(a)
    local bLength = count(b)

    if aLength ~= bLength then
        return false
    end

    for value in a do
        if not b[value] then
            return false
        end
    end

    return true
end

--[=[
    @within Set

    Returns `true` if all sets are equal; i.e. they contain the same elements.

    ```lua
    equals(Set<{ "a", "b" }>, Set<{ "b", "a" }>) -- true
    ```
]=]
local function equals<T>(...: { [T]: boolean }): boolean
    if Util.areEqual(...) then
        return true
    end

    local args = { ... }
    local first = table.remove(args, 1) :: { [T]: boolean }

    for _, set in args do
        if not compare(first, set) then
            return false
        end
    end

    return true
end

return equals
