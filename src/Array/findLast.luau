local Util = require("@sift/Util")

--[=[
    @within Array

    Searches the array backwards and returns the index of the last occurrence of `value`, or `nil` if not found. If `startAt` is provided, the search will start at that index.

    #### Aliases

    `lastIndexOf`

    ```lua
    findLast({ "a", "b", "c", "b", "d" }, "b") -- 4
    ```
]=]
local function findLast<T>(array: { T }, value: any?, startAt: number?): number?
    for index = Util.resolveIndex(#array, startAt or -1), 1, -1 do
        if array[index] == value then
            return index
        end
    end

    return nil
end

return findLast
