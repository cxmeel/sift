--[=[
    @within Array

    Returns the number of elements in the array, optionally filtered by a predicate.

    ```lua
    local array = { 1, 2, 3, 4, 5 }

    count(array) -- 5
    count(array, function(value)
        return value > 3
    end) -- 2
    ```
]=]
local function count<T>(array: { T }, predicate: ((value: T, index: number) -> boolean)?): number
	local counter = 0

	for index, value in array do
		if not predicate or predicate(value, index) then
			counter = counter + 1
		end
	end

	return counter
end

return count
