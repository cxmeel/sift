local None = require("@Sift/None")

--[=[
    @within Set

    Returns a new set with the results of applying the provided function to each element of the original set.

    ```lua
    map({ a = true, b = true, c = true }, function(value)
        return value .. "!"
    end) -- { ["a!"] = true, ["b!"] = true, ["c!"] = true }
    ```
]=]
local function map<T, U>(set: { [T]: boolean }, mapper: (value: T) -> U): { [U]: boolean }
	local out = {}

	for value in set do
		local mapped = mapper(value)

		if mapped ~= nil and mapped ~= None then
			out[mapped] = true
		end
	end

	return out
end

return map
