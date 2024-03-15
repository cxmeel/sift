--[=[
	@within Array

	Flattens an array. If depth is not specified, it will flatten
	the array infinitely.

	```lua
	local array = {
		{ 1, 2, 3 },
		{ 4, 5, 6 },
		{ 7, { 8, 9 } },
	}

	flatten(array) -- { 1, 2, 3, 4, 5, 6, 7, 8, 9 }
	flatten(array, 1) -- { 1, 2, 3, 4, 5, 6, 7, { 8, 9 } }
	```
]=]
local function flatten<T>(array: { T }, depth: number?): { T }
    depth = if typeof(depth) == "number" then depth else math.huge

    local result = {}

    for _, value in array do
        if typeof(value) == "table" and depth > 0 then
            local nested = flatten(value, depth - 1)

            for _, nestedValue in nested do
                table.insert(result, nestedValue)
            end
        else
            table.insert(result, value)
        end
    end

    return result
end

return flatten
