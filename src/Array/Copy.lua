--!strict
--[=[
	@function Copy
	@within Array

	@param array {T} -- The array to copy.
	@return {T} -- The copied array.

	Copies an array.

	```lua
	local array = { 1, 2, 3 }

	local new = Copy(array) -- { 1, 2, 3 }

	print(new == array) -- false
	```
]=]
local function copy<T>(array: { T }): { T }
	local result = {}

	for _, item in ipairs(array) do
		table.insert(result, item)
	end

	return result
end

return copy
