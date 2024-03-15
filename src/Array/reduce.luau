--[=[
	@within Array

	Reduces the array using the given reducer and initial accumulator value. If no `initialReduction` value is given, the first item in the array is used.

	```lua
	reduce({ 1, 2, 3 }, function(acc, value)
		return acc + value
	end) -- 6
	```
]=]
local function reduce<T, U>(
    array: { T },
    reducer: (acc: U, value: T, index: number, array: { T }) -> U,
    initReduction: U?
): U
    local result = initReduction
    local start = 1

    if result == nil then
        result = array[1]
        start = 2
    end

    for index = start, #array do
        result = reducer(result, array[index], index, array)
    end

    return result
end

return reduce
