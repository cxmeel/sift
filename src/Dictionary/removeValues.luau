local filter = require("./filter")

--[=[
    @within Dictionary

    Returns a new dictionary with all specified values removed.

    ```lua
    removeValues({ a = 2, b = 1, c = 3, d = 2 }, 1, 2)
    -- { c = 3 }
    ```
]=]
local function removeValues<K, V>(dictionary: { [K]: V }, ...: V): { [K]: V }
    local values = { ... }

    return filter(dictionary, function(value)
        return table.find(values, value) == nil
    end)
end

return removeValues
