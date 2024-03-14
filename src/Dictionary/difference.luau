local Util = require("@Sift/Util")

--[=[
    @within Dictionary

    Returns a new dictionary containing the differences between two dictionaries. The difference is calculated by comparing the values of each key in the first dictionary with the values of the same key in the second dictionary. If the values are not equal, the key-value pair is added to the new dictionary.

    ```lua
    local dictionary1 = { a = 3, b = 4, c = 5 }
    local dictionary2 = { a = 1, b = 4, d = 2 }

    difference(dictionary1, dictionary2) -- { a = 3, c = 5 }
    ```
]=]
local function difference<K, V>(dictionary: { [K]: V }, other: { [K]: V }): { [K]: V }
    local out = {}

    for key, value in dictionary do
        if not Util.areEqual(value, other[key]) then
            out[key] = value
        end
    end

    return out
end

return difference
