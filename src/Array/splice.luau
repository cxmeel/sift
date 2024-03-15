local Util = require("@sift/Util")

--[=[
	@within Array

    Splices a series of values into an array at a given index. If `deleteCount` is provided, it will overwrite that many values starting from `from`.

	```lua
    splice({ "a", "b", "c" }, 2, 1, "d", "e")
    -- { "a", "d", "e", "c" }
	```
]=]
local function splice<T>(array: { T }, start: number?, deleteCount: number?, ...: T?): { T }
    local useStart = Util.resolveIndex(#array, start or -1)
    local out = {}

    for i = 1, useStart - 1 do
        table.insert(out, array[i])
    end

    for i = 1, select("#", ...) do
        table.insert(out, (select(i, ...)))
    end

    for i = useStart + (deleteCount or 0) + 1, #array do
        table.insert(out, array[i])
    end

    return out
end

return splice
