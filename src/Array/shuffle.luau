local copy = require("./copy")

--[=[
    @within Array

    Copies an array with a randomized order.

    ```lua
    shuffle({ "a", "b", "c" }) -- { "c", "a", "b" }
    ```
]=]
local function shuffle<T>(array: { T }, seed: number?): { T }
    math.randomseed(seed or os.clock() * #array)

    local out = copy(array)

    for index = #out, 1, -1 do
        local randomIndex = math.random(1, index)
        local temp = out[index]

        out[index] = out[randomIndex]
        out[randomIndex] = temp
    end

    return out
end

return shuffle
