--[=[

  @within Set





  Adds values to a set.

  ```lua
  local set = { hello = true }

  local newSet = Add(set, "world") -- { hello = true, world = true }
  ```
]=]
local function add<T>(set: { [T]: boolean }, ...: T): { [T]: boolean }
    local result = {}

    for key, _ in set do
        result[key] = true
    end

    for _, value in { ... } do
        result[value] = true
    end

    return result
end

return add
