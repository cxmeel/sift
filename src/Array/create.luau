--[=[

  @within Array



  

  Creates an array of the given length, filled with the given value.
  This is just a wrapper around `table.create`.

  ```lua
  local array = Create(3, "Hello")

  print(array) -- { "Hello", "Hello", "Hello" }
  ```
]=]
return table.create
