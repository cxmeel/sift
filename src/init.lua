--[=[
	@class Sift

	Sift is a library for manipulating arrays. It provides a number of
	functions for manipulating arrays (lists), dictionaries, and sets.

	Sift is comprised of a number of submodules. Each submodule provides
	a number of functions for manipulating a specific type of data, and
	can be accessed via their respective names within the Sift module
	(e.g. `Sift.Array.At()`), or accessed directly (e.g. `local At = require(Sift.Array.At)`).

	See the individual submodule pages for full documentation.
]=]
local Sift = {
	Array = require(script.Array),
	Dictionary = require(script.Dictionary),
	Set = require(script.Set),

	None = require(script.None),
	Types = require(script.Types),
}

Sift.List = Sift.Array

return Sift
