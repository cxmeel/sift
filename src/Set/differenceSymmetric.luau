local copy = require("./copy")

--[=[
    @within Set

    Returns a new set containing only unique values across all input sets.

    ```lua
    local set1 = { a = true, b = true, c = true }
    local set2 = { b = true, c = true, d = true }

    differenceSymmetric(set1, set2) -- { a = true, d = true }
    ```
]=]
local function differenceSymmetric<T>(...: { [T]: boolean }): { [T]: boolean }
    local args = { ... }
    local out = copy(table.remove(args, 1) :: { [T]: boolean })

    for _, other in args do
        for value in other do
            out[value] = out[value] == nil
        end
    end

    for value, keep in out do
        if not keep then
            out[value] = nil
        end
    end

    return out
end

return differenceSymmetric
