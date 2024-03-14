--[=[
    @within Dictionary

    Returns `true` if all values in the dictionary pass the test implemented by the provided function.

    ```lua
    every({ a = 1, b = 3, c = 5 }, function(value)
        return value % 2 == 0
    }) -- false
    ```
]=]
local function every<K, V>(dictionary: { [K]: V }, predicate: (value: V, key: K) -> boolean): boolean
    for key, value in dictionary do
        if not predicate(value, key) then
            return false
        end
    end

    return true
end

return every
