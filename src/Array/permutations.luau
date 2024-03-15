local copy = require("./copy")

--[=[
    @within Array

    Returns a table of all permutations of the input array.

    ```lua
    permutations({ 1, 2, 3 }) --[[
        {
            { 1, 2, 3 },
            { 2, 1, 3 },
            { 3, 1, 2 },
            { 1, 3, 2 },
            { 2, 3, 1 },
            { 3, 2, 1 }
        }
    ]]
    ```
]=]
local function permutations<T>(array: { T }): { { T } }
    local out: { { T } } = {}

    local function permute(arr, n)
        if n == 0 then
            table.insert(out, copy(arr))
            return
        end

        for i = 1, n do
            arr[n], arr[i] = arr[i], arr[n]
            permute(arr, n - 1)
            arr[n], arr[i] = arr[i], arr[n]
        end
    end

    permute(array, #array)

    return out
end

return permutations
