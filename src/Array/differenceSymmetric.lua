--!strict
local T = require(script.Parent.Parent.Types)

local SetDifferenceSymmetric = require(script.Parent.Parent.Set.differenceSymmetric)
local ToArray = require(script.Parent.Parent.Set.toArray)
local ToSet = require(script.Parent.toSet)

--[=[
  @function differenceSymmetric
  @within Array

  @param array Array<V> -- The array to compare.
  @param ... ...Array<V> -- The arrays to compare against.
  @return Array<V> -- The symmetric difference between the arrays.

  Returns an array of values that are in the first array, but not in the other arrays, and vice versa.

  ```lua
  local array1 = { "hello", "world" }
  local array2 = { "cat", "dog", "hello" }

  local difference = DifferenceSymmetric(array1, array2) -- { "world", "cat", "dog" }
  ```
]=]
local function differenceSymmetric<V>(array: T.Array<V>, ...: T.Array<V>): T.Array<V>
	local arraySet = ToSet(array)
	local otherSets = {}

	for _, nextArray in { ... } do
		if typeof(nextArray) ~= "table" then
			continue
		end

		table.insert(otherSets, ToSet(nextArray))
	end

	local differenceSet = SetDifferenceSymmetric(arraySet, unpack(otherSets))

	return ToArray(differenceSet)
end

return differenceSymmetric
