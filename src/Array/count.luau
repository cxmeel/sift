local Util = require("@sift/Util")

--[=[
	@within Array

	Counts the number of items in an array.

	```lua
	count({ 1, 2, 3 }) -- 3
	count({ 1, 2, 3 }, function(item, index)
		return item > 1
	end) -- 2
	```
]=]
local function count<T>(
    array: { T },
    predicate: ((value: T, index: number, array: { T }) -> boolean)?
): number
    local counter = 0

    predicate = if typeof(predicate) == "function" then predicate else Util.func.truthy

    for index, value in array do
        if predicate(value, index, array) then
            counter += 1
        end
    end

    return counter
end

return count
