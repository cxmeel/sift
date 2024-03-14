local copy = require("./copy")

--[=[
    @within Array

    Sets the value at the given index in the array and returns a new array.

    ```lua
    local array = { "a", "b", "c", "d" }

    set(array, 2, "z") -- { "a", "z", "c", "d" }
    set(array, -1, "x") -- { "a", "b", "c", "x" }
    ```
]=]
local function set<T>(array: { T }, index: number, value: T): { T }
    local out = copy(array)

    if index == 0 then
        index = 1
    elseif index < 0 then
        index += #out + 1
    end

    out[index] = value

    return out
end

return set
