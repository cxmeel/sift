return function()
	local Copy = require(script.Parent.copy)

	it("should copy a set", function()
		local set = { hello = true }

		local newSet = Copy(set)

		expect(newSet).to.be.a("table")
		expect(newSet).never.to.equal(set)

		expect(newSet.hello).to.equal(true)
	end)
end
