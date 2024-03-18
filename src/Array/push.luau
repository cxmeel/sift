local splice = require("./splice")

--[=[
    @within Array

    Adds elements to the end of the array.

    #### Aliases

    `append`

    ```lua
    push({ 1, 2, 3 }, 4, 5) -- { 1, 2, 3, 4, 5 }
    ```
]=]
local function push<T>(array: { T }, ...: T): { T }
    return splice(array, #array + 1, 0, ...)
end

return push
