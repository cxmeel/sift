--[=[

	@within Array





	Removes a value from an array.

	```lua
	local array = { 1, 2, 3 }

	local new = RemoveValue(array, 2) -- { 1, 3 }
	```
]=]
local function removeValue<T>(array: { T }, value: T): { T }
    local result = {}

    for _, arrValue in array do
        if arrValue ~= value then
            table.insert(result, arrValue)
        end
    end

    return result
end

return removeValue
