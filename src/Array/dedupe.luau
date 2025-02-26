local fromArray = require(script.Parent.Parent.Set.fromArray)
local toArray = require(script.Parent.Parent.Set.toArray)

local function dedupe<T>(arr: { T }): { T }
    return toArray(fromArray(arr))
end

return dedupe
