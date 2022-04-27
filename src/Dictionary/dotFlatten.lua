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
  @tag Experimental

  @param dictionary { [any]: any }
  @return { [string]: any }

  :::caution

  This method is experimental. It can only be accessed by requiring the
  `/Dictionary/dotFlatten` file directly.

  :::

  Flattens a dictionary recursively, converting nested dictionaries
  into dot-notation paths.

  ```lua
  local dictionary = {
    hello = {
      cat = "meow",
      animal = { dog = "woof" },
    },
    world = { "earth", "venus" },
  }

  local flattened = dotFlatten(dictionary)
  --[[
    {
      hello.cat = "meow",
      hello.animal.dog = "woof",
      world[0] = "earth",
      world[1] = "venus",
    }
  ]]
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
