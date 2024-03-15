return function()
	local fromArray = require(script.Parent.fromArray)

	it("should create a set from an array", function()
		local set = fromArray({ "hello", "world" })

		expect(set).to.be.a("table")

		expect(set.hello).to.equal(true)
		expect(set.world).to.equal(true)
	end)
end
