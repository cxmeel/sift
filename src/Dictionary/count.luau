local Util = require("@sift/Util")

--[=[

  @within Dictionary





  Counts the number of items in a dictionary.

  ```lua
  local dictionary = { hello = "world", goodbye = "world" }

  local value = Count(dictionary) -- 2
  local value = Count(dictionary, function(item, key)
    return item == "world"
  end) -- 1
  ```
]=]
local function count<K, V>(
    dictionary: { [K]: V },
    predicate: ((value: V, key: K, dictionary: { [K]: V }) -> any)?
): number
    local counter = 0

    predicate = if typeof(predicate) == "function" then predicate else Util.func.truthy

    for key, value in dictionary do
        if predicate(value, key, dictionary) then
            counter += 1
        end
    end

    return counter
end

return count
