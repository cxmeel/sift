--[=[
    @within Dictionary

    Returns whether the dictionary includes a certain value or not. If the value is found, the function also returns the key associated with the value.

    ```lua
    includes({ a = 1, b = 3 }, 2) -- false
    ```
]=]
local function includes<K, V>(dictionary: { [K]: V }, value: V): (boolean, K?)
    for key, val in dictionary do
        if val == value then
            return true, key
        end
    end

    return false, nil
end

return includes
