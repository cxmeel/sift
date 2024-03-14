local removeIndices = require("./removeIndices")

--[=[
    @within Array

    Returns a new array with the element at the specified index removed.

    ```lua
    removeIndex({ 1, 2, 3 }, 2) -- {1, 3}
    ```
]=]
local function removeIndex<T>(array: { T }, index: number): { T }
    return removeIndices(array, index)
end

return removeIndex
