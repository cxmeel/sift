--[=[
    @within Array

    Returns the index of the first occurrence of a value in an array, or `nil` if the value is not found. The search starts at the optional `from` index. If `from` is negative, it is treated as an offset from the end of the array.

    ```lua
    local array = { "a", "b", "c", "a", "b" }

    find(array, "a") -- 1
    find(array, "a", 2) -- 4
    find(array, "b", -2) -- 5
    ```
]=]
local function find<T>(array: { T }, value: T, from: number?): number?
    if from == 0 then
        from = 1
    elseif from and from < 0 then
        from += #array + 1
    end

    return table.find(array, value, from)
end

return find
