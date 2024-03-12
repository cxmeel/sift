local None = require("@Sift/None")
local Util = require("@Sift/Util")

local copy = require("./copy")

--[=[
    @within Array

    Updates the value at the given index in the array. If the value at the given index is `nil` or `None`, the `adder` function will be called to add a new value to the array. If the value at the given index is not `nil` or `None`, the `updater` function will be called to update the value at the given index.

    ```lua
    local array = { "a", "b", "c" }

    update(array, 2, function(value, index)
        return value .. "!"
    }) -- { "a", "b!", "c" }

    update(array, 4, nil, function(index)
        return "d"
    }) -- { "a", "b", "c", "d" }
    ```
]=]
local function update<T>(
	array: { T },
	index: number,
	updater: ((value: T, index: number) -> T)?,
	adder: ((index: number) -> T)?
): { T }
	local out = copy(array)
	index = Util.normalizeIndex(index, #array)

	if updater and out[index] ~= nil and out[index] ~= None then
		out[index] = updater(out[index], index)
	end

	if adder and (out[index] == nil or out[index] == None) then
		out[index] = adder(index)
	end

	return out
end

return update
