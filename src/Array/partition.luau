--[=[
    @within Array

    Filters an array into two arrays based on a filter function. The first array contains all elements that pass the filter, and the second array contains all elements that fail the filter.

    ```lua
    local even, odd = partition({ 1, 2, 3, 4, 5 }, function(value)
        return value % 2 == 0
    end)

    -- even: { 2, 4 }
    -- odd: { 1, 3, 5 }
    ```
]=]
local function partition<T>(
    array: { T },
    filterer: (value: T, index: number) -> boolean
): ({ T }, { T })
    local pass = {}
    local fail = {}

    for index, value in array do
        if filterer(value, index) then
            table.insert(pass, value)
        else
            table.insert(fail, value)
        end
    end

    return pass, fail
end

return partition
