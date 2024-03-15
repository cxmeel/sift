local copy = require("./copy")

type Callback<K, V> = (key: K) -> V
type Updater<K, V> = (value: V, key: K) -> V

local function call<K, V>(callback: Callback<K, V>, key: K)
    if typeof(callback) == "function" then
        return callback(key)
    end
end

--[=[

  @within Dictionary







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

    if result[key] ~= nil then
        if updater then
            result[key] = updater(result[key], key)
        end
    else
        if callback then
            result[key] = call(callback, key)
        end
    end

    return result
end

return update
