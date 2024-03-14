local setDifferenceSymmetric = require("@Sift/Set/differenceSymmetric")
local toArray = require("@Sift/Set/toArray")
local toSet = require("./toSet")

--[=[
    @within Array

    Returns a new array containing the values that are only present in one of the input array.

    ```lua
    local array1 = { 1, 2, 3 }
    local array2 = { 2, 3, 4 }

    differenceSymmetric(array1, array2) -- { 1, 4 }
    ```
]=]
local function differenceSymmetric<T>(array: { T }, ...: { T }): { T }
    local arraySet = toSet(array)
    local otherSets = {}

    for _, other in { ... } do
        table.insert(otherSets, toSet(other))
    end

    local differenceSet = setDifferenceSymmetric(arraySet, unpack(otherSets))
    return toArray(differenceSet)
end

return differenceSymmetric
