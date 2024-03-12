local removeValues = require("./removeValues")

--[=[
    @within Array

    Removes all instances of a value from an array.

    ```lua
    removeValue({ "a", "b", "c", "a" }, "a") -- { "b", "c" }
    ```
]=]
local function removeValue<T>(array: { T }, value: T): { T }
	return removeValues(array, value)
end

return removeValue
