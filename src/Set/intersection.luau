--[=[
  @within Set

  Creates the intersection of multiple sets. The intersection
  is when both sets have a value in common. Unmatched values
  are discarded.

  ```lua
  local set1 = { hello = true, world = true }
  local set2 = { world = true, universe = true }

  intersection(set1, set2) -- { world = true }
  ```
]=]
local function intersection<T>(...: { [T]: boolean }): { [T]: boolean }
    local args = { ... }
    local first = table.remove(args, 1) :: { [T]: boolean }

    local out = {}

    for key in first do
        local intersects = true

        for _, set in args do
            if not set[key] then
                intersects = false
                break
            end
        end

        if intersects then
            out[key] = true
        end
    end

    return out
end

return intersection
