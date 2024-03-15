--[=[
	@class Set

	Sets are a collection of values. They are used to store unique values.
	They are essentially a dictionary, but each value is stored as a boolean.
	This means that a value can only appear in a set once.

	```lua
	local set = { foo = true, bar = true }
	```
]=]
local set = {
    add = require("./add"),
    copy = require("./copy"),
    count = require("./count"),
    delete = require("./delete"),
    difference = require("./difference"),
    differenceSymmetric = require("./differenceSymmetric"),
    filter = require("./filter"),
    fromArray = require("./fromArray"),
    has = require("./has"),
    intersection = require("./intersection"),
    isSubset = require("./isSubset"),
    isSuperset = require("./isSuperset"),
    map = require("./map"),
    merge = require("./merge"),
    toArray = require("./toArray"),
}

set.diff = set.difference
set.symDiff = set.differenceSymmetric
set.fromList = set.fromArray
set.join = set.merge
set.subtract = set.delete
set.union = set.merge

return set
