return function()
	local dotRestore = require(script.Parent.dotRestore)

	it("restores a dot-notation dictionary", function()
		local flattened = {
			["hello.world"] = "hello!",
			["hello.cat"] = "meow",
			["hello.animal.dog"] = "woof",
			["hello.animal.unicorn[1]"] = "sparkle",
			["hello.animal.unicorn[2]"] = "rainbow",
		}

		local dictionary = dotRestore(flattened)

		expect(dictionary).to.be.a("table")

		expect(dictionary.hello).to.be.a("table")
		expect(dictionary.hello.world).to.equal("hello!")
		expect(dictionary.hello.cat).to.equal("meow")

		expect(dictionary.hello.animal).to.be.a("table")
		expect(dictionary.hello.animal.dog).to.equal("woof")

		expect(dictionary.hello.animal.unicorn).to.be.a("table")
		expect(dictionary.hello.animal.unicorn[1]).to.equal("sparkle")
		expect(dictionary.hello.animal.unicorn[2]).to.equal("rainbow")
	end)
end
