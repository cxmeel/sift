local removeIndices = require("./removeIndices")

--[=[
    @within Array

    Returns a new array with the first `count` elements removed. If `count` is not provided, it defaults to `1`.

    ```lua
    local array = { "a", "b", "c", "d" }

    shift(array) -- { "b", "c", "d" }
    shift(array, 2) -- { "c", "d" }
    ```
]=]
local function shift<T>(array: { T }, count: number?): { T }
    local useCount = count or 1
    local indices = {}

    if useCount > #array then
        return {}
    end

    for index = #array, useCount, -1 do
        table.insert(indices, index)
    end

    return removeIndices(array, table.unpack(indices))
end

return shift
