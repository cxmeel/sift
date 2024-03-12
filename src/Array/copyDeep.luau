--[=[
    @within Array

    Returns a deep copy of the given array. This means that all tables within the array are also copied.

    ```lua
    local array = {{ 1, 2 }, { 3, 4 }}
    copyDeep(array) -- {{ 1, 2 }, { 3, 4 }}
    ```
]=]
local function copyDeep<T>(array: { T }): { T }
	local out: any = {}

	for _, value in array do
		if typeof(value) == "table" then
			table.insert(out, copyDeep(value))
		else
			table.insert(out, value)
		end
	end

	return out
end

return copyDeep
