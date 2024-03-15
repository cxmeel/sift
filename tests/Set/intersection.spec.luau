return function()
	local intersection = require(script.Parent.intersection)

	it("should return the intersection of two sets", function()
		local set1 = { hello = true, world = true }
		local set2 = { world = true, cat = true }

		local newSet = intersection(set1, set2)

		expect(newSet).to.be.a("table")

		expect(newSet.hello).to.equal(nil)
		expect(newSet.world).to.equal(true)
		expect(newSet.cat).to.equal(nil)
	end)
end
