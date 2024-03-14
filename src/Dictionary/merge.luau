local None = require("@Sift/None")

--[=[
    @within Dictionary

    Merges multiple dictionaries into a single dictionary. If a key is present in multiple dictionaries, the value from the last dictionary in the list will be used.

    ```lua
    local dictionary1 = { a = 1, b = 2 }
    local dictionary2 = { b = 3, c = 4 }

    merge(dictionary1, dictionary2) -- { a = 1, b = 3, c = 4 }
    ```
]=]
local function merge<K, V>(...: { [any]: any }): { [K]: V }
    local out = {}

    for _, dictionary in { ... } do
        for key, value in dictionary do
            if key ~= None and value ~= None then
                out[key] = value
            end
        end
    end

    return out
end

return merge
