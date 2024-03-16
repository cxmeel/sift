local partition = require("./partition")

--[=[
    @within Set

    Returns two sets; one with the specified elements removed, and one containing only the removed elements.

    #### Aliases

    `subtract`

    ```lua
    delete(Set<{ "a", "b", "c" }>, "a", "c")
    -- Set<{ "b" }>, Set<{ "a", "c" }>
    ```
]=]
local function delete<T>(set: { [T]: boolean }, ...: T): ({ [T]: boolean }, { [T]: boolean })
    local values = { ... }

    return partition(set, function(value)
        return not table.find(values, value)
    end)
end

return delete
