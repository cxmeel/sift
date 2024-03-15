--[=[
    @within Array

	Freezes the entire array, making it read-only, including all
	nested arrays.

	```lua
	local frozen = freezeDeep({
        { 1, 2, 3 },
        { 4, 5, 6 },
    })

	frozen[1][2] = 4 -- error!
	frozen[2][1] = 7 -- error!

    table.insert(frozen[1], 4) -- error!
    table.remove(frozen[2], 7) -- error!
	```
]=]
local function freezeDeep<T>(array: { T }): { T }
    local result = {}

    for i = 1, #array do
        local value = array[i]

        if typeof(value) == "table" then
            table.insert(result, freezeDeep(value))
        else
            table.insert(result, value)
        end
    end

    table.freeze(result)

    return result
end

return freezeDeep
