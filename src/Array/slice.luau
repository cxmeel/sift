local Util = require("@sift/Util")

--[=[
	@within Array

	Returns a slice of an array from `from` to `to`.

	```lua
	slice({1, 2, 3, 4, 5}, 2, 4) -- { 2, 3, 4 }
	```
]=]
local function slice<T>(array: { T }, from: number?, to: number?): { T }
    local out = {}

    local useFrom = Util.resolveIndex(#array, from or 1)
    local useTo = Util.resolveIndex(#array, to or #array)

    if useFrom > useTo then
        useFrom, useTo = useTo, useFrom
    end

    for index = useFrom, useTo do
        table.insert(out, array[index])
    end

    return out
end

return slice
