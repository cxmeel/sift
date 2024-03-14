--[=[
    @within Set

	Returns a shallow copy of the set.

	```lua
	copy({ a = true, b = true }) -- { a = true, b = true }
	```
]=]
local function copy<T>(set: { [T]: boolean }): { [T]: boolean }
    local out = {}

    for value in set do
        out[value] = true
    end

    return out
end

return copy
