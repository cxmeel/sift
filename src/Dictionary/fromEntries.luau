--[=[
    @within Dictionary

    Constructs a dictionary from an array of key-value pairs.

    ```lua
    fromEntries({ { "a", 1 }, { "b", 2 }, { "c", 3 } })
    -- { a = 1, b = 2, c = 3 }
    ```
]=]
local function fromEntries<K, V>(entries: { { K | V } }): { [K]: V }
	local out = {}

	for _, entry in entries do
		out[entry[1] :: K] = entry[2] :: V
	end

	return out
end

return fromEntries
