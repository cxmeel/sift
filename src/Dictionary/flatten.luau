local INF = newproxy()

--[=[
    @within Dictionary

    Flattens nested dictionaries into a single dictionary. The `depth` parameter specifies the depth of the flattening. If `depth` is not specified, the dictionary is flattened as much as possible.
]=]
local function flatten<K, V>(dictionary: { [any]: any }, depth: number?): { [K]: V }
    local withDepth = depth or INF
    local out = {}

    for key, value in dictionary do
        if typeof(value) == "table" and (withDepth == INF or withDepth > 0) then
            local useDepth = withDepth == INF and INF or withDepth - 1
            local nested = flatten(value, useDepth)

            for nestedKey, nestedValue in nested do
                out[nestedKey] = nestedValue
            end

            continue
        end

        out[key] = value
    end

    return out
end

return flatten
