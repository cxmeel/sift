--[=[
    @within Dictionary

    Returns `true` if at least one value in the dictionary passes the test implemented by the provided function.

    ```lua
    some({ a = 1, b = 2, c = 3 }, function(value)
        return value > 2
    end) -- true
    ```
]=]
local function some<K, V>(dictionary: { [K]: V }, predicate: (value: V, key: K) -> boolean): boolean
    for key, value in dictionary do
        if predicate(value, key) then
            return true
        end
    end

    return false
end

return some
