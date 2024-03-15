return function()
	local Copy = require(script.Parent.copy)

	it("should return a copy of the given dictionary", function()
		local dictionary = { hello = "world" }

		local new = Copy(dictionary)

		expect(new).to.be.a("table")
		expect(new).never.to.equal(dictionary)

		expect(new.hello).to.equal("world")
	end)

	it("should not copy nested dictionaries", function()
		local dictionary = { hello = { world = "goodbye" } }

		local new = Copy(dictionary)

		expect(new).to.be.a("table")
		expect(new).never.to.equal(dictionary)

		expect(new.hello).to.equal(dictionary.hello)
	end)
end
