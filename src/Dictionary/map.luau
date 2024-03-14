local None = require("@Sift/None")

--[=[
    @within Dictionary

    Processes each value and key of a dictionary with a mapper function and returns a new dictionary with the results. If no key is returned by the mapper, the original key is used.

    ```lua
    map({ hello = "world" }, function(value, key)
        return `{value}!`, key:upper()
    end) -- { HELLO = "world!" }

    map({ hello = "world" }, function(value)
        return value:upper()
    end) -- { hello = "WORLD" }
    ```
]=]
local function map<K, V, X, Y>(dictionary: { [K]: V }, mapper: (value: V, key: K) -> (Y, X)): { [X]: Y }
    local out: { [X]: Y } = {}

    for key, value in dictionary do
        local mappedValue, mappedKey = mapper(value, key)

        if mappedKey == None or mappedValue == None then
            continue
        end

        out[mappedKey or key :: any] = mappedValue
    end

    return out
end

return map
