local Util = require("@Sift/Util")

local function compare(a: any, b: any)
	if typeof(a) ~= "table" or typeof(b) ~= "table" then
		return a == b
	end

	if #a ~= #b then
		return false
	end

	for index, value in a do
		if not compare(value, b[index]) then
			return false
		end
	end

	return true
end

--[=[
    @within Array

    Returns whether or not all of the provided values are deeply equal to each other. Use this function to compare nested arrays.

    ```lua
    local array1 = {{ 1, 2 }, { 3, 4 }}
    local array2 = {{ 1, 2 }, { 4, 5 }}

    equalsDeep(array1, array2) -- false
    ```
]=]
local function equalsDeep(...: any): boolean
	if Util.areEqual(...) then
		return true
	end

	local args = { ... }
	local first = table.remove(args, 1)

	for _, value in args do
		if not compare(first, value) then
			return false
		end
	end

	return true
end

return equalsDeep
