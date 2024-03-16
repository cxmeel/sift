--[=[
    @within Set

    Checks whether a set is a subset of another set; i.e. whether all the elements of the subset are also elements of the superset.

    ```lua
    isSubset(Set<{ "a", "b" }>, Set<{ "a", "b", "c" }>) -- true
    ```
]=]
local function isSubset(subset: { [any]: boolean }, superset: { [any]: boolean }): boolean
    for key in subset do
        if superset[key] ~= true then
            return false
        end
    end

    return true
end

return isSubset
