--[=[
	@within Array

	Finds the index of the first item in the array that matches the value.

	#### Aliases

	`indexOf`

	```lua
	local array = { "hello", "world", "hello" }

	local index = Find(array, "hello") -- 1
	local index = Find(array, "hello", 2) -- 3
	```
]=]
local function find<T>(array: { T }, value: any?, from: number?): number?
    local length = #array

    from = if typeof(from) == "number" then if from < 1 then length + from else from else 1

    return table.find(array, value, from)
end

return find
