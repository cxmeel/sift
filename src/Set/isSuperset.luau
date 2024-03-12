local isSubset = require("./isSubset")

--[=[
    @within Set

    Returns whether or not the first set is the superset of the second set.

    ```lua
    local superset = { a = true, b = true, c = true }
    local subset = { a = true, b = true }

    isSuperset(superset, subset) -- true
    ```
]=]
local function isSuperset<T>(superset: { [T]: boolean }, subset: { [T]: boolean }): boolean
	return isSubset(subset, superset)
end

return isSuperset
