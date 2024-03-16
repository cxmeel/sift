--[=[
    @within Array

    Flattens an array of arrays into a single array. The `depth` parameter specifies the depth of the flattening. If `depth` is not specified, the array is flattened infinitely.

    ```lua
    local array = {
        { "a", { 1, 2 } },
        { "b", { 3, 4 } },
    }

    flatten(array) -- { "a", 1, 2, "b", 3, 4 }
    flatten(array, 1) -- { "a", { 1, 2 }, "b", { 3, 4 } }
    ```
]=]
local function flatten<T>(array: { T }, depth: number?): { T }
    local out = {}

    for _, value in array do
        if typeof(value) == "table" and (not depth or depth > 0) then
            local nested = flatten(value, depth and depth - 1)

            for _, nestedValue in nested do
                table.insert(out, nestedValue)
            end

            continue
        end

        table.insert(out, value)
    end

    return out
end

return flatten
