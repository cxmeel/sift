local copy = require("./copy")

--[=[
	@within Array

	Sorts an array using a custom sorting function. If no sorting function is provided, the array will be sorted in ascending order.

	```lua
    sort({ "a", "c", "b" }, function(a, b)
        return a < b
    }) -- { "a", "b", "c" }
	```
]=]
local function sort<T>(array: { T }, sorter: (a: T, b: T) -> boolean): { T }
    local out = copy(array)
    table.sort(out, sorter)

    return out
end

return sort
