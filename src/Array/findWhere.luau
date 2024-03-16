local Util = require("@sift/Util")

--[=[
    @within Array

	Finds the index of the first element in the array that satisfies the provided testing function. Otherwise, it returns `nil`.

	```lua
	findWhere({ 1, 2, 3 }, function(item)
		return item > 1
	end) -- 2
	```
]=]
local function findWhere<T>(
    array: { T },
    predicate: (value: T, index: number, array: { T }) -> boolean,
    startAt: number?
): number?
    for index = Util.resolveIndex(#array, startAt), #array do
        if predicate(array[index], index, array) then
            return index
        end
    end

    return nil
end

return findWhere
