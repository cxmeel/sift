local partition = require("./partition")

--[=[
	@within Array

	Filters an array using a filterer callback. Any items that do not pass the filterer will be removed from the array.

	```lua
	filter({ 1, 2, 3}, function(item, index)
		return item > 1
	end) -- { 2, 3 }
	```
]=]
local function filter<T>(
    array: { T },
    predicate: (value: T, index: number, array: { T }) -> boolean
): { T }
    local pass = partition(array, predicate)
    return pass
end

return filter
