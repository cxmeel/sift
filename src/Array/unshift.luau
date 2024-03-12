local insert = require("./insert")

--[=[
    @within Array
]=]
local function unshift<T>(array: { T }, ...: T): { T }
	return insert(array, 1, ...)
end

return unshift
