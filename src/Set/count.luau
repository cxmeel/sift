local Util = require("@sift/Util")

--[=[

  @within Set





  Counts the number of items in a set.

  ```lua
  local set = { hello = true, world = true }

  local count = Count(set) -- 2
  local count = Count(set, function(item)
    return item == "hello"
  end) -- 1
  ```
]=]
local function count<T>(
    set: { [T]: boolean },
    predicate: ((item: T, set: { [T]: boolean }) -> boolean?)?
): number
    local counter = 0

    predicate = if typeof(predicate) == "function" then predicate else Util.func.truthy

    for item, _ in set do
        if predicate(item, set) then
            counter += 1
        end
    end

    return counter
end

return count
