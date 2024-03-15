local None = require("@sift/None")
local reduce = require("./reduce")

--[=[
	@within Array

	Zips multiple arrays together into a single array, filling
	in missing values with `None`.

	```lua
	local table1 = { 1, 2, 3, 4 }
	local table2 = { "hello", "world", "goodbye" }

	local new = ZipAll(table1, table2) -- { { 1, "hello" }, { 2, "world" }, { 3, "goodbye" }, { 4, None } }
	```
]=]
local function zipAll<T>(...: { any }): { T }
    if select("#", ...) == 0 then
        return {} :: any
    end

    local args = { ... }
    local out = {}

    local maxLength = reduce(args, function(acc, val)
        return math.max(acc, #val)
    end, 0)

    for index = 1, maxLength do
        local values = {}

        for _, argArray in args do
            local value = argArray[index]
            table.insert(values, if value == nil then None else value)
        end

        table.insert(out, values)
    end

    return out :: any
end

return zipAll
