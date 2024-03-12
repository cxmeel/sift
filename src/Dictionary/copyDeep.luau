--[=[
    @within Dictionary

    Returns a deep copy of the given dictionary. This means that all nested tables are also copied.

    ```lua
    local dictionary = { a = 1, b = { c = 2 } }
    copyDeep(dictionary) -- { a = 1, b = { c = 2 } }
    ```
]=]
local function copyDeep<K, V>(dictionary: { [K]: V }): { [K]: V }
	local out: { [K]: V } = {}

	for key, value in dictionary do
		if typeof(value) == "table" then
			out[key] = copyDeep(value) :: any
		else
			out[key] = value
		end
	end

	return out
end

return copyDeep
