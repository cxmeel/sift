return function()
	local RemoveKey = require(script.Parent.removeKey)

	it("should return a new dictionary with the given key removed", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local newDictionary = RemoveKey(dictionary, "goodbye")

		expect(newDictionary).to.be.a("table")

		expect(newDictionary.hello).to.equal("roblox")
		expect(newDictionary.goodbye).to.equal(nil)
	end)

	it("should not modify the original dictionary", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		RemoveKey(dictionary, "goodbye")

		expect(dictionary).to.be.a("table")

		expect(dictionary.hello).to.equal("roblox")
		expect(dictionary.goodbye).to.equal("world")
	end)
end
