--[=[
    @within Array

    Returns `true` if at least one element in the array satisfies the provided testing function. Otherwise, `false` is returned.

    ```lua
    some({ 1, 2, 3, 4, 5 }, function(value)
        return value % 2 == 0
    end) -- true
    ```
]=]
local function some<T>(
    array: { T },
    predicate: (value: T, index: number, array: { T }) -> boolean
): boolean
    for index, value in array do
        if predicate(value, index, array) then
            return true
        end
    end

    return false
end

return some
