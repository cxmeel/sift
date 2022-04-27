--!strict
--[=[
  @function Some
  @within Dictionary

  @param dictionary {[K]: V} -- The dictionary to check.
  @param predicate (value: V, key: K, dictionary: { [K]: V }) -> boolean? -- The predicate to check against.
  @return boolean -- Whether or not the predicate returned true for any value.

  Checks whether or not the predicate returned true for any value in the dictionary.

  ```lua
  local dictionary = { hello = "world", cat = "meow", unicorn = "rainbow" }

  local hasMeow = Some(dictionary, function(value)
    return value == "meow"
  end) -- true

  local hasDog = Some(dictionary, function(_, key)
    return key == "dog"
  end) -- false
  ```
]=]
local function some<K, V>(
	dictionary: { [K]: V },
	predicate: (value: V, key: V, dictionary: { [K]: V }) -> boolean?
): boolean
	for key, value in pairs(dictionary) do
		if predicate(value, key, dictionary) then
			return true
		end
	end

	return false
end

return some
