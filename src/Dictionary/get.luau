--[=[
    @within Dictionary
]=]
local function get<K, V>(dictionary: { [K]: V }, key: K, dotSeparated: boolean?): V?
	if not dotSeparated then
		return dictionary[key]
	end

	local parts: { string } = (key :: any):split(".")
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
