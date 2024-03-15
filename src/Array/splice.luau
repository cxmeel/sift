--[=[

	@within Array







	Splices an array.

	```lua
	local array = { 1, 2, 3, 4, 5 }

	local new = Splice(array, 3, 4, 6, 7) -- { 1, 2, 6, 7, 4, 5 }
	local new = Splice(array, -1, 0, 6, 7) -- { 1, 2, 3, 4, 6, 7 }
	local new = Splice(array, 4, -1, 6, 7) -- { 1, 2, 3, 6, 7, 5 }
	```
]=]
local function splice<T>(array: { T }, from: number?, to: number?, ...: T?): { T }
    local length = #array
    local result = {}

    from = if typeof(from) == "number" then from else 1
    to = if typeof(to) == "number" then to else length

    if from < 1 then
        from += length
    end

    if to < 1 then
        to += length
    end

    for index = 1, from - 1 do
        table.insert(result, array[index])
    end

    for _, value in { ... } do
        table.insert(result, value)
    end

    for index = to + 1, length do
        table.insert(result, array[index])
    end

    return result
end

return splice
