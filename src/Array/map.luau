local None = require("@sift/None")

--[=[
    @within Array

    Maps the array using the mapper function.

    ```lua
    map({ 1, 2, 3, 4, 5 }, function(value)
        return value * 2
    end) -- { 2, 4, 6, 8, 10 }
    ```
]=]
local function map<T, U>(array: { T }, mapper: (value: T, index: number, array: { T }) -> U?): { U }
    local out = {}

    for index, value in array do
        local mapped = mapper(value, index, array)

        if mapped == None or mapped == nil then
            continue
        end

        table.insert(out, mapped)
    end

    return out
end

return map
