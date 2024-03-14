type ExpandedDictionary<V> = { [string]: ExpandedDictionary<V> | V }

--[=[
    @within Dictionary

    Expands a dictionary with keys that contain a separator into a nested dictionary.

    ```lua
    local dictionary = {
        ["a"] = 1,
        ["b.c"] = 2,
        ["b.d"] = 3,
    }

    expandKeys(dictionary) -- { a = 1, b = { c = 2, d = 3 } }
    ```
]=]
local function expandKeys<V>(
    dictionary: { [string]: V },
    separator: string?
): ExpandedDictionary<V>
    local withSeparator = separator or "."
    local out = {}

    for key, value in dictionary do
        local parts = key:split(withSeparator)
        local current = out

        while #parts > 1 do
            local part = table.remove(parts, 1)

            if not current[part] then
                current[part] = {}
            end

            current = current[part]
        end

        current[parts[1]] = value :: any
    end

    return out :: any
end

return expandKeys
