--[=[
    @within Set

    Converts an array to a set.

    #### Aliases

    `fromList`

    ```lua
    fromArray({ "a", "b", "c" }) -- Set<{ "a", "b", "c" }>
    ```
]=]
local function fromArray<T>(array: { T }): { [T]: boolean }
    local out = {}

    for _, value in array do
        out[value] = true
    end

    return out
end

return fromArray
