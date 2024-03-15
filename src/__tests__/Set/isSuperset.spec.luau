return function()
	local isSuperset = require(script.Parent.isSuperset)

	it("should check if a set is a superset of another set", function()
		local set = { hello = true, world = true }
		local otherSet = { hello = true }

		expect(isSuperset(set, otherSet)).to.equal(true)
		expect(isSuperset(otherSet, set)).to.equal(false)
	end)
end
