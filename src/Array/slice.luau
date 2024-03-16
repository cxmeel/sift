local Util = require("@sift/Util")

--[=[
	@within Array

	Returns a slice of an array from `from` to `to`. If `to` is not provided, it will extract to the end of the array. If `from` is greater than the length of the array, an empty array is returned.

	```lua
	slice({1, 2, 3, 4, 5}, 2, 4) -- { 2, 3, 4 }
	```
]=]
local function slice<T>(array: { T }, from: number?, to: number?): { T }
    local out = {}

    local useFrom = Util.resolveIndex(#array, from)
    local useTo = Util.resolveIndex(#array, to or -1)

    if useFrom > #array then
        return out
    end

    for index = useFrom, useTo do
        table.insert(out, array[index])
    end

    return out
end

return slice
