local get = require("./get")

--[=[
    @within Dictionary

    Returns whether the given dictionary contains the given key.

    ```lua
    has({ a = 1, b = 2 }, "a") -- true
    ```
]=]
local function has<K, V>(dictionary: { [K]: V }, key: K, separated: string?): boolean
    return get(dictionary, key, separated) ~= nil
end

return has
