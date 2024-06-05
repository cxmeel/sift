return function()
	local IsSubset = require(script.Parent.isSubset)

	it("should check if a set is a subset of another set", function()
		local set = { hello = true, world = true }
		local otherSet = { hello = true }

		expect(IsSubset(otherSet, set)).to.equal(true)
		expect(IsSubset(set, otherSet)).to.equal(false)
	end)
end
