--!strict
--[=[
	@function Some
	@within Array

	@param array {T} -- The array to check.
	@param predicate? (value?: T, index?: number) -> boolean? -- The predicate to use to check the array.
	@return boolean -- Whether some item in the array passes the predicate.

	Checks whether some item in the array passes the predicate.

	```lua
	local array = { 1, 2, 3 }

	local value = Some(array, function(item, index)
		return item > 1
	end) -- true

	local value = Some(array, function(item, index)
		return item > 3
	end) -- false
	```
]=]
local function some<T>(array: { T }, predicate: (T, number) -> boolean?): boolean
	for index, value in ipairs(array) do
		if predicate(value, index) then
			return true
		end
	end

	return false
end

return some
