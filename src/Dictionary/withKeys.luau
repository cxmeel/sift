--[=[
    @within Dictionary

    Returns a new dictionary with only the specified keys.

    ```lua
    local dict = { a = 1, b = 2, c = 3 }
    withKeys(dict, "a", "c") -- { a = 1, c = 3 }
    ```
]=]
local function withKeys<K, V>(dictionary: { [K]: V }, ...: K): { [K]: V }
	local out = {}

	for _, key in { ... } do
		out[key] = dictionary[key]
	end

	return out
end

return withKeys
