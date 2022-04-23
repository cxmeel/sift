--[=[
  @function Create
  @within Array

  @param length number -- The length of the array to create.
  @param value? T -- The value to fill the array with.

  Creates an array of the given length, filled with the given value.
  This is just a wrapper around `table.create`.

  ```lua
  local array = Create(3, "Hello")

  print(array) -- { "Hello", "Hello", "Hello" }
  ```
]=]
return table.create
