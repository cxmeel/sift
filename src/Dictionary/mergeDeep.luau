local None = require("@Sift/None")
local copyDeep = require("./copyDeep")

--[=[
    @within Dictionary

	Combines multiple dictionaries into a single dictionary, including nested dictionaries.

	```lua
	local dictionary1 = { foo = "bar", deep = { foo = "bar" } }
	local dictionary2 = { deep = { foo = "baz" } }

	mergeDeep(dictionary1, dictionary2)
	-- { foo = "bar", deep = { foo = "baz" } }
	```
]=]
local function mergeDeep<K, V>(...: { [any]: any }): { [K]: V }
    local out: any = {}

    for _, dictionary in { ... } do
        for key, value in dictionary do
            if value == None then
                out[key] = nil
                continue
            end

            if typeof(value) == "table" then
                if out[key] == nil or typeof(out[key]) ~= "table" then
                    out[key] = copyDeep(value)
                    continue
                end

                out[key] = mergeDeep(out[key], value)
                continue
            end

            out[key] = value
        end
    end

    return out
end

return mergeDeep
