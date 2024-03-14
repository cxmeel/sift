--[=[
    @within Array

    Returns a new array with the elements in reverse order.

    ```lua
    reverse({ "a", "b", "c" }) -- { "c", "b", "a" }
    ```
]=]
local function reverse<T>(array: { T }): { T }
    local out = {}

    for index = #array, 1, -1 do
        table.insert(out, array[index])
    end

    return out
end

return reverse
