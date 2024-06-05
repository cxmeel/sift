return function()
	local ToArray = require(script.Parent.toArray)

	it("should convert a set to an array", function()
		local set = { hello = true, world = true }

		local array = ToArray(set)

		expect(array).to.be.a("table")
		expect(array).never.to.equal(set)

		expect(array[1]).to.equal("hello")
		expect(array[2]).to.equal("world")
	end)

	it("should not modify the original set", function()
		local set = { hello = true }

		ToArray(set)

		expect(set).to.be.a("table")

		expect(set.hello).to.equal(true)
	end)
end
