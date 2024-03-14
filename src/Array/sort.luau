local copy = require("./copy")

--[=[
    @within Array

    Returns a new array with the elements sorted. The optional `comparer` function is used to compare elements. If not provided, the default comparer will be used (ascending order).

    ```lua
    sort({ 3, 1, 2 }) -- { 1, 2, 3 }
    sort({ "c", "a", "b" }) -- { "a", "b", "c" }
    ```
]=]
local function sort<T>(array: { T }, comparer: ((a: T, b: T) -> boolean)?): { T }
    local result = copy(array)
    table.sort(result, comparer)

    return result
end

return sort
