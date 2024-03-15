local isSubset = require("./isSubset")

--[=[

  @within Set





  Checks whether a set is a superset of another set.

  ```lua
  local set = { hello = true, world = true }
  local subset = { hello = true }

  local isSuperset = IsSuperset(set, subset) -- true
  ```
]=]
local function isSuperset<any>(superset: { [any]: boolean }, subset: { [any]: boolean }): boolean
    return isSubset(subset, superset)
end

return isSuperset
