--[=[
  @within Array

  Checks if the given object is an array. Empty tables are not considered arrays, as they could later be used as objects.

  ```lua
  is({1, 2, 3}) -- true
  is({a = 1, b = 2}) -- false
  is({}) -- false
  is("hello") -- false
  ```
]=]
local function is(object: any): boolean
    return typeof(object) == "table" and #object > 0 and next(object, #object) == nil
end

return is
