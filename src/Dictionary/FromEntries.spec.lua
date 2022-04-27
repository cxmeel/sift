return function()
	local FromEntries = require(script.Parent.fromEntries)

	it("should create a new dictionary from the given key-value pairs", function()
		local entries = { { "hello", "roblox" }, { "goodbye", "world" } }

		local dictionary = FromEntries(entries)

		expect(dictionary).to.be.a("table")

		expect(dictionary.hello).to.equal("roblox")
		expect(dictionary.goodbye).to.equal("world")
	end)
end
