--!strict
--[=[
  @function Flip
  @within Dictionary

  @param dictionary T -- The dictionary to flip.
  @return T -- The flipped dictionary.

  Flips a dictionary. Keys become values and values become keys.

  ```lua
  local dictionary = { hello = "roblox", goodbye = "world" }

  local new = Flip(dictionary) -- { world = "goodbye", roblox = "hello" }
  ```
]=]
local function flip<T>(dictionary: T): T
	local result = {}

	for key, value in pairs(dictionary) do
		result[value] = key
	end

	return result
end

return flip
