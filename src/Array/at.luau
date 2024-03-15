--[=[

	@within Array



	

	Gets a value from an array at the given index.

	```lua
	local array = { 1, 2, 3 }

	at(array, 1) -- 1
	at(array, 0) -- 3
	```
]=]
local function at<T>(array: { T }, index: number): T
    local length = #array

    if index < 1 then
        index += length
    end

    return array[index]
end

return at
