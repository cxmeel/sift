--[=[

  @within Set





  Iterates over a set, calling a mapper function for each item.

  ```lua
  local set = { hello = true, world = true }

  local mappedSet = Map(set, function(value)
    return value .. "!"
  end) -- { ["hello!"] = true, ["world!"] = true }
  ```
]=]
local function map<T, U>(set: { [T]: boolean }, mapper: (T, { [T]: boolean }) -> U): { [U]: boolean }
    local result = {}

    for key, _ in set do
        local mappedKey = mapper(key, set)

        if mappedKey ~= nil then
            result[mappedKey] = true
        end
    end

    return result
end

return map
