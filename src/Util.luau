--[=[
    @class Util
]=]

--[=[
    @within Util

    Determines if the given value is empty. If the value is a table, it will check if the table is empty. If the value is nil, it will return true.

    ```lua
    isEmpty({}) -- true
    isEmpty({1, 2, 3}) -- false
    isEmpty(nil) -- true
    isEmpty(1) -- false
    ```
]=]
local function isEmpty(value: any): boolean
    if typeof(value) == "table" then
        return next(value) == nil
    end

    return value == nil
end

--[=[
    @within Util

    Determines if all of the given value are equal to each other.

    ```lua
    areEqual(1, 1, 1) -- true
    areEqual(1, 2, 3) -- false
    ```
]=]
local function areEqual(...: any): boolean
    local args = { ... }
    local first = table.remove(args, 1)

    for _, value in args do
        if first ~= value then
            return false
        end
    end

    return true
end

--[=[
    @within Util

    Normalizes an index to be within the bounds of a given length. If the index is 0, it will be converted to 1. If the index is negative, it will be converted to a positive index.

    ```lua
    resolveIndex(5, 1) -- 1
    resolveIndex(5, 0) -- 1
    resolveIndex(5, -1) -- 5
    ```
]=]
local function resolveIndex(length: number, index: number): number
    if index == 0 then
        return 1
    elseif index < 0 then
        return index + length + 1
    end

    return index
end

return {
    isEmpty = isEmpty,
    areEqual = areEqual,
    resolveIndex = resolveIndex,
}
