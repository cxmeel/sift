--[=[
	@within Array

	Removes a value from an array.

	```lua
	removeValue({ "a", "b", "c" }, 2) -- { "a", "c" }
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
