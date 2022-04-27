return function()
	local RemoveValues = require(script.Parent.removeValues)

	it("should return a new dictionary with the given values removed", function()
		local dictionary = { hello = "world", goodbye = "world", cat = "meow", dog = "woof" }

		local newDictionary = RemoveValues(dictionary, "world")

		expect(newDictionary).to.be.a("table")

		expect(newDictionary.hello).to.equal(nil)
		expect(newDictionary.goodbye).to.equal(nil)
		expect(newDictionary.cat).to.equal("meow")
		expect(newDictionary.dog).to.equal("woof")
	end)

	it("should not modify the original dictionary", function()
		local dictionary = { hello = "world", goodbye = "world", cat = "meow", dog = "woof" }

		RemoveValues(dictionary, "world")

		expect(dictionary).to.be.a("table")

		expect(dictionary.hello).to.equal("world")
		expect(dictionary.goodbye).to.equal("world")
		expect(dictionary.cat).to.equal("meow")
		expect(dictionary.dog).to.equal("woof")
	end)
end
