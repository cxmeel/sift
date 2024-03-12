local None = require("@Sift/None")

--[=[
    @within Array

    Processes each element of an array with a mapper function and returns a new array with the results.

    ```lua
    map({ 1, 2, 3, 4, 5 }, function(value)
        return value * 2
    end) -- { 2, 4, 6, 8, 10 }
    ```
]=]
local function map<T, U>(array: { T }, mapper: (value: T, index: number) -> U?): { U }
	local out: { U } = {}

	for index, value in array do
		local mapped = mapper(value, index)

		if mapped ~= nil and mapped ~= None then
			table.insert(out, mapped)
		end
	end

	return out
end

return map
