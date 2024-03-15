--[=[

  @within Dictionary




  Copies a dictionary.

  ```lua
  local dictionary = { hello = "world" }

  local new = Copy(dictionary) -- { hello = "world" }

  print(new == dictionary) -- false
  print(new.hello == dictionary.hello) -- true
  ```
]=]
return table.clone
