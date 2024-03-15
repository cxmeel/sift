local Find = require("./find")

--[=[

	@within Array






	Checks whether the array contains the value. This is a wrapper
	around `Find`.

	#### Aliases

	`contains`, `has`

	```lua
	local array = { "hello", "world", "goodbye" }

	local value = Includes(array, "hello") -- true
	local value = Includes(array, "sift") -- false
	local value = Includes(array, "hello", 2) -- false
	```
]=]
local function includes<T>(array: { T }, value: any, from: number?): boolean
    return Find(array, value, from) ~= nil
end

return includes
