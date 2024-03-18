local fs = require("@lune/fs")
local process = require("@lune/process")
local stdio = require("@lune/stdio")
local task = require("@lune/task")

local crayon = require("./lib/crayon")

local cwd = process.cwd:gsub("\\", "/"):gsub("/$", "")
local src = `{cwd}/src`

local _prev_output = ""
local function overprint(...)
    local args = { ... }

    for index, arg in args do
        args[index] = tostring(arg)
    end

    local output = table.concat(args, " ")
    local clear = string.rep(" ", #_prev_output)

    stdio.write(`\r{clear}\r{output}`)
    _prev_output = output
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
    return contents:gsub("%-%-%[%=%[(.-)%]=%]", function(comment)
        local out = {}

        for _, line in comment:split("\n") do
            table.insert(out, line)
        end

        return table.concat(out, "\n")
    end)
end

local function format_file(full_path: string)
    local contents = fs.readFile(full_path)
    local formatted = contents

    formatted = format_doc_comments(contents)

    fs.writeFile(full_path, formatted)
end

local function main()
    local threads = {}

    for _, file_path in get_files_flat(src) do
        if not file_path:match("%.luau?$") then
            continue
        end

        local thread = task.spawn(format_file, file_path)
        table.insert(threads, thread)
    end

    while true do
        local live_threads = 0

        for _, thread in threads do
            if coroutine.status(thread) ~= "dead" then
                live_threads += 1
            end
        end

        overprint(
            `{crayon.label("FORMATTING", crayon.bgBlue)}{crayon.label(
                `{live_threads}/{#threads}`,
                crayon.bgBlueBright
            )}`,
            " Formatting files..."
        )

        if live_threads == 0 then
            break
        end

        task.wait(1 / 1000)
    end

    overprint(
        crayon.label("DONE", crayon.bgGreen),
        "Formatted",
        crayon.bold(#threads),
        "files in",
        crayon.yellow(`"./{src:sub(#cwd + 2)}"`),
        "\n"
    )
end

main()
