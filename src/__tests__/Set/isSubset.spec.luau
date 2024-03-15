return function()
	local isSubset = require(script.Parent.isSubset)

	it("should check if a set is a subset of another set", function()
		local set = { hello = true, world = true }
		local otherSet = { hello = true }

		expect(isSubset(otherSet, set)).to.equal(true)
		expect(isSubset(set, otherSet)).to.equal(false)
	end)
end
