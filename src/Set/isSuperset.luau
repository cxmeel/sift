local isSubset = require("./isSubset")

--[=[
    @within Set

    Checks whether a set is a superset of another set; i.e. whether all elements of the subset are also elements of the superset.

    ```lua
    isSuperset(Set<{ "a", "b", "c" }>, Set<{ "a", "b" }>) -- true
    ```
]=]
local function isSuperset<T>(superset: { [T]: boolean }, subset: { [T]: boolean }): boolean
    return isSubset(subset, superset)
end

return isSuperset
