--[=[
    @within Set

    Returns a set from an array. The set will contain all the unique values from the array.

    ```lua
    fromArray({ "a", "b", "c" })
    -- { a = true, b = true, c = true }
    ```
]=]
local function fromArray<T>(array: { T }): { [T]: boolean }
    local out = {}

    for _, value in array do
        out[value] = true
    end

    return out
end

return fromArray
