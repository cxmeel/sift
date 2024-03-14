local insert = require("./insert")

--[=[
    @within Array

    Returns a new array with the provided values appended to the end.

    ```lua
    push({ 1, 2, 3 }, 4, 5) -- {1, 2, 3, 4, 5}
    ```
]=]
local function push<T>(array: { T }, ...: T): { T }
    return insert(array, #array + 1, ...)
end

return push
