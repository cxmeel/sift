--[=[
    @within Set

    Returns `true` if the set contains the given value.

    #### Aliases

    `contains`, `includes`

    ```lua
    has(Set<{ "a", "b", "c" }>, "a") -- true
    ```
]=]
local function has<T>(set: { [T]: boolean }, value: T): boolean
    return set[value] == true
end

return has
