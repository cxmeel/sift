local filter = require("./filter")

--[=[
    @within Dictionary

    Returns a new dictionary with the specified keys removed.

    ```lua
    removeKeys({ a = 1, b = 2, c = 3 }, "a", "c")
    -- { b = 2 }
    ```
]=]
local function removeKeys<K, V>(dictionary: { [K]: V }, ...: K): { [K]: V }
	local keys = { ... }

	return filter(dictionary, function(_, key)
		return table.find(keys, key) == nil
	end)
end

return removeKeys
