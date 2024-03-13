local None = require("@Sift/None")
local copy = require("./copy")

--[=[
    @within Dictionary

	Updates a value in a dictionary with a given key. If the key does not exist, the value is added to the dictionary using the provided adder function.

	```lua
	local dictionary = { a = 1, b = 2 }

	update(dictionary, "b", function(value)
		return value + 1
	end) -- { a = 1, b = 3 }

	update(dictionary, "c", nil, function()
		return 3
	end) -- { a = 1, b = 2, c = 3 }
	```
]=]
local function update<K, V, T>(
	dictionary: { [K]: V },
	key: K,
	updater: ((value: V, key: K) -> T)?,
	adder: ((key: K) -> T)?
): { [K]: T }
	local out: { [K]: any } = copy(dictionary)

	if updater and out[key] ~= nil and out[key] ~= None then
		out[key] = updater(out[key], key) :: any
	elseif adder and (out[key] == nil or out[key] == None) then
		out[key] = adder(key) :: any
	end

	return out
end

return update
