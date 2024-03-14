--[=[
    @within Array

    Returns the cartesian product of two arrays. The cartesian product is a set of all possible combinations of elements from two arrays.

    ```lua
    local array1 = { 1, 2 }
    local array2 = { "a", "b" }

    cartesian(array1, array2)
    -- { { 1, "a" }, { 1, "b" }, { 2, "a" }, { 2, "b" } }
    ```
]=]
local function cartesian<T, U>(array: { T }, other: { U }): { { T | U } }
    local out = {}

    for i = 1, #array do
        for j = 1, #other do
            table.insert(out, { array[i], other[j] :: any })
        end
    end

    return out
end

return cartesian
