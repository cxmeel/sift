return function()
	local Has = require(script.Parent.has)

	it("should return true if the dictionary has the given key", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local hasHello = Has(dictionary, "hello")

		expect(hasHello).to.equal(true)
	end)

	it("should return false if the dictionary does not have the given key", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local hasCat = Has(dictionary, "cat")

		expect(hasCat).to.equal(false)
	end)
end
