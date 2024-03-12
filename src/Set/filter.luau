--[=[
    @within Set

    Returns a new set containing only the elements of the input set for which the filterer function returns `true`.

    ```lua
    filter({ a = true, b = true, c = true }, function(value)
        return value ~= "b"
    end) -- { a = true, c = true }
    ```
]=]
local function filter<T>(set: { [T]: boolean }, filterer: (value: T) -> boolean): { [T]: boolean }
	local out = {}

	for value in set do
		if filterer(value) then
			out[value] = true
		end
	end

	return out
end

return filter
