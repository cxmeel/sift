--!strict
local Sift = script.Parent.Parent

local Util = require(Sift.Util)

--[=[
  @function Count
  @within Dictionary

  @param dictionary {T} -- The dictionary to count.
  @param predicate? (value?: T, key?: K) -> boolean? -- The predicate to use to filter the dictionary.
  @return number -- The number of items in the dictionary.

  Counts the number of items in a dictionary.

  ```lua
  local dictionary = { hello = "world", goodbye = "world" }

  local value = Count(dictionary) -- 2
  local value = Count(dictionary, function(item, key)
    return item == "world"
  end) -- 1
  ```
]=]
local function count<K, V>(dictionary: { [K]: V }, predicate: ((V?, K?) -> boolean?)?): number
	local counter = 0

	predicate = if type(predicate) == "function" then predicate else Util.Func.Truthy

	for key, value in pairs(dictionary) do
		if predicate(value, key) then
			counter += 1
		end
	end

	return counter
end

return count
