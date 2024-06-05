return function()
	local Has = require(script.Parent.has)

	it("should check if a value is in a set", function()
		local set = { hello = true }

		expect(Has(set, "hello")).to.equal(true)
		expect(Has(set, "world")).to.equal(false)
	end)
end
