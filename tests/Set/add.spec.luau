return function()
	local add = require(script.Parent.add)

	it("should add values to a set", function()
		local set = { hello = true }

		local newSet = add(set, "world")

		expect(newSet).to.be.a("table")

		expect(newSet.hello).to.equal(true)
		expect(newSet.world).to.equal(true)
	end)

	it("should not modify the original set", function()
		local set = { hello = true }

		add(set, "world")

		expect(set).to.be.a("table")

		expect(set.hello).to.equal(true)
		expect(set.world).to.equal(nil)
	end)
end
