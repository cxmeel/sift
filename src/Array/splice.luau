--[=[
    @within Array

    Returns a new array with elements removed and/or added. The `at` parameter specifies the index at which to start removing or adding elements. The `replaceCount` parameter specifies the number of elements to remove. Finally, the rest of the parameters are the elements to add to the array.

    ```lua
    local array = { "a", "b", "c", "d" }

    splice(array, 2, 1, "x", "y", "z") -- { "a", "x", "y", "z", "c", "d" }
    splice(array, 2, 0, "x", "y", "z") -- { "a", "x", "y", "z", "b", "c", "d" }
    splice(array, 2, 1) -- { "a", "c", "d" }
    ```
]=]
local function splice<T>(array: { T }, at: number?, replaceCount: number?, ...: T?): { T }
	local useAt, useReplaceCount = 0, 0

	if not at or at == 0 then
		useAt = 1
	elseif at < 0 then
		useAt = at + #array + 1
	end

	if not replaceCount or replaceCount < 0 then
		useReplaceCount = 0
	end

	local out = {}

	for index = 1, useAt - 1 do
		table.insert(out, array[index])
	end

	for index = 1, select("#", ...) do
		table.insert(out, select(index, ...))
	end

	for index = useAt + useReplaceCount, #array do
		table.insert(out, array[index])
	end

	return out
end

return splice
