local copy = require("./copy")

--[=[
    @within Dictionary

    Returns a new dictionary that is a shallow copy of the input dictionary, but is frozen. This means that the dictionary cannot be modified in any way. This is useful for ensuring that a dictionary is not modified after it has been created. Use [Dictionary.freezeDeep] to freeze a dictionary and all of its nested dictionaries.

    ```lua
    local frozen = freeze({ queen = "elsa", princess = "anna" })

    frozen.princess = "elsa" -- error!
    frozen.spirit = "bruni" -- error!
    ```
]=]
local function freeze<K, V>(dictionary: { [K]: V }): { [K]: V }
    local out = copy(dictionary)
    return table.freeze(out)
end

return freeze
