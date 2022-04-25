--!strict
local copy = require(script.Parent.Copy)

--[=[
  @function Clear
  @within Array

  @param array {T} -- The array to clear.
  @return {T} -- The cleared array.

  Clears the contents of an array (sets all values
  back to `nil`).

  ```lua
  local array = { 1, 2, 3 }

  local new = Clear(array) -- {}
  ```
]=]
return function(array)
	local new = copy(array)

	table.clear(new)

	return new
end
