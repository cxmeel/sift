local ToSet = require("./toSet")

--[=[

	@within Array





	Removes values from an array.

	```lua
	local array = { "a", "b", "c", "c", "d", "e" }

	local new = RemoveValues(array, "c", "d") -- { "a", "b", "e" }
	```
]=]
local function removeValues<T>(array: { T }, ...: T): { T }
    local valueSet = ToSet({ ... })
    local result = {}

    for _, value in array do
        if not valueSet[value] then
            table.insert(result, value)
        end
    end

    return result
end

return removeValues
