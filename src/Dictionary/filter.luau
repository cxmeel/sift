local Util = require("@sift/Util")

--[=[

  @within Dictionary





  Filters a dictionary using a predicate. Any items that do not pass the predicate will be removed from the dictionary.

  ```lua
  local dictionary = { hello = "world", goodbye = "goodbye" }

  local result = Filter(dictionary, function(value, key)
    return value == "world"
  end) -- { hello = "world" }
  ```
]=]
local function filter<K, V>(
    dictionary: { [K]: V },
    predicate: ((value: V, key: K, dictionary: { [K]: V }) -> any)?
): { [K]: V }
    local result = {}

    predicate = if typeof(predicate) == "function" then predicate else Util.func.truthy

    for key, value in dictionary do
        if predicate(value, key, dictionary) then
            result[key] = value
        end
    end

    return result
end

return filter
