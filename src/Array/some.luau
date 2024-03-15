--[=[
	@within Array

	Checks whether some item in the array passes the predicate.

	```lua
	some({ 1, 2, 3 }, function(value)
        return value > 2
    end) -- true
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
