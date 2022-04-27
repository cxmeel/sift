return function()
	local Values = require(script.Parent.values)

	it("should return a list of the values in the dictionary", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local values = Values(dictionary)

		expect(values).to.be.a("table")
		expect(#values).to.equal(2)

		expect(values[1]).to.equal("roblox")
		expect(values[2]).to.equal("world")
	end)
end
