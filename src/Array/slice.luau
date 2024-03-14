--[=[
    @within Array

    Returns a slice of an array from `from` to `to` (inclusive). `from` and `to` can be negative, in which case they will be treated as an offset from the end of the array.

    ```lua
    local array = { "a", "b", "c", "d", "e", "f" }

    slice(array, 2, 4) -- { "b", "c", "d" }
    slice(array, 2, -2) -- { "b", "c", "d", "e" }
    ```
]=]
local function slice<T>(array: { T }, from: number?, to: number?): { T }
    if not from or from == 0 then
        from = 1
    elseif from < 0 then
        from += #array + 1
    end

    if not to or to == 0 then
        to = #array
    elseif to < 0 then
        to += #array + 1
    end

    if from == to then
        return {}
    end

    local out = {}

    for index = from :: number, to :: number do
        table.insert(out, array[index])
    end

    return out
end

return slice
