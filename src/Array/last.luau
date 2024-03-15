local at = require("./at")

--[=[
	@within Array

	Gets the last element of the array.

	```lua
	last({ 1, 2, 3 }) -- 3
	```
]=]
local function last<T>(array: { T }): T
    return at(array, -1)
end

return last
