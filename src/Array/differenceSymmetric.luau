local setDifferenceSymmetric = require("@sift/Set/differenceSymmetric")
local toArray = require("@sift/Set/toArray")
local toSet = require("./toSet")

--[=[
  @within Array

  Returns an array of values that are in the first array, but not in the other arrays, and vice versa.

    #### Aliases

    `symDiff`

  ```lua
  local array1 = { "hello", "world" }
  local array2 = { "cat", "dog", "hello" }

  differenceSymmetric(array1, array2) -- { "world", "cat", "dog" }
  ```
]=]
local function differenceSymmetric<T>(...: { T }): { T }
    local args = { ... }
    local first = table.remove(args, 1) :: { T }

    local arraySet = toSet(first)
    local otherSets = {}

    for _, nextArray in args do
        if typeof(nextArray) ~= "table" then
            continue
        end

        table.insert(otherSets, toSet(nextArray))
    end

    local differenceSet = setDifferenceSymmetric(arraySet, unpack(otherSets))
    return toArray(differenceSet)
end

return differenceSymmetric
