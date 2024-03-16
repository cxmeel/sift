--[=[
    @within Set

    Returns the number of elements in a set. If a `filterer` function is provided, it will return the number of elements that satisfy the condition.

    ```lua
    local set = Set<{ 1, 2, 3, 4 }>

    count(set) -- 3
    count(set, function(value)
        return value % 2 == 0
    end) -- 2
  ```
]=]
local function count<T>(
    set: { [T]: boolean },
    filterer: ((value: T, set: { [T]: boolean }) -> boolean)?
): number
    local counter = 0

    for value in set do
        if not filterer or filterer(value, set) then
            counter += 1
        end
    end

    return counter
end

return count
