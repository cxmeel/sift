--[=[

	@within Array






	Finds the index of the last item in the array that matches the value.

	```lua
	local array = { "hello", "world", "hello" }

	local index = FindLast(array, "hello") -- 3
	local index = FindLast(array, "hello", 2) -- 1
	```
]=]
local function findLast<T>(array: { T }, value: any?, from: number?): number?
    local length = #array

    from = if typeof(from) == "number" then if from < 1 then length + from else from else length

    for index = from, 1, -1 do
        if array[index] == value then
            return index
        end
    end

    return
end

return findLast
