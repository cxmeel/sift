--!strict
local Sift = script.Parent.Parent

local Util = require(Sift.Util)

--[=[
	@function Filter
	@within Array

	@param array {T} -- The array to filter.
	@param predicate? (value: T, index: number, array: {T}) -> boolean? -- The predicate to use to filter the array.
	@return {T} -- The filtered array.

	Filters an array.

	```lua
	local array = { 1, 2, 3 }

	local result = Filter(array, function(item, index)
		return item > 1
	end) -- { 2, 3 }
	```
]=]
local function filter<T>(array: { T }, predicate: ((value: T, index: number, array: { T }) -> boolean?)?): { T }
	local result = {}

	predicate = if type(predicate) == "function" then predicate else Util.Func.Truthy

	for index, value in ipairs(array) do
		if predicate(value, index, array) then
			table.insert(result, value)
		end
	end

	return result
end

return filter
