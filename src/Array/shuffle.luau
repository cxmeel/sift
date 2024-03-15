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

    local out = copy(array)

    for index = #out, 2, -1 do
        local newIndex = math.random(1, index)
        out[index], out[newIndex] = out[newIndex], out[index]
    end

    return out
end

return shuffle
