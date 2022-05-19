--!strict
local Sift = script.Parent.Parent

local Util = require(Sift.Util)
local copy = require(script.Parent.copy)

type Callback<K, V> = (key: K) -> V
type Updater<K, V> = (value: V, key: K) -> V

local function call<K, V>(callback: Callback<K, V>, key: K)
	if type(callback) == "function" then
		return callback(key)
	end
end

--[=[
  @function update
  @within Dictionary

  @param dictionary {[K]: V} -- The dictionary to update.
  @param key K -- The key to update.
  @param updater? (value: V, key: K) -> U -- The updater function.
  @param callback? (key: K) -> C -- The callback function.
  @return {[K]: V & U & C } -- The updated dictionary.

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
	dictionary: { [K]: V },
	key: K,
	updater: ((value: V, key: K) -> U)?,
	callback: ((key: K) -> C)?
): { [K]: V & U & C }
	local result = copy(dictionary)

	updater = if type(updater) == "function" then updater else Util.func.returned

	callback = if type(callback) == "function" then callback else Util.func.returned

	if result[key] ~= nil then
		result[key] = updater(result[key], key)
	else
		result[key] = call(callback, key)
	end

	return result
end

return update
