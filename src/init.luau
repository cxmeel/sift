-- local T = require("@Sift/Types")

--[=[
	@class Sift

	Sift is a library for working with immutable data structures. It provides a collection of methods for working with arrays, dictionaries and sets.
]=]
local Sift = {
	Array = require("@Sift/Array"),
	Dictionary = require("@Sift/Dictionary"),
	Set = require("@Sift/Set"),

	None = require("@Sift/None"),
	Types = require("@Sift/Types"),

	equalObjects = require("@Sift/Util/equalObjects"),
	isEmpty = require("@Sift/Util/isEmpty"),
}

Sift.List = Sift.Array

return Sift
