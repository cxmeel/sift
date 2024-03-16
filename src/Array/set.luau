local splice = require("./splice")

--[=[
	@within Array

	Sets a value on an array at the given index.

	```lua
	set({ "a", "b", "c" }, 2, "d") -- { "a", "d", "c" }
	```
]=]
local function set<T>(array: { T }, index: number, value: T): { T }
    return splice(array, index, 1, value)
end

return set
