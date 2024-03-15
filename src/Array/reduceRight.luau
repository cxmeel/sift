--[=[
	@within Array

	Reduces the array using the given reducer and initial accumulator value, starting from the end of the array. If no `initialReduction` value is given, the last item in the array is used.

	```lua
	reduceRight({ 1, 2, 3 }, function(acc, item)
		return acc - item
	end) -- 0
	```
]=]
local function reduceRight<T, U>(
    array: { T },
    reducer: (
        acc: U,
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
