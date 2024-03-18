local fs = require("@lune/fs")
local process = require("@lune/process")

local crayon = require("./lib/crayon")

local cwd = process.cwd:gsub("\\", "/"):gsub("/$", "")
local src = `{cwd}/src`

local function get_files_flat(dir: string)
    local files = {}

    for _, file in fs.readDir(dir) do
        local fullPath = `{dir}/{file}`

        if fs.isFile(fullPath) then
            table.insert(files, fullPath)
            continue
        end

        for _, subpath in get_files_flat(fullPath) do
            table.insert(files, subpath)
        end
    end

    return files
end

local function fix_identation(contents: string)
    local lines = contents:split("\n")
    local out = {}

    for index, line in lines do
        local prevLine = lines[index - 1] or ""

        -- or prevLine was opening multiline comment
        if
            #line == 0
            and (
                index == 1
                or #prevLine == 0
                or prevLine:match("^%s*[%-%-]+%[")
                or prevLine:match("%]%p*%]%s*$")
            )
        then
            continue
        end

        local originalIndent, content = line:match("^(%s*)(.*)$")
        local indent = (originalIndent :: string):gsub("\t", "    ")

        if #indent % 4 ~= 0 then
            indent ..= (" "):rep(4 - #indent % 4)
        end

        table.insert(out, `{indent}{content}`)
    end

    return table.concat(out, "\n")
end

local function main()
    local fixedCount = 0

    for _, file in get_files_flat(src) do
        if not file:match("%.luau?$") then
            continue
        end

        local relativePath = file:sub(#src + 2)
        local contents = fs.readFile(file)

        local fixed = fix_identation(contents)

        if contents ~= fixed then
            fs.writeFile(file, fixed)

            print(
                crayon.label("FIXED", crayon.bgGreenBright),
                "Indentation fixed in",
                crayon.yellow(`"./{relativePath}"`)
            )

            fixedCount += 1
        end
    end

    process.spawn("stylua", { src })

    print(
        crayon.label("DONE", crayon.bgGreen),
        "Fixed indentation in",
        crayon.bold(tostring(fixedCount)),
        "files, and formatted",
        crayon.yellow(`"./{src:sub(#cwd + 2)}"`),
        "with stylua"
    )
end

main()
