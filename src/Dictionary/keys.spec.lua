return function()
	local Keys = require(script.Parent.keys)

	it("should return an array of the keys in the dictionary", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local keys = Keys(dictionary)

		expect(keys).to.be.a("table")
		expect(#keys).to.equal(2)

		expect(keys[1]).to.equal("hello")
		expect(keys[2]).to.equal("goodbye")
	end)
end
