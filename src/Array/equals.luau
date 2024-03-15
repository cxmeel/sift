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




	Compares two arrays for equality.

	```lua
	local array = { 1, 2, 3 }
	local other = { 1, 2, 3 }

	local value = Equals(array, other) -- true
	local value = Equals(array, other, { 1, 2, 3 }) -- true
	local value = Equals(array, other, { 1, 2, 4 }) -- false
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
