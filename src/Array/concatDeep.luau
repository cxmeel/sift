local None = require("@sift/None")
local copyDeep = require("./copyDeep")

--[=[

	@within Array




	Joins multiple arrays together into a single array, with deep copies of all
	nested arrays.

	#### Aliases

	`joinDeep`, `mergeDeep`

	```lua
	local table1 = { 1, 2, { 3, 4 } }
	local table2 = { 5, 6, { 7, 8 } }

	local new = ConcatDeep(table1, table2) -- { 1, 2, { 3, 4 }, 5, 6, { 7, 8 } }
	```
]=]
local function concatDeep<T>(...: { T }): { T }
    local result = {}

    for _, array in { ... } do
        if typeof(array) ~= "table" then
            continue
        end

        for _, value in array do
            if value == nil or value == None then
                continue
            end

            if typeof(value) == "table" then
                table.insert(result, copyDeep(value) :: any)
            end

            table.insert(result, value)
        end
    end

    return result
end

return concatDeep
