local copy = require("./copy")

--[=[

  @within Dictionary





  Removes the given key from the given dictionary.

  ```lua
  local dictionary = { hello = "roblox", goodbye = "world" }

  local withoutHello = RemoveKey(dictionary, "hello") -- { goodbye = "world" }
  local withoutGoodbye = RemoveKey(dictionary, "goodbye") -- { hello = "roblox" }
  ```
]=]
local function removeKey<K, V>(dictionary: { [K]: V }, key: K): { [K]: V }
    local result = copy(dictionary)

    result[key] = nil

    return result
end

return removeKey
