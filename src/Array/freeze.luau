local copy = require("./copy")

--[=[
    @within Array

    Returns a shallow copy of the array that is frozen. This means that the array cannot be modified in any way; i.e. it is read-only. Use [Array.freezeDeep] to freeze nested arrays as well.

    ```lua
    local frozen = freeze({ "anna", "elsa", "kristoff" })

    table.insert(frozen, "olaf") -- error!
    frozen[4] = "jorgen" -- error!
    frozen[2] = "sven" -- error!
    ```
]=]
local function freeze<T>(array: { T }): { T }
	local out = copy(array)
	return table.freeze(out)
end

return freeze
