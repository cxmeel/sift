local INF = newproxy()

--[=[
    @within Array

    Flattens an array of arrays into a single array. The `depth` parameter specifies the depth of the flattening. If `depth` is not specified, the array is flattened as much as possible.

    ```lua
    local array = { 1, { 2, 3, { 4, 5 }}, 6 }

    flatten(array) -- { 1, 2, 3, 4, 5, 6 }
    flatten(array, 1) -- { 1, 2, 3, { 4, 5 }, 6 }
    ```
]=]
local function flatten<T>(array: { T }, depth: number?): { T }
	local withDepth = depth or INF
	local out = {}

	for _, value in array do
		if typeof(value) == "table" and (withDepth == INF or withDepth > 0) then
			local useDepth = withDepth == INF and INF or withDepth - 1
			local nested = flatten(value, useDepth)

			for _, nestedValue in nested do
				table.insert(out, nestedValue)
			end

			continue
		end

		table.insert(out, value)
	end

	return out
end

return flatten
