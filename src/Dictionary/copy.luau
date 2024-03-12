--[=[
    @within Dictionary
    @function copy
    @param dictionary { [K]: V }
    @return { [K]: V }

    Returns a shallow copy of the dictionary. Use [Dictionary.copyDeep] to copy nested arrays.

    ```lua
    copy({ a = 1, b = 2 }) -- { a = 1, b = 2 }
    ```
]=]
return table.clone
