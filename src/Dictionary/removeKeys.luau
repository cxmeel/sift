local copy = require("./copy")

--[=[

  @within Dictionary





  Removes the given keys from the given dictionary.

  ```lua
  local dictionary = { hello = "world", cat = "meow", dog = "woof", unicorn = "rainbow" }

  local withoutCatDog = RemoveKeys(dictionary, "cat", "dog") -- { hello = "world", unicorn = "rainbow" }
  ```
]=]
local function removeKeys<K, V>(dictionary: { [K]: V }, ...: K): { [K]: V }
    local result = copy(dictionary)

    for _, key in { ... } do
        result[key] = nil
    end

    return result
end

return removeKeys
