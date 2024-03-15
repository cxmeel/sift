--[=[

	@within Array






	Reduces the array using the given reducer and initial accumulator value,
	starting from the end of the array. If no `initialReduction` value is given,
	the last item in the array is used.

	```lua
	local array = { 1, 2, 3 }

	local value = ReduceRight(array, function(accumulator, item, index)
		return accumulator - item
	end) -- 0

	local value = ReduceRight(array, function(accumulator, item, index)
		table.insert(accumulator, item)
		return accumulator
	end, {}) -- { 3, 2, 1 }
	```
]=]
local function reduceRight<T, U>(
    array: { T },
    reducer: (
        accumulator: U,
        value: T,
        index: number,
        array: { T }
    ) -> U,
    initReduction: U?
): U
    local result = initReduction
    local start = #array

    if result == nil then
        result = array[start]
        start -= 1
    end

    for index = start, 1, -1 do
        result = reducer(result, array[index], index, array)
    end

    return result
end

return reduceRight
