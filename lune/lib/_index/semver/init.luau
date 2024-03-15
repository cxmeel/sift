export type Semver = { major: number, minor: number, patch: number }

local function parse(version: string | Semver): Semver
	if typeof(version) == "table" then
		return version
	end

	local major, minor, patch = version:match("(%d+)%.(%d+)%.(%d+)")

	return {
		major = tonumber(major) or 0,
		minor = tonumber(minor) or 0,
		patch = tonumber(patch) or 0,
	}
end

local function stringify(version: Semver): string
	return `{version.major}.{version.minor}.{version.patch}`
end

local function compare(a: string | Semver, b: string | Semver)
	local verA = if typeof(a) == "table" then a else parse(a)
	local verB = if typeof(b) == "table" then b else parse(b)

	if verA.major < verB.major then
		return -1
	end

	if verA.major > verB.major then
		return 1
	end

	if verA.minor < verB.minor then
		return -1
	end

	if verA.minor > verB.minor then
		return 1
	end

	if verA.patch < verB.patch then
		return -1
	end

	if verA.patch > verB.patch then
		return 1
	end

	return 0
end

local function greatest(versions: { string | Semver }): Semver
	local out

	for _, version in versions do
		if out == nil then
			out = version
			continue
		end

		if compare(version, out) > 0 then
			out = version
		end
	end

	return parse(out)
end

return {
	parse = parse,
	stringify = stringify,
	compare = compare,
	greatest = greatest,
}
