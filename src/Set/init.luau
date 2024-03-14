--[=[
    @class Set

    A set is a collection of unique values.

    ```lua
    local set = { a = true, b = true, c = true }
    fromArray({ 1, 2, 3 }) -- { [1] = true, [2] = true, [3] = true }
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
    partition = require("./partition"),
    toArray = require("./toArray"),
}

set.fromList = set.fromArray
set.join = set.merge
set.subtract = set.delete
set.union = set.merge

return set
