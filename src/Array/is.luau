--[=[
    @within Array

    Checks if `value` is an array.

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
