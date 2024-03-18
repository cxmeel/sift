local fs = require("@lune/fs")
local process = require("@lune/process")

local crayon = require("./lib/crayon")

local cwd = process.cwd:gsub("\\", "/"):gsub("/$", "")
local src = `{cwd}/src`

local function utf8_equals(a: string, b: string)
    if #a ~= #b then
        return false
    end

    for byteOffset, codepoint in utf8.codes(a) do
        if utf8.codepoint(b, byteOffset) ~= codepoint then
            return false
        end
    end

    return true
end

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

local function format_doc_comments(contents: string)
    return contents:gsub(
        "^%s*(%-%-%[%=%[)(.-)(%]=%])",
        function(open: string, comment: string, close: string)
            local lines = comment:split("\n")
            local out = {}

            for index, line in lines do
                -- Remove duplicate blank lines
                local lineNoWhitespace = line:gsub("%s", "")

                if index == 1 and lineNoWhitespace == "" then
                    continue
                end

                local prevLine = lines[index - 1]
                local prevLineNoWhitespace = prevLine:gsub("%s", "")

                if lineNoWhitespace == "" and prevLineNoWhitespace == "" then
                    continue
                end

                -- Fix indentation
                line = line:gsub("^\t+", function(tabs)
                    return string.rep("    ", #tabs)
                end)

                local indentation = line:match("^%s*")

                if indentation and #indentation % 4 ~= 0 then
                    line = `{(" "):rep(4 - (#indentation % 4))}{line}`
                end

                -- Remove trailing whitespace
                line = line:gsub("%s+$", "")

                table.insert(out, line)
            end

            if out[#out]:gsub("%s", "") == "" then
                table.remove(out)
            end

            return `{open}\n{table.concat(out, "\n")}\n{close}`
        end :: any
    )
end

local function format_file(full_path: string)
    local contents = fs.readFile(full_path)
    local formatted = contents

    formatted = format_doc_comments(contents)

    if utf8_equals(contents, formatted) then
        return false
    end

    fs.writeFile(full_path, formatted)

    return true
end

local function main()
    local modified_files = 0

    for _, file_path in get_files_flat(src) do
        if not file_path:match("%.luau?$") then
            continue
        end

        if not format_file(file_path) then
            continue
        end

        local relative_path = file_path:sub(#cwd + 2)

        print(
            crayon.label("MODIFIED", crayon.bgYellow),
            "Formatted doc comments in",
            crayon.yellow(`"./{relative_path}"`)
        )

        modified_files += 1
    end

    process.spawn("stylua", { "src" })

    print(
        crayon.label("DONE", crayon.bgGreen),
        "Formatted",
        crayon.bold(modified_files),
        "files in",
        crayon.yellow(`"./{src:sub(#cwd + 2)}"`)
    )
end

main()
