return function()
	local merge = require(script.Parent.merge)

	it("should merge two sets", function()
		local set = { hello = true, world = true }
		local otherSet = { panda = true, cat = true }

		local newSet = merge(set, otherSet)

		expect(newSet).to.be.a("table")

		expect(newSet.hello).to.equal(true)
		expect(newSet.world).to.equal(true)
		expect(newSet.panda).to.equal(true)
		expect(newSet.cat).to.equal(true)
	end)

	it("should accept nil values", function()
		local set = { hello = true, world = true }
		local otherSet = { panda = true, cat = true }

		local newSet = merge(set, nil, otherSet)
		local newSet2 = merge(nil, set, otherSet)

		expect(newSet).to.be.a("table")
		expect(newSet.hello).to.equal(true)
		expect(newSet.panda).to.equal(true)

		expect(newSet2).to.be.a("table")
		expect(newSet2.cat).to.equal(true)
		expect(newSet2.world).to.equal(true)
	end)
end
