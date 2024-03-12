local None = require("@Sift/None")

--[=[
    @within Array

    Reduces an array to a single value using a reducer function.

    ```lua
    reduce({ 1, 2, 3 }, function(accumulator, value)
        return accumulator + value
    end) -- 6
    ```
]=]
local function reduce<T, U>(
	array: { T },
	reducer: (accumulator: U, value: T, index: number) -> U,
	initAccumulator: U?
): U
	local out = initAccumulator :: U
	local start = 1

	if out == nil or out == None then
		out = array[1] :: any
		start = 2
	end

	for index = start, #array do
		out = reducer(out, array[index], index)
	end

	return out
end

return reduce
