--[=[
    @within Array

    Concatenates the elements of the given arrays into a new array.

    ```lua
    local array1 = { 1, 2, 3 }
    local array2 = { 4, 5, 6 }

    concat(array1, array2) -- {1, 2, 3, 4, 5, 6}
    ```
]=]
local function concat<T>(...: { any }): { T }
    local out = {}

    for _, array in { ... } do
        for _, value in array do
            table.insert(out, value)
        end
    end

    return out
end

return concat
