return function()
	local FromArrays = require(script.Parent.fromArrays)

	it("should return a dictionary composed of the given keys and values", function()
		local keys = { "hello", "goodbye" }
		local values = { "roblox", "world" }

		local dictionary = FromArrays(keys, values)

		expect(dictionary).to.be.a("table")

		expect(dictionary.hello).to.equal("roblox")
		expect(dictionary.goodbye).to.equal("world")
	end)
end
