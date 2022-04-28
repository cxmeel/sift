return function()
	local Entries = require(script.Parent.entries)

	it("should return a list of entries as key-value pairs", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local entries = Entries(dictionary)

		expect(entries).to.be.a("table")
		expect(#entries).to.equal(2)

		expect(entries[1]).to.be.a("table")
		expect(#entries[1]).to.equal(2)
		expect(entries[1][1]).to.equal("hello")
		expect(entries[1][2]).to.equal("roblox")

		expect(entries[2]).to.be.a("table")
		expect(#entries[2]).to.equal(2)
		expect(entries[2][1]).to.equal("goodbye")
		expect(entries[2][2]).to.equal("world")
	end)
end
