local Util = require("@sift/Util")

--[=[
	@within Array

	Finds the index of the first item in the array that matches the value.

	#### Aliases

	`indexOf`

	```lua
    find({ "a", "b", "c", "b", "d" }, "b") -- 2
    find({ "a", "b", "c", "b", "d" }, "b", 3) -- 4
	```
]=]
local function find<T>(array: { T }, value: T, startAt: number?): number?
    return table.find(array, value, Util.resolveIndex(#array, startAt))
end

return find
