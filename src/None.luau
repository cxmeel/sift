--[=[
	@within Sift
	@prop None None

	Luau doesn't have a built-in `undefined` type, so Sift provides a `None` value to represent the absence of a value.

	```lua
	merge({ foo = "bar", baz = "qux" }, { foo = Sift.None })
	-- { baz = "qux" }
	```
]=]
local None: unknown = newproxy(true)

getmetatable(None :: any).__tostring = function()
	return "Sift.None"
end

export type None = typeof(None)

return None
