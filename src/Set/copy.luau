--[=[
    @within Set
    @function copy
    @param set Set<T>
    @return Set<T>

    Creates a copy of a set.

    #### Aliases

    `clone`

    ```lua
    copy(Set<{ 1, 2, 3 }>) -- Set<{ 1, 2, 3 }>
    ```
]=]
local copy = table.clone
return copy
