--[=[
    @within Array
    @function create
    @param count number
    @param value T?
    @return { T }

    Creates a new array with `count` elements, each initialized to `value`.

    ```lua
    create(3) -- { nil, nil, nil }
    create(3, true) -- { true, true, true }
    ```
]=]
return table.create
