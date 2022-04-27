return function()
	local RemoveValue = require(script.Parent.removeValue)

	it("should return a new dictionary with the given value removed", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local newDictionary = RemoveValue(dictionary, "world")

		expect(newDictionary).to.be.a("table")

		expect(newDictionary.hello).to.equal("roblox")
		expect(newDictionary.goodbye).to.equal(nil)
	end)

	it("should not modify the original dictionary", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		RemoveValue(dictionary, "world")

		expect(dictionary).to.be.a("table")

		expect(dictionary.hello).to.equal("roblox")
		expect(dictionary.goodbye).to.equal("world")
	end)
end
