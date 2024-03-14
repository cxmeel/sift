--[=[
    @within Dictionary

    Returns an array of key-value pairs from a dictionary.

    ```lua
    entries({ a = 1, b = 2, c = 3 })
    -- { { "a", 1 }, { "b", 2 }, { "c", 3 } }
    ```
]=]
local function entries<K, V>(dictionary: { [K]: V }): { { K | V } }
    local out = {}

    for key, value in dictionary do
        table.insert(out, { key, value :: any })
    end

    return out
end

return entries
