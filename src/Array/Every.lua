--!strict
--[=[
	@function Every
	@within Array

	@param array {T} -- The array to check.
	@param predicate (value?: T, index?: number) -> boolean? -- The predicate to use to check the array.
	@return boolean -- Whether every item in the array passes the predicate.

	Checks whether every item in the array passes the predicate.

	```lua
	local array = { 1, 2, 3 }

	local value = Every(array, function(item, index)
		return item > 0
	end) -- true

	local value = Every(array, function(item, index)
		return item > 1
	end) -- false
	```
]=]
local function every<T>(array: { T }, predicate: (T?, number?) -> boolean?): boolean
	for index, value in ipairs(array) do
		if not predicate(value, index) then
			return false
		end
	end

	return true
end

return every
