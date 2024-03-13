local INF = newproxy()

type FlattenableDictionary<V> = { [string]: FlattenableDictionary<V> | V }

--[=[
    @within Dictionary
]=]
local function flattenKeys<V>(
	dictionary: FlattenableDictionary<any>,
	depth: number?,
	separator: string?
): { [string]: V }
	local withSeparator = separator or "."
	local withDepth = depth or INF

	local out: { [string]: V } = {}

	for key, value in dictionary do
		if typeof(value) == "table" and depth > 0 then
			local useDepth = withDepth == INF and INF or withDepth - 1
			local nested = flattenKeys(value, useDepth, withSeparator)

			for nestedKey, nestedValue in nested do
				out[`{key}{withSeparator}{nestedKey}`] = nestedValue
			end

			continue
		end

		out[key] = value :: V
	end

	return out
end

return flattenKeys
