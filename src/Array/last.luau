local at = require("./at")

--[=[
    @within Array

    Returns the last element of an array.

    ```lua
    last({ "a", "b", "c" }) --> "c"
    ```
]=]
local function last<T>(array: { T }): T
	return at(array, -1)
end

return last
