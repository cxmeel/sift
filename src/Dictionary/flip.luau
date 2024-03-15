--[=[

  @within Dictionary




  Flips a dictionary. Keys become values and values become keys.

  ```lua
  local dictionary = { hello = "roblox", goodbye = "world" }

  local new = Flip(dictionary) -- { world = "goodbye", roblox = "hello" }
  ```
]=]
local function flip<K, V>(dictionary: { [K]: V }): { [V]: K }
    local result = {}

    for key, value in dictionary do
        result[value] = key
    end

    return result
end

return flip
