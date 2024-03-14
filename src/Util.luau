local function isEmpty(value)
    if typeof(value) == "table" then
        return next(value) == nil
    end

    return value == nil
end

local function areEqual(...)
    local args = { ... }
    local first = table.remove(args, 1)

    for _, value in args do
        if first ~= value then
            return false
        end
    end

    return true
end

local function normalizeIndex(index, length)
    if index == 0 then
        return 1
    elseif index < 0 then
        return index + length + 1
    end

    return index
end

return {
    isEmpty = isEmpty,
    areEqual = areEqual,
    normalizeIndex = normalizeIndex,
}
