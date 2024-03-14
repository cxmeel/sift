--[=[
    @within Set

    Converts a set to an array.

    ```lua
    local set = { a = true, b = true, c = true }
    toArray(set) -- { "a", "b", "c" }
    ```
]=]
local function toArray<T>(set: { [T]: boolean }): { T }
    local out = {}

    for value in set do
        table.insert(out, value)
    end

    return out
end

return toArray
