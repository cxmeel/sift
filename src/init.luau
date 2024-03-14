local Util = require("@Sift/Util")

--[=[
    @class Sift

    Sift is a library for working with immutable data structures. It provides a collection of methods for working with arrays, dictionaries and sets.
]=]
local sift = {
    None = require("@Sift/None"),

    Array = require("@Sift/Array"),
    Dictionary = require("@Sift/Dictionary"),
    Set = require("@Sift/Set"),

    areEqual = Util.areEqual,
    isEmpty = Util.isEmpty,
    normalizeIndex = Util.normalizeIndex,
}

sift.List = sift.Array

--- @prop Array Array
--- @within Sift

--- @prop Dictionary Dictionary
--- @within Sift

--- @prop Set Set
--- @within Sift

return sift
