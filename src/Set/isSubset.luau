--[=[

  @within Set





  Checks whether a set is a subset of another set.

  ```lua
  local set = { hello = true, world = true }
  local subset = { hello = true }

  local isSubset = IsSubset(subset, set) -- true
  ```
]=]
local function isSubset(subset: { [any]: boolean }, superset: { [any]: boolean }): boolean
    for key, value in subset do
        if superset[key] ~= value then
            return false
        end
    end

    return true
end

return isSubset
