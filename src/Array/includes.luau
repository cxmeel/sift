local find = require("./find")

--[=[
	@within Array

	Checks whether the array contains the value.

	#### Aliases

	`contains`, `has`

	```lua
	local array = { "hello", "world", "goodbye" }

    includes(array, "hello") -- true
    includes(array, "sift") -- false
    includes(array, "hello", 2) -- false
	```
]=]
local function includes<T>(array: { T }, value: any, startAt: number?): boolean
    return find(array, value, startAt) ~= nil
end

return includes
