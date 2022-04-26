--!strict
local Sift = script.Parent.Parent

local None = require(Sift.None)
local _T = require(Sift.Types)

--[=[
  @function Merge
  @within Dictionary

  @param dictionaries ...{[K]: V} -- The dictionaries to merge.
  @return {[K]: V} -- The merged dictionary.

  Merges the given dictionaries into a single dictionary. If the
  value is `None`, it will be removed from the result.

  ```lua
  local dictionary1 = { hello = "roblox", goodbye = "world" }
  local dictionary2 = { goodbye = "goodbye" }

  local merged = Merge(dictionary1, dictionary2) -- { hello = "roblox", goodbye = "goodbye" }
  ```
]=]
local function merge<T>(...: { [any]: any }): T
	local result = {}

	for _, dictionary in ipairs({ ... }) do
		for key, value in pairs(dictionary) do
			result[key] = if value == None then nil else value
		end
	end

	return result
end

return merge
