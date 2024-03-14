local reduce = require("./reduce")

--[=[
    @within Array

    Converts an array into a set, where each value in the array is a key in the set, and the value is `true`.

    ```lua
    toSet({ "a", "b", "c", "a", "a", "d" })
    -- { a = true, b = true, c = true, d = true }
    ```
]=]
local function toSet<T>(array: { T }): { [T]: boolean }
    return reduce(array, function(set, value)
        set[value] = true
        return set
    end, {})
end

return toSet
