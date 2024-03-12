--[=[
    @within Array
    @function copy
    @param array { T }
    @return { T }

    Returns a shallow copy of the array. Use [Array.copyDeep] to copy nested arrays.

    ```lua
    copy({ 1, 2, 3 }) -- { 1, 2, 3 }
    ```
]=]
return table.clone
