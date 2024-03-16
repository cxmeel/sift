--[=[
    @within Array
    @function create
    @param count number
    @param value T
    @return { T }

    Creates an array with `count` elements. If `value` is provided, all elements will be set to `value`.

    ```lua
    create(3) -- { nil, nil, nil }
    create(3, "Hello") -- { "Hello", "Hello", "Hello" }
    ```
]=]
local create = table.create
return create
