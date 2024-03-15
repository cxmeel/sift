local partition = require("./partition")

--[=[
	@within Array

	Returns two arrays; one with the first `count` elements removed, and one with the removed elements.

	```lua
	shift({ 1, 2, 3 }) -- { 2, 3 }, { 1 }
    shift({ 1, 2, 3 }, 2) -- { 3 }, { 1, 2 }
	```
]=]
local function shift<T>(array: { T }, count: number?): ({ T }, { T })
    return partition(array, function(_, index)
        return index <= (count or 1)
    end)
end

return shift
