--!strict
local Sift = script.Parent.Parent

local Util = require(Sift.Util)

--[=[
  @function Filter
  @within Dictionary

  @param dictionary {[K]: V} -- The dictionary to filter.
  @param filterer? (value: V, key: K, dictionary: {[K]: V}) -> boolean? -- The filterer to use to filter the dictionary.
  @return {[K]: V} -- The filtered dictionary.

  Filters a dictionary.

  ```lua
  local dictionary = { hello = "world", goodbye = "goodbye" }

  local result = Filter(dictionary, function(value, key)
    return value == "world"
  end) -- { hello = "world" }
  ```
]=]
local function filter<K, V>(
	dictionary: { [K]: V },
	filterer: ((value: V, key: K, dictionary: { [K]: V }) -> boolean?)?
): { [K]: V }
	local result = {}

	filterer = if type(filterer) == "function" then filterer else Util.Func.Truthy

	for key, value in pairs(dictionary) do
		if filterer(value, key, dictionary) then
			result[key] = value
		end
	end

	return result
end

return filter
