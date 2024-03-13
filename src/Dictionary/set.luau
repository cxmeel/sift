local copy = require("./copy")

--[=[
    @within Dictionary

    Returns a new dictionary with the given key set to the given value. If `separated` is a string, it will be used to split the key into parts and create nested dictionaries. If `separated` is `true`, the key will be split by periods.

    ```lua
    set({ a = 1 }, "b", 2) -- { a = 1, b = 2 }
    set({ a = { b = 1 } }, "a.b", 2) -- { ["a.b"] = 2 }
    set({ a = { b = 1 } }, "a.b", 2, true) -- { a = { b = 2 } }
    set({ a = { b = 1 } }, "a$b", 2, "$") -- { a = { b = 2 } }
    ```
]=]
local function set<K, V>(
	dictionary: { [K]: V },
	key: K,
	value: V,
	separated: (string | boolean)?
): { [K]: V }
	local out = copy(dictionary)

	if not separated then
		out[key] = value
		return out
	end

	local separator = type(separated) == "string" and separated or "."
	local parts: { K } = (key :: any):split(separator)
	local current: any = out

	while #parts > 1 do
		local part = table.remove(parts, 1) :: K

		if not current[part] then
			current[part] = {}
		end

		current = current[part]
	end

	current[parts[1]] = value

	return out
end

return set
