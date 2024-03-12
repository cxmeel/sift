--[=[
    @within Set

    Filters a set into two sets based on a filter function. The first set contains all values that pass the filter, and the second set contains all values that fail the filter.

    ```lua
    local set = { a = true, b = true, c = true, d = true }

    partition(set, function(value)
        return value ~= "c"
    end) -- { a = true, b = true, d = true }, { c = true }
    ```
]=]
local function partition<T>(
	set: { [T]: boolean },
	predicate: (value: T) -> boolean
): ({ [T]: boolean }, { [T]: boolean })
	local pass = {}
	local fail = {}

	for value in set do
		if predicate(value) then
			pass[value] = true
		else
			fail[value] = true
		end
	end

	return pass, fail
end

return partition
