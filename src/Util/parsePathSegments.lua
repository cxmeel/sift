local push = table.insert

local digits = {}
do
	for i = 0, 9 do
		digits[tostring(i)] = true
	end
end

local function parsePathSegments(path: string): { string }
	local characters = string.split(path, "")
	local segments = {}

	local currentSegment = ""
	local currentPart = "start"
	local isIgnoring = false

	for _, character in ipairs(characters) do
		if character == "\\" then
			assert(currentPart ~= "index", "Invalid character in index")
			assert(currentPart ~= "indexEnd", "Invalid character after index")

			if isIgnoring then
				currentSegment ..= character
			end

			currentPart = "property"
			isIgnoring = not isIgnoring
			continue
		end

		if character == "." then
			assert(currentPart ~= "index", "Invalid character in index")

			if currentPart == "indexEnd" then
				currentPart = "property"
				continue
			end

			if isIgnoring then
				isIgnoring = false
				currentSegment ..= character
				continue
			end

			push(segments, currentSegment)

			currentSegment = ""
			currentPart = "property"

			continue
		end

		if character == "[" then
			assert(currentPart ~= "index", "Invalid character in index")

			if currentPart == "indexEnd" then
				currentPart = "index"
				continue
			end

			if isIgnoring then
				isIgnoring = false
				currentSegment ..= character
				continue
			end

			if currentPart == "property" then
				push(segments, currentSegment)
				currentSegment = ""
			end

			currentPart = "index"
			continue
		end

		if character == "]" then
			if currentPart == "index" then
				push(segments, tonumber(currentSegment, 10))

				currentSegment = ""
				currentPart = "indexEnd"

				continue
			end

			assert(currentPart ~= "indexEnd", "Invalid character after index")
		end

		if currentPart == "index" and not digits[character] then
			error("Invalid character in index", 2)
		end

		if currentPart == "indexEnd" then
			error("Invalid character after index", 2)
		end

		if currentPart == "start" then
			currentPart = "property"
		end

		if isIgnoring then
			isIgnoring = false
			currentSegment ..= "\\"
		end

		currentSegment ..= character
	end

	if isIgnoring then
		currentSegment ..= "\\"
	end

	if currentPart == "property" then
		push(segments, currentSegment)
	elseif currentPart == "index" then
		error("Index not closed", 2)
	elseif currentPart == "start" then
		push(segments, "")
	end

	return segments
end

return parsePathSegments
