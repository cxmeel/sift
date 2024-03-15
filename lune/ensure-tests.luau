local fs = require("@lune/fs")
local process = require("@lune/process")

local crayon = require("./lib/crayon")

local cwd = process.cwd:gsub("\\", "/"):gsub("/$", "")
local src = `{cwd}/src`
local tests = `{src}/__tests__`

local IGNORED_FILES = {
    `{src}/Array/init.luau`,
    `{src}/Dictionary/init.luau`,
    `{src}/Set/init.luau`,
    `{src}/init.luau`,
    `{src}/None.luau`,
    `{src}/Util.luau`,
}

local function get_file_paths(root: string)
    local paths = {}

    for _, path in fs.readDir(root) do
        local fullPath = `{root}/{path}`

        if fs.isFile(fullPath) then
            table.insert(paths, fullPath)
            continue
        end

        if fs.isDir(fullPath) and fullPath == tests then
            continue
        end

        for _, subpath in get_file_paths(fullPath) do
            table.insert(paths, subpath)
        end
    end

    return paths
end

local function main()
    local files = get_file_paths(src)
    local missing = 0

    for _, file in files do
        if not file:match("%.luau?$") or table.find(IGNORED_FILES, file) then
            continue
        end

        local relativePath = file:sub(#src + 2)
        local testFilePath = (`{tests}/{relativePath}`):gsub("%.luau$", ".spec.luau")

        if not fs.isFile(testFilePath) then
            print(
                crayon.label("MISSING", crayon.bgRedBright),
                "No test found for",
                crayon.yellow(`"./{relativePath}"`)
            )

            missing += 1
            continue
        end
    end

    if missing > 0 then
        print(
            crayon.label("FAIL", crayon.bgRed),
            "Missing",
            crayon.bold(tostring(missing)),
            "test files."
        )

        process.exit(1)
    end
end

main()
