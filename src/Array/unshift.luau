--[=[
	@within Array

	Inserts values to the beginning of an array.

	#### Aliases

	`prepend`

	```lua
	unshift({ 1, 2, 3 }, 0) -- { 0, 1, 2, 3 }
	```
]=]
local function unshift<T>(array: { T }, ...: T): { T }
    local result = { ... }

    for _, value in array do
        table.insert(result, value)
    end

    return result
end

return unshift
