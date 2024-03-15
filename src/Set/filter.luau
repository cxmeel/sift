local Util = require("@sift/Util")

--[=[

  @within Set





  Filters a set using a predicate. Any items that do not pass the predicate will be removed from the set.

  ```lua
  local set = { hello = true, world = true }

  local newSet = Filter(set, function(value)
    return value ~= "hello"
  end) -- { world = true }
  ```
]=]
local function filter<T>(
    set: { [T]: boolean },
    predicate: ((T, { [T]: boolean }) -> any)?
): { [T]: boolean }
    local result = {}

    predicate = if typeof(predicate) == "function" then predicate else Util.func.truthy

    for key, _ in set do
        if predicate(key, set) then
            result[key] = true
        end
    end

    return result
end

return filter
