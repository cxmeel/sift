return function()
	local has = require(script.Parent.has)

	it("should check if a value is in a set", function()
		local set = { hello = true }

		expect(has(set, "hello")).to.equal(true)
		expect(has(set, "world")).to.equal(false)
	end)
end
