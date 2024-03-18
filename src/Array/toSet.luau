local reduce = require("./reduce")

--[=[
    @within Array

    Converts an array to a set.

    ```lua
    toSet({ "a", "b", "b", "c" }) -- Set<{ "a", "b", "c" }>
    ```
]=]
local function toSet<T>(array: { T }): { [T]: boolean }
    return reduce(array, function(set, value)
        set[value] = true
        return set
    end, {})
end

return toSet
