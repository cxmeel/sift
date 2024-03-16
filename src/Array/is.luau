--[=[
    @within Array

    Checks if `value` is an array. An array is a table with a length greater than 0 and no keys other than integer keys from 1 to `#value`. Empty tables are not considered arrays, as they may be used as dictionaries.

    ```lua
    is({ 1, 2, 3 }) -- true
    is({ a = 1, b = 2, c = 3 }) -- false
    is("hello") -- false
    is({}) -- false
    ```
]=]
local function is(value: any): boolean
    return typeof(value) == "table" and #value > 0 and next(value, #value) == nil
end

return is
