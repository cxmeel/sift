local at = require("./at")

--[=[
    @within Array

    Returns the first element of an array.

    ```lua
    first({ "a", "b", "c" }) -- "a"
    ```
]=]
local function first<T>(array: { T }): T
    return at(array, 1)
end

return first
