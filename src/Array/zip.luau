local reduce = require("./reduce")

--[=[
    @within Array

    Links together the values of multiple arrays into a single array of arrays, where each index of the new array contains the values of the original arrays at that index. If the arrays are of different lengths, the new array will be the length of the shortest array.

    ```lua
    local array1 = { "a", "b", "c", "d" }
    local array2 = { 1, 2, 3 }

    zip(array1, array2)
    -- { { "a", 1 }, { "b", 2 }, { "c", 3 } }
    ```
]=]
local function zip(...: { any }): { { any } }
    if select("#", ...) == 0 then
        return {}
    end

    local arrays = { ... }
    local length = reduce(arrays, function(acc, array)
        return math.min(acc, #array)
    end, math.huge)

    local out = {}

    for index = 1, length do
        local values = {}

        for _, array in arrays do
            table.insert(values, array[index])
        end

        table.insert(out, values)
    end

    return out
end

return zip
