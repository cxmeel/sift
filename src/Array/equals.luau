local Util = require("@sift/Util")

local function compare(a, b)
    if typeof(a) ~= "table" or typeof(b) ~= "table" then
        return a == b
    end

    local aLength = #a

    if #b ~= aLength then
        return false
    end

    for i = 1, aLength do
        if a[i] ~= b[i] then
            return false
        end
    end

    return true
end

--[=[
	@within Array

    Checks if all arrays are equal; i.e. they have the same length and the same elements in the same order.

	```lua
	local array1 = { 1, 2, 3 }
	local array2 = { 1, 2, 3 }
    local array3 = { 4, 5, 6 }

	equals(array1, array2) -- true
	equals(array1, array3) -- false
	```
]=]
local function equals<T>(...: { T }): boolean
    if Util.areEqual(...) then
        return true
    end

    local args = { ... }
    local first = table.remove(args, 1) :: { T }

    for _, array in args do
        if not compare(first, array) then
            return false
        end
    end

    return true
end

return equals
