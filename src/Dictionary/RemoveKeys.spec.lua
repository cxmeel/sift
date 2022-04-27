return function()
	local RemoveKeys = require(script.Parent.removeKeys)

	it("should return a new dictionary with the given keys removed", function()
		local dictionary = { hello = "world", cat = "meow", dog = "woof", unicorn = "rainbow" }

		local newDictionary = RemoveKeys(dictionary, "cat", "dog")

		expect(newDictionary).to.be.a("table")

		expect(newDictionary.hello).to.equal("world")
		expect(newDictionary.cat).to.equal(nil)
		expect(newDictionary.dog).to.equal(nil)
		expect(newDictionary.unicorn).to.equal("rainbow")
	end)

	it("should not modify the original dictionary", function()
		local dictionary = { hello = "world", cat = "meow", dog = "woof", unicorn = "rainbow" }

		RemoveKeys(dictionary, "cat", "dog")

		expect(dictionary).to.be.a("table")

		expect(dictionary.hello).to.equal("world")
		expect(dictionary.cat).to.equal("meow")
		expect(dictionary.dog).to.equal("woof")
		expect(dictionary.unicorn).to.equal("rainbow")
	end)
end
