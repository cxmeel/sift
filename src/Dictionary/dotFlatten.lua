--!strict
local function escapePath(path: any): string
	path = tostring(path):gsub("\\", "\\\\")
	path = path:gsub("%.", "\\.")
	path = path:gsub("%[", "\\[")

	return path
end

--[=[
  @function dotFlatten
  @within Dictionary

  @param dictionary { [any]: any }
  @returns { [string]: any }

  Flattens a dictionary recursively, converting nested dictionaries
  into dot-notation paths.

  ```lua
  local dictionary = {
    hello = {
      world = "hello!",
      cat = "meow",
      animal = {
        dog = "woof",
        unicorn = "sparkle",
      },
    },
    world = {
      "earth",
      "venus",
      "mars",
      "robloxia",
    }
  }

  local flattened = dotFlatten(dictionary)
  -- {
  --   hello.world = "hello!",
  --   hello.cat = "meow",
  --   hello.animal.dog = "woof",
  --   hello.animal.unicorn = "sparkle",
  --   world[0] = "earth",
  --   world[1] = "venus",
  --   world[2] = "mars",
  --   world[3] = "robloxia",
  -- }
  ```
]=]
local function dotFlatten(dictionary: { [any]: any }): { [string]: any }
	local result = {}

	for key, value in pairs(dictionary) do
		key = if type(key) == "number" then "[" .. tostring(key) .. "]" else escapePath(key)

		if type(value) == "table" then
			for subKey, subValue in pairs(dotFlatten(value)) do
				if subKey:sub(1, 1) == "[" then
					result[key .. subKey] = subValue
				else
					result[key .. "." .. subKey] = subValue
				end
			end
		else
			result[key] = value
		end
	end

	return result
end

return dotFlatten
