--[=[
    @within Array
    @function copy
    @param array { T }
    @return { T }

    Copies an array.

    #### Aliases

    `clone`

    ```lua
    copy({ 1, 2, 3 }) -- { 1, 2, 3 }
    ```
]=]
local copy = table.clone
return copy
