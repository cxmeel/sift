--[=[

	@within Array





	Checks whether some item in the array passes the predicate.

	```lua
	local array = { 1, 2, 3 }

	local value = Some(array, function(item, index)
		return item > 1
	end) -- true

	local value = Some(array, function(item, index)
		return item > 3
	end) -- false
	```
]=]
local function some<T>(
    array: { T },
    predicate: (value: T, index: number, array: { T }) -> any
): boolean
    for index, value in array do
        if predicate(value, index, array) then
            return true
        end
    end

    return false
end

return some
