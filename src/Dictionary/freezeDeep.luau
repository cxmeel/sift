--[=[
    @within Dictionary

    Recursively freezes a dictionary and all of its nested dictionaries. Using [Dictionary.freeze] will only freeze the top level of the dictionary, leaving nested dictionaries mutable.

    ```lua
    local frozen = freezeDeep({
        a = "apple",
        b = { c = "carrot" },
    })

    frozen.a = "avocado" -- error!
    frozen.b.c = "cabbage" -- error!
    frozen.c = "coconut" -- error!
    ```
]=]
local function freezeDeep<K, V>(dictionary: { [K]: V }): { [K]: V }
    local out = {}

    for key, value in dictionary do
        if typeof(value) == "table" then
            local nested: any = freezeDeep(value)
            out[key] = nested

            continue
        end

        out[key] = value
    end

    return table.freeze(out)
end

return freezeDeep
