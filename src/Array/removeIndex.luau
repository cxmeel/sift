local removeIndices = require("./removeIndices")

--[=[
	@within Array

	Removes a value from an array at the given index.

	```lua
    removeIndex({ 1, 2, 3 }, -1) -- { 1, 2 }
	```
]=]
local function removeIndex<T>(array: { T }, index: number): { T }
    return removeIndices(array, index)
end

return removeIndex
