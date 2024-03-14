local fs = require("@lune/fs")
local process = require("@lune/process")
local serde = require("@lune/serde")

local crayon = require("./lib/crayon")
local semver = require("./lib/semver")

local FILES = {
	{
		file = "wally.toml",
		path = { "package", "version" },
		decode = "toml",
	},
	{
		file = "package.json",
		path = { "version" },
		decode = "json",
	},
	{
		file = "luauspec.toml",
		path = { "package", "version" },
		decode = "toml",
		optional = true,
	},
}

local function get_versions()
	local versions = {}

	local longestFileName = 0

	for index, meta in FILES do
		local contents = fs.readFile(`{process.cwd}/{meta.file}`)
		local data = serde.decode(meta.decode :: any, contents)

		local version: string = data
		local failure = false

		for _, part in meta.path do
			if not (version :: any)[part] then
				failure = true
				break
			end

			version = (version :: any)[part]
		end

		if failure and meta.optional then
			continue
		end

		longestFileName = math.max(longestFileName, #meta.file + 1)
		versions[index] = version
	end

	for index, meta in FILES do
		local fileName = `{meta.file}{(" "):rep(longestFileName - #meta.file)}`

		if not versions[index] then
			print(crayon.label("FILE", crayon.bgBlue), crayon.grey(`{fileName} -> skipped`))
			continue
		end

		print(
			crayon.label("FILE", crayon.bgBlue),
			crayon.grey(`{fileName} ->`),
			versions[index]
		)
	end

	return versions
end

local function main()
	local versions = get_versions()
	local base = semver.greatest(versions)

	for _, version in versions do
		local compare = semver.compare(version, base)

		if compare ~= 0 then
			print(
				crayon.label("ERROR", crayon.bgRed),
				"Versions do not match:",
				crayon.bold(version),
				crayon.grey("<"),
				crayon.bold(semver.stringify(base))
			)

			process.exit(1)
		end
	end
end

main()
