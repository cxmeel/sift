local Util = require("@sift/Util")

--[=[
	@within Array

	Finds the index of the last item in the array that passes the predicate.

	```lua
	findWhereLast({ "a", "b", "c", "b", "d" }, function(item)
		return item == "b"
	end) -- 4
	```
]=]
local function findWhereLast<T>(
    array: { T },
    predicate: (value: T, index: number, array: { T }) -> any,
    startAt: number?
): number?
    for index = Util.resolveIndex(#array, startAt or -1), 1, -1 do
        if predicate(array[index], index, array) then
            return index
        end
    end

    return nil
end

return findWhereLast
