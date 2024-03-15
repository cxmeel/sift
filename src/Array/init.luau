--[=[
	@class Array

	An array is a table consisting of index-value pairs. You don't need to
	manually specify the indices when you create an array.

	```lua
	local array = {
		"hello",
		"world",
	}
	```

	<br><br>

	#### Aliases

	`List`
]=]
local array = {
    at = require("./at"),
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
    includes = require("./includes"),
    insert = require("./insert"),
    is = require("./is"),
    last = require("./last"),
    map = require("./map"),
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
array.has = array.includes
array.contains = array.includes
array.isArray = array.is

return array
