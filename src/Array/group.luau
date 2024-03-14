--[=[
    @within Array

    Groups the elements of an array into a dictionary, based on the result of the grouper function.

    ```lua
    group({ 1, 2, 3, 4, 5, 6 }, function(value)
        return value % 2 == 0 and "even" or "odd"
    end) -- { even = { 2, 4, 6 }, odd = { 1, 3, 5 } }
    ```
]=]
local function group<T, K>(array: { T }, grouper: (value: T, index: number) -> K): { [K]: { T } }
    local out = {}

    for index, value in array do
        local key = grouper(value, index)

        if out[key] == nil then
            out[key] = {}
        end

        table.insert(out[key], value)
    end

    return out
end

return group
