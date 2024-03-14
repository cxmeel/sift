--[=[
    @within Dictionary

    Returns a new dictionary containing only the key-value pairs that are different between the two dictionaries.

    ```lua
    local dictionary1 = { a = 1, b = { c = 2, d = 3 } }
    local dictionary2 = { a = 1, b = true }

    differenceDeep(dictionary1, dictionary2)
    -- { b = { c = 2, d = 3 } }
    ```
]=]
local function differenceDeep<K, V>(dictionary: { [K]: V }, other: { [K]: V }): { [K]: V }
    local out: { [K]: any } = {}

    for key, value in dictionary do
        if typeof(value) == "table" then
            if typeof(other[key]) == "table" then
                out[key] = differenceDeep(value, other[key])
                continue
            end

            out[key] = value
            continue
        end

        if other[key] == nil or other[key] ~= value then
            out[key] = value
        end
    end

    return out
end

return differenceDeep
