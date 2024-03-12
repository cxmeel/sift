local removeIndices = require("./removeIndices")

--[=[
    @within Array

    Returns a new array with the last `count` elements removed. If `count` is not provided, it defaults to `1`.

    ```lua
    local array = { 1, 2, 3, 4, 5 }

    pop(array) -- { 1, 2, 3, 4 }
    pop(array, 3) -- { 1, 2 }
    ```
]=]
local function pop<T>(array: { T }, count: number?): { T }
	local useCount = count or 1
	local indices = {}

	if useCount > #array then
		return {}
	end

	for index = 1, useCount do
		table.insert(indices, #array - index + 1)
	end

	return removeIndices(array, table.unpack(indices))
end

return pop
