--[=[
	@within Array

	Finds the index of the last item in the array that matches the value.

    #### Aliases

    `lastIndexOf`

	```lua
	findLast({ "hello", "world", "hello" }, "hello") -- 3
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
