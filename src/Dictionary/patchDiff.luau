export type Operation = "add" | "remove" | "replace"

export type Patch<K, V> = {
	op: Operation,
	path: { K },
	value: V,
}

--[=[
    @within Dictionary

    Returns an array of patches that can be applied to `dictionary` to make it equal to `other`. This is a deep comparison. The patches are similar to those used in JSON Patch.

	```lua
	local dictionary1 = {
		foo = "bar",
		qux = {
			baz = "quux",
		},
	}

	local dictionary2 = {
		foo = "bar",
		qux = {
			baz = "quuz",
		},
		baz = "quux",
	}

	patchDiff(dictionary1, dictionary2) --[[
		{
			{
				op = "replace",
				path = { "qux", "baz" },
				value = "quuz",
			},
			{
				op = "add",
				path = { "baz" },
				value = "quux",
			},
		}
	]]
	```
]=]
local function patchDiff<K, V, T>(dictionary: { [K]: V }, other: { [K]: V }): { Patch<K, V> }
	local out: { any } = {}

	for key, value in dictionary do
		if other[key] == nil then
			table.insert(out, {
				op = "remove",
				path = { key },
				value = value,
			})

			continue
		end

		if typeof(value) == "table" then
			local subpatches = patchDiff(value, other[key])

			for _, patch in subpatches do
				table.insert(out, {
					op = patch.op :: any,
					path = { key, table.unpack(patch.path) },
					value = patch.value,
				})
			end

			continue
		end

		if value ~= other[key] then
			table.insert(out, {
				op = "replace",
				path = { key },
				value = other[key],
			})
		end
	end

	for key, value in other do
		if dictionary[key] == nil then
			table.insert(out, {
				op = "add",
				path = { key },
				value = value,
			})
		end
	end

	return out
end

return patchDiff
