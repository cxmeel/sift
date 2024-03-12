local None = require("@Sift/None")

--[=[
    @within Set

    Combines multiple sets into a single set.

    ```lua
    local set1 = { a = true, b = true }
    local set2 = { b = true, c = true }

    merge(set1, set2) -- { a = true, b = true, c = true }
    ```
]=]
local function merge<T>(...: { [T]: boolean }): { [T]: boolean }
	local out = {}

	for _, set in { ... } do
		for value in set do
			if value ~= None then
				out[value] = true
			end
		end
	end

	return out
end

return merge
