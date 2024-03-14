--[=[
    @within Dictionary

    Returns an array of all the keys in a dictionary.

    ```lua
    keys({ a = 1, b = 2, c = 3 }) -- { "a", "b", "c" }
    ```
]=]
local function keys<K, V>(dictionary: { [K]: V }): { K }
    local out = {}

    for key in dictionary do
        table.insert(out, key)
    end

    return out
end

return keys
