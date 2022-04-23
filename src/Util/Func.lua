local function truthy()
	return true
end

local function noop() end

local function returned(...)
	return ...
end

return {
	Truthy = truthy,
	Noop = noop,
	Returned = returned,
}
