--[=[
    @within Dictionary

    Returns a new dictionary with only the specified keys.

    ```lua
    local dict = { a = 1, b = 2, c = 3 }
    pick(dict, "a", "c") -- { a = 1, c = 3 }
    ```
]=]
local function pick<K, V>(dictionary: { [K]: V }, ...: K): { [K]: V }
    local out = {}

    for _, key in { ... } do
        out[key] = dictionary[key]
    end

    return out
end

return pick
