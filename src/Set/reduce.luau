local None = require("@sift/None")

--[=[
    @within Set

    Reduces a set to a single value using a reducer function.

    ```lua
    reduce(Set<{ 1, 2, 3 }>, function(accumulator, value)
        return accumulator + value
    end) -- 6
    ```
]=]
local function reduce<T, U>(
    set: { [T]: boolean },
    reducer: (acc: U, value: T, set: { [T]: boolean }) -> U,
    initAccumulator: U?
): U
    local out = initAccumulator :: U

    for value in set do
        if out == nil or out == None then
            out = value :: any
            continue
        end

        out = reducer(out, value, set)
    end

    return out
end

return reduce
