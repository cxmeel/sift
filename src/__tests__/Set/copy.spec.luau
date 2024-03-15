return function()
	local copy = require(script.Parent.copy)

	it("should copy a set", function()
		local set = { hello = true }

		local newSet = copy(set)

		expect(newSet).to.be.a("table")
		expect(newSet).never.to.equal(set)

		expect(newSet.hello).to.equal(true)
	end)
end
