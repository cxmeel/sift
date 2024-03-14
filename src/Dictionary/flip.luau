--[=[
    @within Dictionary

    Returns a new dictionary with the keys and values of the input dictionary swapped.

    ```lua
    local dictionary = { a = "apple", b = "banana" }
    flip(dictionary) -- { apple = "a", banana = "b" }
    ```
]=]
local function flip<K, V>(dictionary: { [K]: V }): { [V]: K }
    local out = {}

    for key, value in dictionary do
        out[value] = key
    end

    return out
end

return flip
