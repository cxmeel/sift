return function()
	local Add = require(script.Parent.add)

	it("should add values to a set", function()
		local set = { hello = true }

		local newSet = Add(set, "world")

		expect(newSet).to.be.a("table")

		expect(newSet.hello).to.equal(true)
		expect(newSet.world).to.equal(true)
	end)

	it("should not modify the original set", function()
		local set = { hello = true }

		Add(set, "world")

		expect(set).to.be.a("table")

		expect(set.hello).to.equal(true)
		expect(set.world).to.equal(nil)
	end)
end
