local Util = require("@sift/Util")

--[=[
    @within Array

    Returns a new array with elements removed and/or added. The `at` parameter specifies the index at which to start removing or adding elements. The `replaceCount` parameter specifies the number of elements to remove. Finally, the rest of the parameters are the elements to add to the array.

    ```lua
    local array = { "a", "b", "c", "d" }

    splice(array, 2, 1, "x", "y", "z")
    -- { "a", "x", "y", "z", "c", "d" }

    splice(array, 2, 0, "x", "y", "z")
    -- { "a", "x", "y", "z", "b", "c", "d" }

    splice(array, 2, 1) -- { "a", "c", "d" }
    ```
]=]
local function splice<T>(array: { T }, at: number?, deleteCount: number?, ...: T): { T }
    local useAt = Util.resolveIndex(#array, at)
    local useDeleteCount = 0

    if not deleteCount or deleteCount < 0 then
        useDeleteCount = 0
    else
        useDeleteCount = math.min(deleteCount, #array - useAt + 1)
    end

    local out = {}

    for index = 1, useAt - 1 do
        table.insert(out, array[index])
    end

    for _, value in { ... } do
        table.insert(out, value)
    end

    for index = useAt + useDeleteCount, #array do
        table.insert(out, array[index])
    end

    return out
end

return splice
