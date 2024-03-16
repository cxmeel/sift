local at = require("./at")

--[=[
	@within Array

	Returns the last element of an array.

	```lua
	last({ 1, 2, 3 }) -- 3
	```
]=]
local function last<T>(array: { T }): T
    return at(array, -1)
end

return last
