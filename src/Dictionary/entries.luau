--[=[
    @within Dictionary

    Returns the entries in the given dictionary as an array of key-value pairs.

    ```lua
    local dictionary = { hello = "roblox", goodbye = "world" }

    local entries = Entries(dictionary) -- { { "hello", "roblox" }, { "goodbye", "world" } }
    ```
]=]
local function entries<K, V>(dictionary: { [K]: V }): { [number]: { [number]: K | V } }
    local result = {}

    for key, value in dictionary do
        table.insert(result, { key, value })
    end

    return result
end

return entries
