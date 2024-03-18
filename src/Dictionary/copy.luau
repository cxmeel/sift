--[=[
    @within Dictionary
    @function copy
    @param dictionary { [K]: V }
    @return { [K]: V }

    Returns a shallow copy of a dictionary.

    #### Aliases

    `clone`

    ```lua
    copy({ foo = "bar" }) -- { foo = "bar" }
    ```
]=]
local copy = table.clone
return copy
