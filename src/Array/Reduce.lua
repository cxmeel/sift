--!strict
--[=[
	@function Reduce
	@within Array

	@param array {T} -- The array to reduce.
	@param reducer (accumulator: A, value: T, index: number) -> A -- The reducer to use.
	@param initialReduction? A -- The initial accumulator value.
	@return A -- The final accumulator value.

	Reduces the array using the given reducer and initial accumulator value.
	If no `initialReduction` value is given, the first item in the array is used.

	```lua
	local array = { 1, 2, 3 }

	local value = Reduce(array, function(accumulator, item, index)
		return accumulator - item
	end) -- -4

	local value = Reduce(array, function(accumulator, item, index)
		table.insert(accumulator, item)
		return accumulator
	end, {}) -- { 1, 2, 3 }
	```
]=]
local function reduce<T, U>(array: { T }, reducer: (U, T, number) -> U, initReduction: U?): U
	local result = initReduction
	local start = 1

	if not result then
		result = array[1]
		start = 2
	end

	for index = start, #array do
		result = reducer(result, array[index], index)
	end

	return result
end

return reduce
