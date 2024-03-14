local reduce = require("./reduce")

--[=[
    @within Array

    Returns the number of elements in the array, optionally filtered by a predicate.

    ```lua
    local array = { 1, 2, 3, 4, 5 }

    count(array) -- 5
    count(array, function(value)
        return value > 3
    end) -- 2
    ```
]=]
local function count<T>(array: { T }, predicate: ((value: T, index: number) -> boolean)?): number
    return reduce(array, function(acc: number, value, index)
        if not predicate or predicate(value, index) then
            return acc + 1
        end

        return acc
    end, 0)
end

return count
