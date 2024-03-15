--[=[

	@within Array






	Slices an array.

	```lua
	local array = { 1, 2, 3, 4, 5 }

	local new = Slice(array, 2, 3) -- { 2, 3 }
	local new = Slice(array, -2, -1) -- { 3, 4 }
	local new = Slice(array, 3) -- { 3, 4, 5 }
	```
]=]
local function slice<T>(array: { T }, from: number?, to: number?): { T }
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

    for i = from, to do
        table.insert(result, array[i])
    end

    return result
end

return slice
