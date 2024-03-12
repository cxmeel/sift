--[=[
    @within Set

    Returns a new set containing values that appear in all of the input sets.

    ```lua
    local set1 = { a = true, b = true, c = true }
    local set2 = { b = true, c = true, d = true }

    intersection(set1, set2) -- { b = true, c = true }
    ```
]=]
local function intersection<T>(set: { [T]: boolean }, ...: { [T]: boolean }): { [T]: boolean }
	local out = {}

	for value in set do
		local intersects = true

		for _, other in { ... } do
			if not other[value] then
				intersects = false
				break
			end
		end

		if intersects then
			out[value] = true
		end
	end

	return out
end

return intersection
