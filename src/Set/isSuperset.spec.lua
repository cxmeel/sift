return function()
	local IsSuperset = require(script.Parent.isSuperset)

	it("should check if a set is a superset of another set", function()
		local set = { hello = true, world = true }
		local otherSet = { hello = true }

		expect(IsSuperset(set, otherSet)).to.equal(true)
		expect(IsSuperset(otherSet, set)).to.equal(false)
	end)
end
