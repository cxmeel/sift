local partition = require("./partition")

--[=[
	@within Array

	Returns two arrays; one with the last `count` elements removed, and one with the removed elements.

	```lua
	pop({ 1, 2, 3 }) -- { 1, 2 }, { 3 }
	pop({ 1, 2, 3 }, 2) -- { 1 }, { 2, 3 }
	```
]=]
local function pop<T>(array: { T }, count: number?): ({ T }, { T })
    return partition(array, function(_, index)
        return index <= #array - (count or 1)
    end)
end

return pop
