local None = require("./None")
local Util = require("./Util")

--[=[
	@class Sift

	Sift is a library for working with immutable data structures in Lua. It provides a set of methods for working with arrays, dictionaries, and sets, as well as a few utility functions for working with objects.
]=]
local sift = {
    Array = require("./Array"),
    Dictionary = require("./Dictionary"),
    Set = require("./Set"),

    None = None,

    equalObjects = Util.areEqual,
    isEmpty = Util.isEmpty,
    resolveIndex = Util.resolveIndex,
}

sift.List = sift.Array

--- @within Sift
--- @prop Array Array

--- @within Sift
--- @prop List Array
--- @tag Alias

--- @within Sift
--- @prop Dictionary Dictionary

--- @within Sift
--- @prop Set Set

export type Dictionary<K, V> = { [K]: V }
export type Array<T> = { T }
export type List<T> = Array<T>
export type Set<T> = Dictionary<T, boolean>
export type None = None.None

return sift
