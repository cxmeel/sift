--[=[
    @within Set

    Returns a new set containing only the elements that satisfy the given filter function.

    ```lua
    filter(Set<{ 1, 2, 3, 4 }>, function(value)
        return value % 2 == 0
    end) -- Set<{ 2, 4 }>
    ```
]=]
local function filter<T>(
    set: { [T]: boolean },
    filterer: (value: T, set: { [T]: boolean }) -> boolean
): { [T]: boolean }
    local out = {}

    for value in set do
        if not filterer or filterer(value, set) then
            out[value] = true
        end
    end

    return out
end

return filter
