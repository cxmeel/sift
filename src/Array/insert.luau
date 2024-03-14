local copy = require("./copy")

--[=[
    @within Array

    Inserts the given values into the array at the specified index.

    ```lua
    local array = { "a", "b", "c" }

    insert(array, 2, "x", "y") -- { "a", "x", "y", "b", "c" }
    insert(array, -1, "x", "y") -- { "a", "b", "x", "y", "c" }
    ```
]=]
local function insert<T>(array: { T }, index: number, ...: T): { T }
    if index == 0 then
        index = 1
    elseif index < 0 then
        index += #array + 1
    end

    local out = copy(array)

    for i = 1, select("#", ...) do
        table.insert(out, index + i - 1, select(i, ...))
    end

    return out
end

return insert
