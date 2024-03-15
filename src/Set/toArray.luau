--[=[

  @within Set




  Converts a set to an array.

  ```lua
  local set = { hello = true, world = true }

  local array = ToArray(set) -- { "hello", "world" }
  ```
]=]
local function toArray<T>(set: { [T]: boolean }): { T }
    local result = {}

    for key, _ in set do
        table.insert(result, key)
    end

    return result
end

return toArray
