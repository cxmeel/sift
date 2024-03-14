--[=[
    @within Dictionary

    Returns the number of elements in the dictionary. If a `predicate` is provided, it will only count the elements that satisfy the predicate.

    ```lua
    local dictionary = { a = 1, b = 2, c = 3 }

    count(dictionary) -- 3
    count(dictionary, function(value)
        return value > 1
    end) -- 2
    ```
]=]
local function count<K, V>(
    dictionary: { [K]: V },
    predicate: ((value: V, key: K) -> boolean)?
): number
    local counter = 0

    for key, value in dictionary do
        if not predicate or predicate(value, key) then
            counter += 1
        end
    end

    return counter
end

return count
