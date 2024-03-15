--[=[
	@class Dictionary

	Dictionaries are a type of data structure that can be used to store key-value pairs.

	```lua
	local dictionary = {
		cats = 2,
		dogs = 1
	}

	print(dictionary.cats) -- 2
	```
]=]
local Dictionary = {
    copy = require("./copy"),
    copyDeep = require("./copyDeep"),
    count = require("./count"),
    entries = require("./entries"),
    equals = require("./equals"),
    equalsDeep = require("./equalsDeep"),
    every = require("./every"),
    filter = require("./filter"),
    flatten = require("./flatten"),
    flip = require("./flip"),
    freeze = require("./freeze"),
    freezeDeep = require("./freezeDeep"),
    fromArrays = require("./fromArrays"),
    fromEntries = require("./fromEntries"),
    has = require("./has"),
    includes = require("./includes"),
    keys = require("./keys"),
    map = require("./map"),
    merge = require("./merge"),
    mergeDeep = require("./mergeDeep"),
    removeKey = require("./removeKey"),
    removeKeys = require("./removeKeys"),
    removeValue = require("./removeValue"),
    removeValues = require("./removeValues"),
    set = require("./set"),
    some = require("./some"),
    update = require("./update"),
    values = require("./values"),
    withKeys = require("./withKeys"),
}

Dictionary.join = Dictionary.merge
Dictionary.joinDeep = Dictionary.mergeDeep

return Dictionary
