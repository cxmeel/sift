--[=[

  @within Dictionary





  Checks whether or not the predicate returned true for any value in the dictionary.

  ```lua
  local dictionary = { hello = "world", cat = "meow", unicorn = "rainbow" }

  local hasMeow = Some(dictionary, function(value)
    return value == "meow"
  end) -- true

  local hasDog = Some(dictionary, function(_, key)
    return key == "dog"
  end) -- false
  ```
]=]
local function some<K, V>(
    dictionary: { [K]: V },
    predicate: (value: V, key: V, dictionary: { [K]: V }) -> any
): boolean
    for key, value in dictionary do
        if predicate(value, key, dictionary) then
            return true
        end
    end

    return false
end

return some
