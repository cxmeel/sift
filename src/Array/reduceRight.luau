local None = require("@Sift/None")

--[=[
    @within Array

    Reduces an array into a single value from end to start.

    ```lua
    reduceRight({ 1, 2, 3 }, function(accumulator, value)
        return accumulator - value
    end) -- 0
    ```
]=]
local function reduceRight<T, U>(
	array: { T },
	reducer: (accumulator: U, value: T, index: number) -> U,
	initAccumulator: U?
): U
	local out = initAccumulator :: U
	local start = #array

	if out == nil or out == None then
		out = array[start] :: any
		start -= 1
	end

	for index = start, 1, -1 do
		out = reducer(out, array[index], index)
	end

	return out
end

return reduceRight
