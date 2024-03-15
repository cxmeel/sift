--[=[

  @within Dictionary




  Copies a dictionary recursively.

  ```lua
  local dictionary = { hello = { world = "goodbye" } }

  local new = CopyDeep(dictionary) -- { hello = { world = "goodbye" } }

  print(new == dictionary) -- false
  print(new.hello == dictionary.hello) -- false
  ```
]=]
local function copyDeep<T>(dictionary: T): T
    local new = table.clone(dictionary)

    for key, value in dictionary do
        if typeof(value) == "table" then
            new[key] = copyDeep(value)
        end
    end

    return new
end

return copyDeep
