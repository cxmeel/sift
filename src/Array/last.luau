local At = require("./at")

--[=[

	@within Array




	Gets the last element of the array.

	```lua
	local array = { 1, 2, 3 }

	local value = Last(array) -- 3
	```
]=]
local function last<T>(array: { T }): T
    return At(array, 0)
end

return last
