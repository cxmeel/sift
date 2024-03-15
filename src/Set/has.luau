--[=[

  @within Set





  Checks whether a value is in a set.

  ```lua
  local set = { hello = true }

  local has = Has(set, "hello") -- true
  ```
]=]
local function has<T>(set: { [T]: boolean }, value: any): boolean
    return set[value] == true
end

return has
