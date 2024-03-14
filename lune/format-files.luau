local fs = require("@lune/fs")
local process = require("@lune/process")

local crayon = require("./lib/crayon")

local cwd = process.cwd:gsub("\\", "/"):gsub("//", "/"):gsub("/$", "")
local dir = process.args[1]:gsub("\\", "/"):gsub("//", "/"):gsub("/$", "")
local activeRoot = `{cwd}/{dir}`

local function get_file_paths(root: string)
    local paths = {}

    for _, path in fs.readDir(root) do
        local fullPath = `{root}/{path}`

        if fs.isFile(fullPath) then
            table.insert(paths, fullPath)
            continue
        end

        for _, subpath in get_file_paths(fullPath) do
            table.insert(paths, subpath)
        end
    end

    return paths
end

local function main()
    -- Replace tabs with spaces
    print(
        crayon.label("INFO", crayon.bgBlue),
        "scanning for files in",
        crayon.yellow(`"./{dir}"`)
    )

    for _, file in get_file_paths(activeRoot) do
        if not file:match("%.luau?$") then
            continue
        end

        local contents = fs.readFile(file)
        local newContents = contents:gsub(
            "(\t+)([^\n]+)",
            function(tabs, rest)
                return `{(" "):rep(#tabs * 4)}{rest}`
            end :: any
        )

        if contents == newContents then
            continue
        end

        print(
            crayon.label("FORMAT", crayon.bgGreen),
            "fixed indentation in",
            crayon.yellow(`"./{file:sub(#cwd + 2)}"`)
        )

        fs.writeFile(file, newContents)
    end

    -- Format code with stylua
    local status = process.spawn("stylua", { activeRoot })

    if not status.ok then
        print(crayon.label("ERROR", crayon.bgRed), "failed to format code with stylua")
        process.exit(1)
        return
    end

    print(crayon.label("SUCCESS", crayon.bgGreen), "formatted code with stylua")
end

main()
