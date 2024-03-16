local removeValues = require("./removeValues")

--[=[
	@within Array

	Removes a value from an array.

	```lua
	removeValue({ "a", "b", "c" }, "b") -- { "a", "c" }
	```
]=]
local function removeValue<T>(array: { T }, value: T): { T }
    return removeValues(array, value)
end

return removeValue
