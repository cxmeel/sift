local setDifferenceSymmetric = require("@sift/Set/differenceSymmetric")
local toArray = require("@sift/Set/toArray")
local toSet = require("./toSet")

--[=[
  @within Array

  Returns an array of unique values across all given arrays; i.e. values that only appear once.

  #### Aliases

  `symDiff`

  ```lua
  differenceSymmetric({ "hello", "world" }, { "goodbye", "world" })
  -- { "hello", "goodbye" }
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
