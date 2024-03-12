--[=[
    @within Set

    Returns the number of elements in the set that satisfy the provided predicate.

    ```lua
    local set = { a = true, b = true, c = true }

    count(set) -- 3
    count(set, function(value)
        return value ~= "b"
    end) -- 2
    ```
]=]
local function count<T>(set: { [T]: boolean }, predicate: ((value: T) -> boolean)?): number
	local counter = 0

	for value in set do
		if not predicate or predicate(value) then
			counter += 1
		end
	end

	return counter
end

return count
