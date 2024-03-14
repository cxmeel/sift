--[=[
    @within Set

    Returns whether or not the first set is a subset of the second set.

    ```lua
    local superset = { a = true, b = true, c = true }
    local subset = { a = true, b = true }

    isSubset(subset, superset) -- true
    ```
]=]
local function isSubset<T>(subset: { [T]: boolean }, superset: { [T]: boolean }): boolean
    for value in subset do
        if not superset[value] then
            return false
        end
    end

    return true
end

return isSubset
