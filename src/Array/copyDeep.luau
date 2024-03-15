--[=[
	@within Array

	Copies an array, with deep copies of all nested arrays.

    #### Aliases

    `cloneDeep`

	```lua
	copyDeep({ 1, 2, 3, { 4, 5 } }) -- { 1, 2, 3, { 4, 5 } }
	```
]=]
local function copyDeep<T>(array: { T }): { T }
    local result = table.clone(array)

    for index, value in array do
        if typeof(value) == "table" then
            result[index] = copyDeep(value) :: any
        end
    end

    return result
end

return copyDeep
