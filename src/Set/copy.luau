local copy = require("@sift/Dictionary/copy")

--[=[

  @within Set




  Creates a copy of a set.

  ```lua
  local set = { hello = true }

  local newSet = Copy(set) -- { hello = true }
  ```
]=]
return copy
