--[=[

  @within Set





  Deletes values from a set.

  Aliases: `subtract`

  ```lua
  local set = { hello = true, world = true }

  local newSet = Delete(set, "hello") -- { world = true }
  ```
]=]
local function delete<T>(set: { [T]: boolean }, ...: T): { [T]: boolean }
    local result = {}

    for key, _ in set do
        result[key] = true
    end

    for _, value in { ... } do
        result[value] = nil
    end

    return result
end

return delete
