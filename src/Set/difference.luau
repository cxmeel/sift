local copy = require("./copy")

--[=[
    @within Set

    Returns a new set containing only values that are unique to the first set.

    #### Aliases

    `diff`

    ```lua
    difference(Set<{ "a", "b" }>, Set<{ "b", "c" }>)
    -- Set<{ "a" }>
    ```
]=]
local function difference<T>(...: { [T]: boolean }): { [T]: boolean }
    local out: { [T]: boolean } = nil

    for _, set in { ... } do
        if typeof(set) ~= "table" then
            continue
        end

        if out == nil then
            out = copy(set)
            continue
        end

        for value in set do
            out[value] = nil
        end
    end

    return out
end

return difference
