--!strict
--[=[
	@function Map
	@within Array

	@param array {T} -- The array to map.
	@param mapper (value?: T, index?: number) -> T? -- The mapper function.
	@return {T} -- The mapped array.

	Maps the array using the mapper function.

	```lua
	local array = { 1, 2, 3 }

	local new = Map(array, function(value, index)
		return value * 2
	end) -- { 2, 4, 6 }
	```
]=]
local function map<T>(array: { T }, mapper: (T?, number?) -> T?): { T }
	local mapped = {}

	for index, value in ipairs(array) do
		local mappedValue = mapper(value, index)

		if mappedValue ~= nil then
			table.insert(mapped, mappedValue)
		end
	end

	return mapped
end

return map
