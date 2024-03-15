local Util = require("@sift/Util")

--[=[
	@within Array

	Gets a value from an array at the given index. If the index is negative, it will be resolved from the end of the array.

	```lua
	at({ 1, 2, 3 }, 2) -- 2
    at({ 1, 2, 3 }, -1) -- 3
	```
]=]
local function at<T>(array: { T }, index: number): T
    index = Util.resolveIndex(#array, index)
    return array[index]
end

return at
