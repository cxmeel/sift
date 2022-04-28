--!strict
--[=[
  @function merge
  @within Set

  @param ... ...{ [any]: boolean } -- The sets to merge.
  @return { [T]: boolean } -- The merged set.

  Combines one or more sets into a single set.

  ```lua
  local set1 = { hello = true, world = true }
  local set2 = { cat = true, dog = true, hello = true }

  local merge = Merge(set1, set2) -- { hello = true, world = true, cat = true, dog = true }
  ```
]=]
local function merge<T>(...: { [any]: boolean }): { [T]: boolean }
	local result = {}

	for _, set in ipairs({ ... }) do
		for key, _ in pairs(set) do
			result[key] = true
		end
	end

	return result
end

return merge
