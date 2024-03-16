local setDifference = require("@sift/Set/difference")
local toArray = require("@sift/Set/toArray")
local toSet = require("./toSet")

--[=[
  @within Array

  Returns an array of values that are unique to the first array, and not present in any of the other arrays.

  #### Aliases

  `diff`

  ```lua
  difference({ "hello", "world" }, { "goodbye", "world" })
  -- { "hello" }
  ```
]=]
local function difference<T>(...: { T }): { T }
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

    local differenceSet = setDifference(arraySet, unpack(otherSets))
    return toArray(differenceSet)
end

return difference
