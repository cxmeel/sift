return function()
	local Set = require(script.Parent.set)

	it("should return a new dictionary with the given key/value set", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local newDictionary = Set(dictionary, "cat", "meow")

		expect(newDictionary).to.be.a("table")

		expect(newDictionary.hello).to.equal("roblox")
		expect(newDictionary.goodbye).to.equal("world")
		expect(newDictionary.cat).to.equal("meow")
	end)

	it("should not modify the original dictionary", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		Set(dictionary, "cat", "woof")

		expect(dictionary).to.be.a("table")

		expect(dictionary.cat).to.equal(nil)
	end)
end
