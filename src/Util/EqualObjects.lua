local function equalObjects(...)
	local firstItem = select(1, ...)

	for i = 2, select("#", ...) do
		if firstItem ~= select(i, ...) then
			return false
		end
	end

	return true
end

return equalObjects
