--[=[
    @within Dictionary

    Returns an array of all the values in a dictionary.

    ```lua
    values({ a = 1, b = 2, c = 3 }) -- { 1, 2, 3 }
    ```
]=]
local function values<K, V>(dictionary: { [K]: V }): { V }
    local out = {}

    for _, value in dictionary do
        table.insert(out, value)
    end

    return out
end

return values
