local copy = require("./copy")

--[=[
    @within Set

    Adds values to a set.

    ```lua
    add(Set<{ "a" }>, "b", "c") -- Set<{ "a", "b", "c" }>
    ```
]=]
local function add<T>(set: { [T]: boolean }, ...: T): { [T]: boolean }
    local out = copy(set)

    for _, value in { ... } do
        out[value] = true
    end

    return out
end

return add
