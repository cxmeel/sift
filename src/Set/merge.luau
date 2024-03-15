--[=[
  @within Set

  Combines one or more sets into a single set.

  Aliases: `join`, `union`

  ```lua
  local set1 = Set<{ "hello", "world" }>
  local set2 = Set<{ "cat", "dog", "hello" }>

  merge(set1, set2) -- Set<{ "hello", "world", "cat", "dog" }>
  ```
]=]
local function merge<T>(...: { [T]: boolean }): { [T]: boolean }
    local result = {}

    for _, set in { ... } do
        if typeof(set) ~= "table" then
            continue
        end

        for key in set do
            result[key] = true
        end
    end

    return result
end

return merge
