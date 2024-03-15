--[=[

	@within Array





	Checks whether every item in the array passes the predicate.

	```lua
	local array = { 1, 2, 3 }

	local value = Every(array, function(item, index)
		return item > 0
	end) -- true

	local value = Every(array, function(item, index)
		return item > 1
	end) -- false
	```
]=]
local function every<T>(
    array: { T },
    predicate: (value: T, index: number, array: { T }) -> any
): boolean
    for index, value in array do
        if not predicate(value, index, array) then
            return false
        end
    end

    return true
end

return every
