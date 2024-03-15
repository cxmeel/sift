--[=[
    @class Array

    An array is a collection of values, each identified by a numeric index. Luau arrays are 1-based, meaning the first element is at index 1, the second element is at index 2, and so on.

    #### Aliases

    `List`

    ```lua
    local array = { 1, 2, 3 }
    ```
]=]
local array = {
    at = require("./at"),
    cartesian = require("./cartesian"),
    concat = require("./concat"),
    concatDeep = require("./concatDeep"),
    copy = require("./copy"),
    copyDeep = require("./copyDeep"),
    count = require("./count"),
    create = require("./create"),
    difference = require("./difference"),
    differenceSymmetric = require("./differenceSymmetric"),
    equals = require("./equals"),
    equalsDeep = require("./equalsDeep"),
    every = require("./every"),
    filter = require("./filter"),
    find = require("./find"),
    findLast = require("./findLast"),
    findWhere = require("./findWhere"),
    findWhereLast = require("./findWhereLast"),
    first = require("./first"),
    flatten = require("./flatten"),
    freeze = require("./freeze"),
    freezeDeep = require("./freezeDeep"),
    group = require("./group"),
    includes = require("./includes"),
    insert = require("./insert"),
    is = require("./is"),
    last = require("./last"),
    map = require("./map"),
    partition = require("./partition"),
    permutations = require("./permutations"),
    pop = require("./pop"),
    push = require("./push"),
    reduce = require("./reduce"),
    reduceRight = require("./reduceRight"),
    removeIndex = require("./removeIndex"),
    removeIndices = require("./removeIndices"),
    removeValue = require("./removeValue"),
    removeValues = require("./removeValues"),
    reverse = require("./reverse"),
    set = require("./set"),
    shift = require("./shift"),
    shuffle = require("./shuffle"),
    slice = require("./slice"),
    some = require("./some"),
    sort = require("./sort"),
    splice = require("./splice"),
    toSet = require("./toSet"),
    unique = require("./unique"),
    unshift = require("./unshift"),
    update = require("./update"),
    zip = require("./zip"),
    zipAll = require("./zipAll"),
}

array.join = array.concat
array.merge = array.concat
array.joinDeep = array.concatDeep
array.mergeDeep = array.concatDeep
array.clone = array.copy
array.cloneDeep = array.copyDeep
array.diff = array.difference
array.symDiff = array.differenceSymmetric
array.append = array.push
array.prepend = array.unshift
array.indexOf = array.find
array.lastIndexOf = array.findLast
array.has = array.includes
array.contains = array.includes
array.isArray = array.is

return array
