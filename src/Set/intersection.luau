--[=[
    @within Set

    Returns a new set containing only the elements that appear in all of the input sets.

    ```lua
    intersection(Set<{ "a", "b" }>, Set<{ "b", "c" }>)
    -- Set<{ "b" }>
    ```
]=]
local function intersection<T>(...: { [T]: boolean }): { [T]: boolean }
    local args = { ... }
    local first = table.remove(args, 1) :: { [T]: boolean }

    local out = {}

    for key in first do
        local intersects = true

        for _, set in args do
            if not set[key] then
                intersects = false
                break
            end
        end

        if intersects then
            out[key] = true
        end
    end

    return out
end

return intersection
