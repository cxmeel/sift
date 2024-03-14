--[=[
    @class Dictionary

    A collection of functions for working with dictionaries (tables with keys of any type).

    ```lua
    local dictionary = {
        hello = "world",
        foo = "bar",
        baz = "qux",
    }
    ```
]=]
local dictionary = {
    copy = require("./copy"),
    copyDeep = require("./copyDeep"),
    count = require("./count"),
    difference = require("./difference"),
    differenceDeep = require("./differenceDeep"),
    entries = require("./entries"),
    equals = require("./equals"),
    equalsDeep = require("./equalsDeep"),
    every = require("./every"),
    expandKeys = require("./expandKeys"),
    filter = require("./filter"),
    flatten = require("./flatten"),
    flattenKeys = require("./flattenKeys"),
    flip = require("./flip"),
    freeze = require("./freeze"),
    freezeDeep = require("./freezeDeep"),
    fromArrays = require("./fromArrays"),
    fromEntries = require("./fromEntries"),
    get = require("./get"),
    has = require("./has"),
    includes = require("./includes"),
    keys = require("./keys"),
    map = require("./map"),
    merge = require("./merge"),
    mergeDeep = require("./mergeDeep"),
    patchDiff = require("./patchDiff"),
    removeKey = require("./removeKey"),
    removeKeys = require("./removeKeys"),
    removeValue = require("./removeValue"),
    removeValues = require("./removeValues"),
    set = require("./set"),
    some = require("./some"),
    update = require("./update"),
    values = require("./values"),
    pick = require("./pick"),
}

dictionary.join = dictionary.merge
dictionary.joinDeep = dictionary.mergeDeep

return dictionary
