local copy = require("./copy")

--[=[
    @within Set

    Returns a new set with the given value added to it.

    ```lua
    local set = { a = true, b = true }
    add(set, "c") -- { a = true, b = true, c = true }
    ```
]=]
local function add<T>(set: { [T]: boolean }, value: T): { [T]: boolean }
	local newSet = copy(set)
	newSet[value] = true

	return newSet
end

return add
