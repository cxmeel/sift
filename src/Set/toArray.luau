local None = require("@sift/None")

--[=[
    @within Set

    Converts a set to an array.

    ```lua
    toArray(Set<{ "a", "b", "c" }>) -- { "a", "b", "c" }
    ```
]=]
local function toArray<T>(set: { [T]: boolean }): { T }
    local out = {}

    for value in set do
        if value ~= None then
            table.insert(out, value)
        end
    end

    return out
end

return toArray
