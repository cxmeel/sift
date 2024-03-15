local Util = require("@sift/Util")

local function compareDeep(a, b)
    if typeof(a) ~= "table" or typeof(b) ~= "table" then
        return a == b
    end

    local aLength = #a

    if #b ~= aLength then
        return false
    end

    for i = 1, aLength do
        if not compareDeep(a[i] :: any, b[i] :: any) then
            return false
        end
    end

    return true
end

--[=[

	@within Array




	Compares two arrays for equality using deep comparison.

	```lua
	local array = { 1, 2, 3, { 4, 5 } }
	local other = { 1, 2, 3, { 4, 5 } }

	local value = EqualsDeep(array, other) -- true
	local value = EqualsDeep(array, other, { 1, 2, 3, { 4, 5 } }) -- true
	local value = EqualsDeep(array, other, { 1, 2, 3, { 4, 6 } }) -- false
	```
]=]
local function equalsDeep<T>(...: { T }): boolean
    if Util.areEqual(...) then
        return true
    end

    local args = { ... }
    local first = table.remove(args, 1) :: { T }

    for _, array in args do
        if not compareDeep(first, array) then
            return false
        end
    end

    return true
end

return equalsDeep
