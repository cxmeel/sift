--[=[
    @within Set

    Returns a new set containing only unique values across all input sets.

    #### Aliases

    `symDiff`

    ```lua
    differenceSymmetric(Set<{ "a", "b" }>, Set<{ "b", "c" }>)
    -- Set<{ "a", "c" }>
    ```
]=]
local function differenceSymmetric<T>(...: { [T]: boolean }): { [T]: boolean }
    local out = {}

    for _, set in { ... } do
        if typeof(set) ~= "table" then
            continue
        end

        for value in set do
            out[value] = not out[value]
        end
    end

    for value in out do
        if not out[value] then
            out[value] = nil
        end
    end

    return out
end

return differenceSymmetric
