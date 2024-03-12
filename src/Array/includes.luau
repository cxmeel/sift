local find = require("./find")

--[=[
    @within Array

    Returns `true` if the given value is present in the array, otherwise `false`.

    ```lua
    includes({ "a", "b", "c" }, "b") -- true
    ```
]=]
local function includes<T>(array: { T }, value: T, from: number?): boolean
	return find(array, value, from) ~= nil
end

return includes
