--[=[
    @within Dictionary

    Gets the keys of the given dictionary as an array.

    ```lua
    local dictionary = { hello = "roblox", goodbye = "world" }

    local keys = Keys(dictionary) -- { "hello", "goodbye" }
    ```
]=]
local function keys<K, V>(dictionary: { [K]: V }): { K }
    local result = {}

    for key in dictionary do
        table.insert(result, key)
    end

    return result
end

return keys
