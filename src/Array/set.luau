--[=[
	@within Array

	Sets a value on an array at the given index.

	```lua
	set({ "a", "b", "c" }, 2, "d") -- { "a", "d", "c" }
	```
]=]
local function set<T>(array: { T }, index: number, value: T?): { T }
    local length = #array
    local result = {}

    if index < 1 then
        index += length
    end

    for arrIndex, arrValue in array do
        if arrIndex == index then
            table.insert(result, value)
        else
            table.insert(result, arrValue)
        end
    end

    return result
end

return set
