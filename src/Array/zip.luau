local reduce = require("./reduce")

--[=[

	@within Array




	Zips multiple arrays together into a single array.

	```lua
	local table1 = { 1, 2, 3 }
	local table2 = { "hello", "world", "goodbye" }

	local new = Zip(table1, table2) -- { { 1, "hello" }, { 2, "world" }, { 3, "goodbye" } }
	```
]=]
local function zip<T>(...: { any }): { T }
    if select("#", ...) == 0 then
        return {} :: any
    end

    local args = { ... }
    local out = {}

    local minLength: number = reduce(args, function(acc, array)
        return math.min(acc, #array)
    end, math.huge)

    for index = 1, minLength do
        local values = {}

        for _, argArray in args do
            table.insert(values, argArray[index])
        end

        table.insert(out, values)
    end

    return out :: any
end

return zip
