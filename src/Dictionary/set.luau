local copy = require("./copy")

--[=[
    @within Dictionary

    Returns a new dictionary with the given key set to the given value.

    ```lua
    set({ a = 1 }, "b", 2) -- { a = 1, b = 2 }
    ```
]=]
local function set<K, V>(dictionary: { [K]: V }, key: K, value: V): { [K]: V }
	local out = copy(dictionary)
	out[key] = value

	return out
end

return set
