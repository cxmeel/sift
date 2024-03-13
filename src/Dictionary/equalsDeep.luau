local Util = require("@Sift/Util")

local function compareDeep(a, b)
	if typeof(a) ~= "table" or typeof(b) ~= "table" then
		return a == b
	end

	for key, value in a do
		if not compareDeep(value, b[key]) then
			return false
		end
	end

	for key, value in b do
		if not compareDeep(value, a[key]) then
			return false
		end
	end

	return true
end

--[=[
  @within Dictionary

  Performs a deep comparison of two or more dictionaries. This function will return `true` if all dictionaries are equal.

  ```lua
  local dictionary1 = { a = "foo", b = { c = "bar" } }
  local dictionary2 = { a = "foo", b = { c = "bar" } }
  local dictionary3 = { a = "foo", c = "baz" }

  equalsDeep(dictionary1, dictionary2) -- true
  equalsDeep(dictionary1, dictionary2, dictionary3) -- false
  ```
]=]
local function equalsDeep(...: { [any]: any }): boolean
	if Util.areEqual(...) then
		return true
	end

	local args = { ... }
	local first = table.remove(args, 1) :: { [any]: any }

	for _, dictionary in args do
		if not compareDeep(first, dictionary) then
			return false
		end
	end

	return true
end

return equalsDeep
