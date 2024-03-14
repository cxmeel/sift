local toArray = require("@Sift/Set/toArray")
local toSet = require("./toSet")

--[=[
    @within Array

    Returns a new array with all duplicate values removed.

    ```lua
    unique({1, 2, 3, 4, 4, 5, 5, 6}) -- {1, 2, 3, 4, 5, 6}
    ```
]=]
local function unique<T>(array: { T }): { T }
    local set = toSet(array)
    return toArray(set)
end

return unique
