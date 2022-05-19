--!strict
local Sift = script.Parent.Parent

local None = require(Sift.None)

--[=[
	@function concat
	@within Array

	@param ... ...{T} -- The arrays to concatenate.
	@return {T} -- The concatenated array.

	Joins multiple arrays together into a single array.

	#### Aliases

	`join`, `merge`

	```lua
	local table1 = { 1, 2, 3 }
	local table2 = { 4, 5, 6 }

	local new = Concat(table1, table2) -- { 1, 2, 3, 4, 5, 6 }
	```
]=]
local function concat<T>(...: { T }): { T }
	local result = {}

	for _, array in ipairs({ ... }) do
		if type(array) ~= "table" then
			continue
		end

		for _, item in ipairs(array) do
			if item ~= None then
				table.insert(result, item)
			end
		end
	end

	return result
end

return concat
