--[=[
    @within Dictionary

    Constructs a dictionary from two arrays, one containing the keys and the other containing the values.

    ```lua
    local keys = { "a", "b", "c" }
    local values = { 1, 2, 3 }

    fromArrays(keys, values) -- { a = 1, b = 2, c = 3 }
    ```
]=]
local function fromArrays<K, V>(keys: { K }, values: { V }): { [K]: V }
	local out = {}

	for index, key in keys do
		out[key] = values[index]
	end

	return out
end

return fromArrays
