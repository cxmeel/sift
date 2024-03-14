--[=[
    @within Array

    Returns the index of the last element in the array that satisfies the provided testing function. Otherwise, it returns `nil`.

    ```lua
    findWhereLast({ 1, 2, 3, 4, 5 }, function(value)
        return value % 2 == 0
    end) -- 4
    ```
]=]
local function findWhereLast<T>(
    array: { T },
    predicate: (value: T, index: number) -> boolean,
    from: number?
): number?
    if from == 0 then
        from = 1
    elseif from and from < 0 then
        from += #array + 1
    end

    for index = from or #array, 1, -1 do
        if predicate(array[index], index) then
            return index
        end
    end

    return nil
end

return findWhereLast
