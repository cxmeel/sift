local None = require("@sift/None")

--[=[
    @within Set

    Combines one or more sets into a single set.

    #### Aliases

    `join`, `union`

    ```lua
    merge(Set<{ "a", "b" }>, Set<{ "b", "c" }>)
    -- Set<{ "a", "b", "c" }>
    ```
]=]
local function merge<T>(...: { [T]: boolean }): { [T]: boolean }
    local out = {}

    for _, set in { ... } do
        if typeof(set) ~= "table" then
            continue
        end

        for value in set do
            if value ~= None then
                out[value] = true
            end
        end
    end

    return out
end

return merge
