--[=[
    @within Array

    Pick out a value from an array by index, with support for negative indices.
    Negative indices are counted from the end of the array. Because Lua uses 1-based indexing, an index of 0 will be treated as 1.

    ```lua
    at({ "a", "b", "c", "d", "e" }, 2) -- "b"
    at({ "a", "b", "c", "d", "e" }, -1) -- "e"
    ```
]=]
local function at<T>(array: { T }, index: number): T
    if index == 0 then
        index = 1
    elseif index < 0 then
        index += #array + 1
    end

    return array[index]
end

return at
