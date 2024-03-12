local setDifference = require("@Sift/Set/difference")
local toArray = require("@Sift/Set/toArray")
local toSet = require("./toSet")

--[=[
    @within Array

    Returns a new array containing only values that are in the first array and not in any of the other arrays.

	```lua
	local array1 = { 1, 2, 3 }
	local array2 = { 2, 3, 4 }

	difference(array1, array2) -- { 1 }
	```
]=]
local function difference<T>(array: { T }, ...: { T }): { T }
	local arraySet = toSet(array)
	local otherSets = {}

	for _, other in { ... } do
		table.insert(otherSets, toSet(other))
	end

	local differenceSet = setDifference(arraySet, unpack(otherSets))
	return toArray(differenceSet)
end

return difference
