local Util = require("@sift/Util")
local splice = require("./splice")

--[=[
	@within Array

	Inserts new elements at the specified index within an array. An error will be thrown if the index is greater than the length of the array. Use [Array.push] to append.

	```lua
	insert({ "foo", "baz", "qux" }, 2, "bar")
    -- { "foo", "bar", "baz", "qux" }
	```
]=]
local function insert<T>(array: { T }, index: number, ...: T): { T }
    index = Util.resolveIndex(#array, index)

    if index > #array then
        error(`index {index} out of bounds for array of length {#array}`)
    end

    return splice(array, index, 0, ...)
end

return insert
