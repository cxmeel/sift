--[=[
    @within Array

    Returns `true` if every element in the array passes the test implemented by the provided function. Otherwise, it returns `false`.

    ```lua
    every({ 1, 2, 3, 4, 5 }, function(value)
        return value > 0
    }) -- true
    ```
]=]
local function every<T>(array: { T }, predicate: (value: T, index: number) -> boolean): boolean
	for index, value in array do
		if not predicate(value, index) then
			return false
		end
	end

	return true
end

return every
