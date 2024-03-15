--[=[
    @within Array

	Adds elements to the end of the array.

	#### Aliases

	`append`

	```lua
	push({ 1, 2, 3 }, 4, 5) -- { 1, 2, 3, 4, 5 }
	```
]=]
local function push<T>(array: { T }, ...: T): { T }
    local result = {}

    for _, value in array do
        table.insert(result, value)
    end

    for _, value in { ... } do
        table.insert(result, value)
    end

    return result
end

return push
