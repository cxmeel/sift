return function()
	local differenceSymmetric = require(script.Parent.differenceSymmetric)

	it("should return the symmetric difference between two sets", function()
		local set = { hello = true, world = true }
		local otherSet = { panda = true, cat = true }

		local newSet = differenceSymmetric(set, otherSet)

		expect(newSet).to.be.a("table")

		expect(newSet.hello).to.equal(true)
		expect(newSet.world).to.equal(true)
		expect(newSet.panda).to.equal(true)
		expect(newSet.cat).to.equal(true)
	end)

	it("should accept vararg nil values", function()
		local set = { hello = true, world = true }
		local otherSet = { panda = true, cat = true }

		local newSet = differenceSymmetric(set, nil, otherSet)

		expect(newSet).to.be.a("table")
		expect(newSet.hello).to.equal(true)
		expect(newSet.panda).to.equal(true)
	end)

	it("should accept multiple sets", function()
		local set = { hello = true, world = true }
		local otherSet = { panda = true, cat = true }
		local anotherSet = { hello = true, panda = true }

		local newSet = differenceSymmetric(set, otherSet, anotherSet)

		expect(newSet).to.be.a("table")

		expect(newSet.hello).to.equal(nil)
		expect(newSet.world).to.equal(true)
		expect(newSet.panda).to.equal(nil)
		expect(newSet.cat).to.equal(true)
	end)
end
