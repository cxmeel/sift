local None = require("@sift/None")

--[=[

	@within Array




	Joins multiple arrays together into a single array.

	#### Aliases

	`join`, `merge`

	```lua
	local table1 = { 1, 2, 3 }
	local table2 = { 4, 5, 6 }

	local new = Concat(table1, table2) -- { 1, 2, 3, 4, 5, 6 }
	```
]=]
local function concat<T>(...: { T }): { T }
    local result = {}

    for _, array in { ... } do
        if typeof(array) ~= "table" then
            continue
        end

        for _, item in array do
            if item == nil or item == None then
                continue
            end

            table.insert(result, item)
        end
    end

    return result
end

return concat
