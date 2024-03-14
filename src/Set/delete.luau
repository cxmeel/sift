local filter = require("./filter")

--[=[
    @within Set

    Returns a new set with the given value removed.

    ```lua
    local set = { a = true, b = true, c = true }
    delete(set, "b", "c") -- { a = true }
    ```
]=]
local function delete<T>(set: { [T]: boolean }, ...: T): { [T]: boolean }
    local values = { ... }

    return filter(set, function(value: T): boolean
        return table.find(values, value) == nil
    end)
end

return delete
