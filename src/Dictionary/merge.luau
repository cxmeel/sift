local None = require("@sift/None")

--[=[
  @within Dictionary

  Merges the given dictionaries into a single dictionary. If the
  value is `None`, it will be removed from the result. The
  parameters may be any number of dictionaries or `nil`.
  Non-dictonaries will be ignored.

  Aliases: `join`

  ```lua
  local dictionary1 = { hello = "roblox", goodbye = "world" }
  local dictionary2 = { goodbye = "goodbye" }

  merge(dictionary1, dictionary2)
  -- { hello = "roblox", goodbye = "goodbye" }
  ```
]=]
local function merge<K, V>(...: { [any]: any }): { [K]: V }
    local out = {}

    for _, dictionary in { ... } do
        if typeof(dictionary) ~= "table" then
            continue
        end

        for key, value in dictionary do
            if value == nil or value == None then
                continue
            end

            out[key] = value
        end
    end

    return out
end

return merge
