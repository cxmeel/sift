--[=[
    @within Dictionary

    Filters out elements from a dictionary based on a filter function. The filter function should return `true` to keep the element, and `false` to remove it.

    ```lua
    filter({ a = 1, b = 2, c = 3 }, function(value)
        return value > 1
    end) -- { b = 2, c = 3 }
    ```
]=]
local function filter<K, V>(
	dictionary: { [K]: V },
	filterer: (value: V, key: K) -> boolean
): { [K]: V }
	local out = {}

	for key, value in dictionary do
		if filterer(value, key) then
			out[key] = value
		end
	end

	return out
end

return filter
