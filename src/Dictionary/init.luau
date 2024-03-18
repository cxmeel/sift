--[=[
    @class Dictionary

    Dictionaries are a type of data structure that can be used to store key-value pairs.

    ```lua
    local dictionary = {
        cats = true,
        dogs = false,
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
    pick = require("./pick"),
    removeKey = require("./removeKey"),
    removeKeys = require("./removeKeys"),
    removeValue = require("./removeValue"),
    removeValues = require("./removeValues"),
    set = require("./set"),
    some = require("./some"),
    update = require("./update"),
    values = require("./values"),
}

dictionary.clone = dictionary.copy
dictionary.cloneDeep = dictionary.copyDeep
dictionary.diff = dictionary.difference
dictionary.diffDeep = dictionary.differenceDeep
dictionary.join = dictionary.merge
dictionary.joinDeep = dictionary.mergeDeep
dictionary.withKeys = dictionary.pick

return dictionary
