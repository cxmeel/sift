--[=[
	@within Array

    Converts an array to a set.

	```lua
	toSet({ "a", "b", "b", "c" }) -- Set<{ "a", "b", "c" }>
	```
]=]
local function toSet<T>(array: { T }): { [T]: boolean }
    local set = {}

    for _, value in array do
        set[value] = true
    end

    return set
end

return toSet
