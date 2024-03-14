--[=[
    @within Dictionary

    Returns whether the given dictionary contains the given key.

    ```lua
    has({ a = 1, b = 2 }, "a") -- true
    ```
]=]
local function has<K, V>(dictionary: { [K]: V }, key: K): boolean
    return dictionary[key] ~= nil
end

return has
