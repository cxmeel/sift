local toSet = require("./toSet")

--[=[
	@within Array

	Removes values from an array.

	```lua
	removeValues({ "a", "b", "b" }, "b") --> { "a" }
	```
]=]
local function removeValues<T>(array: { T }, ...: T): { T }
    local valueSet = toSet({ ... })
    local result = {}

    for _, value in array do
        if not valueSet[value] then
            table.insert(result, value)
        end
    end

    return result
end

return removeValues
