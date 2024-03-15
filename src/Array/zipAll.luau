local None = require("@sift/None")
local reduce = require("./reduce")

--[=[
    @within Array

    Links together the values of multiple arrays into a single array of arrays, where each index of the new array contains the values of the original arrays at that index. If the arrays are of different lengths, the shorter arrays will be padded with `None`.

    ```lua
    local array1 = { 1, 2, 3 }
    local array2 = { "a", "b", "c", "d" }

    zipAll(array1, array2)
    -- { { 1, "a" }, { 2, "b" }, { 3, "c" }, { None, "d" } }
    ```
]=]
local function zipAll(...: { any }): { { any } }
    if select("#", ...) == 0 then
        return {}
    end

    local arrays = { ... }
    local length = reduce(arrays, function(acc, array)
        return math.max(acc, #array)
    end, 0)

    local out = {}

    for i = 1, length do
        local values = {}

        for _, array in arrays do
            local value = if array[i] == nil then None else array[i]
            table.insert(values, value)
        end

        table.insert(out, values)
    end

    return out
end

return zipAll
