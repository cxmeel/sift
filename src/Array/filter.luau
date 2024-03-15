local Util = require("@sift/Util")

--[=[

	@within Array





	Filters an array using a filterer callback. Any items that do not pass the filterer will be removed from the array.

	If no filterer is provided, all items will be kept.

	```lua
	local array = { 1, 2, 3 }

	local result = Filter(array, function(item, index)
		return item > 1
	end) -- { 2, 3 }
	```
]=]
local function filter<T>(
    array: { T },
    predicate: ((value: T, index: number, array: { T }) -> boolean?)?
): { T }
    local result = {}

    predicate = if typeof(predicate) == "function" then predicate else Util.func.truthy

    for index, value in array do
        if predicate(value, index, array) then
            table.insert(result, value)
        end
    end

    return result
end

return filter
