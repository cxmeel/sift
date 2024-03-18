--[=[
    @within Dictionary

    Checks whether or not the given dictionary includes the given value.

    ```lua
    local dictionary = { hello = "roblox", goodbye = "world" }

    local includesRoblox = Includes(dictionary, "roblox") -- true
    local includesCat = Includes(dictionary, "cat") -- false
    ```
]=]
local function includes<K, V>(dictionary: { [K]: V }, value: V): boolean
    for _, v in dictionary do
        if v == value then
            return true
        end
    end

    return false
end

return includes
