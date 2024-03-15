local Copy = require("./copy")
local Util = require("@sift/Util")

type Callback<T> = (index: number) -> T
type Updater<T> = (currentValue: T, index: number) -> T

local function call<T>(callback: Callback<T>, index: number)
    if typeof(callback) == "function" then
        return callback(index)
    end
end

--[=[

	@within Array







	Updates an array at the given index. If the value at the given index does
	not exist, `callback` will be called, and its return value will be used
	as the value at the given index.

	```lua
	local array = { 1, 2, 3 }

	local new = Update(array, 2, function(value)
		return value + 1
	end) -- { 2, 3, 3 }

	local new = Update(array, 4, function(value)
		return value + 1
	end, function(value)
		return 10
	end) -- { 1, 2, 3, 10 }
	```
]=]
local function update<T>(
    array: { T },
    index: number,
    updater: Updater<T>?,
    callback: Callback<T>?
): { T }
    local length = #array
    local result = Copy(array)

    if index < 1 then
        index += length
    end

    updater = if typeof(updater) == "function" then updater else Util.func.returned

    if result[index] ~= nil then
        result[index] = updater(result[index], index)
    else
        result[index] = call(callback, index)
    end

    return result
end

return update
