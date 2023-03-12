return function()
	local WithKeys = require(script.Parent.withKeys)

	it("should return a new dictionary with the given keys kept", function()
		local dictionary = { hello = "world", cat = "meow", dog = "woof", unicorn = "rainbow" }

		local newDictionary = WithKeys(dictionary, "cat", "dog")

		expect(newDictionary).to.be.a("table")

		expect(newDictionary.hello).to.equal(nil)
		expect(newDictionary.cat).to.equal("meow")
		expect(newDictionary.dog).to.equal("woof")
		expect(newDictionary.unicorn).to.equal(nil)
	end)

	it("should not modify the original dictionary", function()
		local dictionary = { hello = "world", cat = "meow", dog = "woof", unicorn = "rainbow" }

		WithKeys(dictionary, "cat", "dog")

		expect(dictionary).to.be.a("table")

		expect(dictionary.hello).to.equal("world")
		expect(dictionary.cat).to.equal("meow")
		expect(dictionary.dog).to.equal("woof")
		expect(dictionary.unicorn).to.equal("rainbow")
	end)
end
