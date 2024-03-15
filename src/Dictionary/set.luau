local copy = require("./copy")

--[=[

  @within Dictionary






  Sets the given value in the given dictionary.

  ```lua
  local dictionary = { hello = "world", cat = "meow", unicorn = "rainbow" }

  local setCat = Set(dictionary, "cat", "woof") -- { hello = "world", cat = "woof", unicorn = "rainbow" }
  ```
]=]
local function set<K, V>(dictionary: { [K]: V }, key: K, value: V): { [K]: V }
    local result = copy(dictionary)

    result[key] = value

    return result
end

return set
