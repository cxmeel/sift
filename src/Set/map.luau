local None = require("@sift/None")

--[=[
    @within Set

    Iterates over a set, calling a mapper function for each item.

    ```lua
    map(Set<{ 1, 2, 3, 4, 5 }>, function(value)
        return value * 2
    end) -- Set<{ 2, 4, 6, 8, 10 }>
    ```
]=]
local function map<T, U>(
    set: { [T]: boolean },
    mapper: (value: T, set: { [T]: boolean }) -> U
): { [U]: boolean }
    local out = {}

    for value in set do
        local mapped = mapper(value, set)

        if mapped == nil or mapped == None then
            continue
        end

        out[mapped] = true
    end

    return out
end

return map
