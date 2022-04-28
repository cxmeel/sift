--!strict
local Sift = script.Parent.Parent

local CopyDeep = require(script.Parent.copyDeep)
local None = require(Sift.None)

--[=[
	@function concatDeep
	@within Array

	@param ... ...{T} -- The arrays to concatenate.
	@return {T} -- The concatenated array.

	Joins multiple arrays together into a single array, with deep copies of all
	nested arrays.

	```lua
	local table1 = { 1, 2, { 3, 4 } }
	local table2 = { 5, 6, { 7, 8 } }

	local new = ConcatDeep(table1, table2) -- { 1, 2, { 3, 4 }, 5, 6, { 7, 8 } }
	```
]=]
local function concatDeep<T>(...: { T }): { T }
	local result = {}

	for _, array in ipairs({ ... }) do
		if type(array) ~= "table" then
			continue
		end

		for _, value in ipairs(array) do
			if value ~= None then
				if type(value) == "table" then
					table.insert(result, CopyDeep(value))
				else
					table.insert(result, value)
				end
			end
		end
	end

	return result
end

return concatDeep
