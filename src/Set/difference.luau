local copy = require("./copy")

--[=[
    @within Set

    Returns a new set containing only values that are in the first set and not in any of the other sets.

    ```lua
    local set1 = { a = true, b = true, c = true }
    local set2 = { b = true, c = true, d = true }

    difference(set1, set2) -- { a = true }
    ```
]=]
local function difference<T>(...: { [T]: boolean }): { [T]: boolean }
    local args = { ... }
    local out = copy(table.remove(args, 1) :: { [T]: boolean })

    for _, other in args do
        for value in other do
            out[value] = nil
        end
    end

    return out
end

return difference
