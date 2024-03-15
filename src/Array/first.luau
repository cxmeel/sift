local at = require("./at")

--[=[
	@within Array

	Gets the first item in the array.

	```lua
	first({ 1, 2, 3 }) -- 1
	```
]=]
local function first<T>(array: { T }): T
    return at(array, 1)
end

return first
