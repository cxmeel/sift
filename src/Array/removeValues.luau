local filter = require("./filter")
local reduce = require("./reduce")

--[=[
    @within Array

    Removes all instances of the given values from the array.

    ```lua
    removeValues({ "a", "a", "c", "b", "c", "a", "d" }, "a", "c")
    -- { "b", "d" }
    ```
]=]
local function removeValues<T>(array: { T }, ...: T): { T }
	local values = reduce({ ... }, function(acc, value)
		acc[value] = true
		return acc
	end, {})

	return filter(array, function(value)
		return not values[value]
	end)
end

return removeValues
