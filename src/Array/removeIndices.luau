local reduce = require("./reduce")

--[=[
    @within Array

    Returns a new array with the elements at the specified indices removed.

    ```lua
    removeIndices({ 1, 2, 3, 4, 5 }, 2, 4) -- {1, 3, 5}
    ```
]=]
local function removeIndices<T>(array: { T }, ...: number): { T }
    local indices = reduce({ ... }, function(acc, value)
        if value == 0 then
            value = 1
        elseif value < 0 then
            value += #array + 1
        end

        acc[value] = true

        return acc
    end, {})

    local out = {}

    for index, value in array do
        if not indices[index] then
            table.insert(out, value)
        end
    end

    return out
end

return removeIndices
