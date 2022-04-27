--!strict
local Sift = script.Parent.Parent

local Util = require(Sift.Util)

--[=[
  @function dotRestore
  @within Dictionary

  @param dictionary { [string]: any }
  @return { [any]: any }

  :::caution

  This method is experimental. It can only be accessed by requiring the
  `/Dictionary/dotRestore` file directly.

  :::

  Restores a dictionary from a dot-flattened dictionary.

  ```lua
  local dictionary = {
    ["hello.cat"] = "meow",
    ["hello.animal.dog"] = "woof",
    ["world[0]"] = "earth",
    ["world[1]"] = "venus",
  }

  local restored = dotRestore(dictionary)
  --[[
    {
      hello = {
        cat = "meow",
        animal = { dog = "woof" },
      },
      world = { "earth", "venus" },
    }
  ]]
  ```
]=]
local function dotRestore(dictionary: { [string]: any }): { [any]: any }
	local result = {}

	for path, value in pairs(dictionary) do
		local segments = Util.parsePathSegments(path) -- This converts segments back into an array of strings or numbers
		local current = result

		for index, segment in ipairs(segments) do
			if index == #segments then
				current[segment] = value
			else
				current[segment] = current[segment] or {}
				current = current[segment]
			end
		end
	end

	return result
end

return dotRestore
