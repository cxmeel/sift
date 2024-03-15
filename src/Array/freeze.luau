local copy = require("./copy")

--[=[
  @within Array

  Freezes the top level of the array, making it read-only.

  ```lua
  local frozen = Freeze({ 1, 2, 3 })

  frozen[1] = 2 -- error!
  table.insert(frozen, 4) -- error!
  ```
]=]
local function freeze<T>(array: { T }): { T }
    local new = copy(array)
    table.freeze(new)

    return new
end

return freeze
