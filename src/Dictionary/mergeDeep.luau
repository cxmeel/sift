local None = require("@sift/None")
local copyDeep = require("./copyDeep")

--[=[
    @within Dictionary

    Merges the given dictionaries into a single dictionary. If the
    value is `None`, it will be removed from the result. This is
    recursive. The parameters may be any number of dictionaries or
    `nil`. Non-dictonaries will be ignored.

    Aliases: `joinDeep`

    ```lua
    local dictionary1 = { hello = "roblox", goodbye = { world = "goodbye" } }
    local dictionary2 = { goodbye = { world = "world" } }

    mergeDeep(dictionary1, dictionary2)
    -- { hello = "roblox", goodbye = { world = "world" } }
    ```
]=]
local function mergeDeep<K, V>(...: { [any]: any }): { [K]: V }
    local out: { [K]: V } = {}

    for _, dictionary in { ... } do
        if typeof(dictionary) ~= "table" then
            continue
        end

        for key, value in dictionary do
            if value == None or value == nil then
                continue
            end

            if typeof(value) == "table" then
                if out[key] == nil or typeof(out[key]) ~= "table" then
                    out[key] = copyDeep(value)
                else
                    out[key] = mergeDeep(out[key] :: any, value) :: any
                end

                continue
            end

            out[key] = value
        end
    end

    return out
end

return mergeDeep
