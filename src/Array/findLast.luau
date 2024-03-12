--[=[
    @within Array

    Returns the last index at which a given element can be found in the array, or `nil` if it is not present. The array is searched backwards, starting at the optional `from` index. If `from` is negative, it is used as the offset from the end of the array.

    ```lua
    local array = { "a", "b", "c", "a", "b" }

    findLast(array, "b") -- 5
    findLast(array, "b", 3) -- 2
    findLast(array, "b", -3) -- 2
    ```
]=]
local function findLast<T>(array: { T }, value: T, from: number?): number?
	if from == 0 then
		from = 1
	elseif from and from < 0 then
		from += #array + 1
	end

	for i = from or #array, 1, -1 do
		if array[i] == value then
			return i
		end
	end

	return nil
end

return findLast
