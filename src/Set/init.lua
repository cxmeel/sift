--[=[
  @class Set
]=]
local set = {
	add = require(script.add),
	copy = require(script.copy),
	count = require(script.count),
	delete = require(script.delete),
	filter = require(script.filter),
	fromArray = require(script.fromArray),
	has = require(script.has),
	intersection = require(script.intersection),
	isSubset = require(script.isSubset),
	isSuperset = require(script.isSuperset),
	map = require(script.map),
	merge = require(script.merge),
	toArray = require(script.toArray),
}

return set
