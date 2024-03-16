local splice = require("./splice")

--[=[
	@within Array

	Inserts values to the beginning of an array.

	#### Aliases

	`prepend`

	```lua
	unshift({ 1, 2, 3 }, 0) -- { 0, 1, 2, 3 }
	```
]=]
local function unshift<T>(array: { T }, ...: T): { T }
    return splice(array, 1, 0, ...)
end

return unshift
