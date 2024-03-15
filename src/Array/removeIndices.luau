--[=[
	@within Array

	Removes values from an array at the given indices.

	```lua
	removeIndices({ "a", "b", "c" }, 1, 2) -- { "c" }
	```
]=]
local function removeIndices<T>(array: { T }, ...: number): { T }
    local length = #array
    local indices = {}
    local result = {}

    for _, index in { ... } do
        if index < 1 then
            index += length
        end

        indices[index] = true
    end

    for index, value in array do
        if not indices[index] then
            table.insert(result, value)
        end
    end

    return result
end

return removeIndices
