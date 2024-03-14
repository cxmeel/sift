local Util = require("@Sift/Util")

local function compare(a: any, b: any)
    if typeof(a) ~= "table" or typeof(b) ~= "table" then
        return a == b
    end

    if #a ~= #b then
        return false
    end

    for index, value in a do
        if value ~= b[index] then
            return false
        end
    end

    return true
end

--[=[
    @within Array

    Returns whether or not all of the given arrays are equal to each other.

    ```lua
    local array1 = { 1, 2, 3 }
    local array2 = { 1, 2, 3 }

    equals(array1, array2) -- true
    ```
]=]
local function equals(...: any): boolean
    if Util.areEqual(...) then
        return true
    end

    local args = { ... }
    local first = table.remove(args, 1)

    for _, array in args do
        if not compare(first, array) then
            return false
        end
    end

    return true
end

return equals
