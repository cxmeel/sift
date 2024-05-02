--!strict
local copy = require(script.Parent.copy)

--[=[
  @function update
  @within Dictionary

  @param dictionary {[K]: V?} -- The dictionary to update.
  @param key K -- The key to update.
  @param updater? (value: V, key: K) -> U -- The updater function.
  @param callback? (key: K) -> C -- The callback function.
  @return {[K]: V | U | C} -- The updated dictionary.

  Updates a value in a dictionary at the given key. If the value at the given key does not exist, `callback` will be called, and its return value will be used as the value at the given key.

  ```lua
  local dictionary = { cats = 2 }

  local new = Update(dictionary, "cats", function(value)
    return value + 1
  end) -- { cats = 3 }

  local new = Update(dictionary, "dogs", function(value)
    return value + 1
  end, function(value)
    return 1
  end) -- { cats = 3, dogs = 1 }
  ```
]=]
local function update<K, V, U, C>(
	dictionary: { [K]: V? },
	key: K,
	updater: ((value: V, key: K) -> U)?,
	callback: ((key: K) -> C)?
): { [K]: V | U | C }
	local result: { [K]: any } = copy(dictionary)

	if result[key] then
		if updater then
			result[key] = updater(result[key], key)
		end
	else
		if typeof(callback) == "function" then
			result[key] = callback(key)
		end
	end

	return result
end

return update
