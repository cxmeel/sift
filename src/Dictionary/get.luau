--[=[
    @within Dictionary

	Retrieves a value from a dictionary using a key. If the key is a dot-separated string and the `separated` parameter is `true`, the function will traverse the dictionary using the parts of the string as keys. If `separated` is a string, it'll be used as the separator. If the key is not found, the function will return `nil`.

	```lua
	local dictionary = {
		foo = {
			bar = {
				baz = "qux"
			}
		}
	}

	get(dictionary, "foo.bar.baz") -- nil
	get(dictionary, "foo.bar.baz", true) -- "qux"
	get(dictionary, "foo$bar$baz", "$") -- "qux"
	```
]=]
local function get<K, V>(dictionary: { [K]: V }, key: K, separated: (string | boolean)?): V?
    if not separated then
        return dictionary[key]
    end

    local separator = type(separated) == "string" and separated or "."
    local parts: { string } = (key :: any):split(separator)
    local value: any = dictionary

    while #parts > 0 do
        local part = table.remove(parts, 1)
        value = value[part]

        if value == nil then
            return nil
        end
    end

    return value
end

return get
