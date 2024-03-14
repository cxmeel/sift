--[=[
    @within Set

    Returns whether the set contains the given value.

    ```lua
    has({ a = true, b = true }, "a") -- true
    ```
]=]
local function has<T>(set: { [T]: boolean }, value: T): boolean
    return set[value] == true
end

return has
