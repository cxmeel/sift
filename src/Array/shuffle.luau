local copy = require("./copy")

--[=[
	@within Array

	Randomises the order of the items in an array.

	```lua
	shuffle({ 1, 2, 3 }) -- { 2, 3, 1 }
	```
]=]
local function shuffle<T>(array: { T }, seed: number?): { T }
    math.randomseed(os.clock() + (seed or 0))

    local result = copy(array)

    for index = #result, 1, -1 do
        local newIndex = math.random(1, index)
        local temp = result[index]

        result[index] = result[newIndex]
        result[newIndex] = temp
    end

    return result
end

return shuffle
