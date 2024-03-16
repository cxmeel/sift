--[=[
    @within Array

    Filters out elements from an array based on a filter function. The filter function should return `true` to keep the element, and `false` to remove it.

    ```lua
    filter({ 1, 2, 3, 4, 5}, function(value)
        return value > 3
    end) -- { 4, 5 }
]=]
local function filter<T>(array: { T }, filterer: (value: T, index: number) -> boolean): { T }
    local out = {}

    for index, value in array do
        if filterer(value, index) then
            table.insert(out, value)
        end
    end

    return out
end

return filter
