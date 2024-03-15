--[=[
  @within Array

  Creates an array of the given length, filled with the given value.
  This is just a wrapper around `table.create`.

  ```lua
  create(3, "Hello") -- { "Hello", "Hello", "Hello" }
  ```
]=]
return table.create
