--[=[

	@within Array





	Removes a value from an array at the given index.

	```lua
	local array = { 1, 2, 3 }

	local new = RemoveIndex(array, 1) -- { 2, 3 }
	local new = RemoveIndex(array, -1) -- { 1, 3 }
	```
]=]
local function removeIndex<T>(array: { T }, index: number): { T }
    local length = #array
    local result = {}

    if index < 1 then
        index += length
    end

    for arrIndex, value in array do
        if arrIndex ~= index then
            table.insert(result, value)
        end
    end

    return result
end

return removeIndex
