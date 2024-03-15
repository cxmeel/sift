local Copy = require("./copy")

--[=[

	@within Array





	Sorts an array.

	```lua
	local array = { "a", "b", "c", "d", "e" }

	local new = Sort(array, function(a, b)
		return a > b
	end) -- { "e", "d", "c", "b", "a" }
	```
]=]
local function sort<T>(
    array: { T },
    comparator: ((firstValue: T, secondValue: T) -> boolean)?
): { T }
    local result = Copy(array)

    table.sort(result, comparator)

    return result
end

return sort
