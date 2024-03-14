--[=[
    @within Array

    Recursively freezes an array and its nested arrays. Using [Array.freeze] will only freeze the top level of the array, leaving nested arrays mutable.

    ```lua
    local frozen = freezeDeep({ 1, 2, { 3, 4, { 5, 6 }}})

    frozen[1] = 2 -- error!
    frozen[3][1] = 4 -- error!
]=]
local function freezeDeep<T>(array: { T }): { T }
    local out: { T } = {}

    for _, value in array do
        if typeof(value) == "table" then
            local nested: any = freezeDeep(value)
            table.insert(out, nested)

            continue
        end

        table.insert(out, value)
    end

    return table.freeze(out)
end

return freezeDeep
