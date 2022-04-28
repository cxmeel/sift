return function()
	local Includes = require(script.Parent.includes)

	it("should return true if the dictionary includes the given value", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local includesRoblox = Includes(dictionary, "roblox")

		expect(includesRoblox).to.equal(true)
	end)

	it("should return false if the dictionary does not include the given value", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local includesCat = Includes(dictionary, "cat")

		expect(includesCat).to.equal(false)
	end)
end
