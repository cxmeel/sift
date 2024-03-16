--[=[
    @within Set

    Returns two sets, one containing the values for which the `filterer` function returns `true`, and the other containing the values for which the `filterer` function returns `false`.

    ```lua
    partition(Set<{ 1, 2, 3, 4, 5 }>, function(value)
        return value % 2 == 0
    end) -- Set<{ 2, 4 }>, Set<{ 1, 3, 5 }>
    ```
]=]
local function partition<T>(
    set: { [T]: boolean },
    filterer: (value: T, set: { [T]: boolean }) -> boolean
): ({ [T]: boolean }, { [T]: boolean })
    local pass, fail = {}, {}

    for value in set do
        if filterer(value, set) then
            pass[value] = true
        else
            fail[value] = true
        end
    end

    return pass, fail
end

return partition
