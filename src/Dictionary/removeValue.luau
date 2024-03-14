local removeValues = require("./removeValues")

--[=[
    @within Dictionary

    Removes the specified value from the dictionary. This function will remove all instances of the value from the dictionary.

    ```lua
    removeValue({ a = 1, b = 2, c = 1 }, 1) -- { b = 2 }
    ```
]=]
local function removeValue<K, V>(dictionary: { [K]: V }, value: V): { [K]: V }
    return removeValues(dictionary, value)
end

return removeValue
