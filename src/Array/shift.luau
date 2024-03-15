--[=[

	@within Array





	Removes the first item from an array and returns the array
	with the item removed.

	```lua
	local array = { 1, 2, 3 }

	local new = Shift(array) -- { 2, 3 }
	local new = Shift(array, 2) -- { 3 }
	```
]=]
local function shift<T>(array: { T }, count: number?): { T }
    local length = #array
    local result = {}

    count = if typeof(count) == "number" then count + 1 else 2

    for i = count, length do
        table.insert(result, array[i])
    end

    return result
end

return shift
