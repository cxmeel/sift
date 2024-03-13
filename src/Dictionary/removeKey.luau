local removeKeys = require("./removeKeys")

--[=[
    @within Dictionary

    Returns a new dictionary with the specified key removed.

    ```lua
    removeKey({ a = 1, b = 2, c = 3 }, "b")
    -- { a = 1, c = 3 }
    ```
]=]
local function removeKey<K, V>(dictionary: { [K]: V }, key: K): { [K]: V }
	return removeKeys(dictionary, key)
end

return removeKey
