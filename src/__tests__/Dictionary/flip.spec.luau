return function()
	local Flip = require(script.Parent.flip)

	it("should return a flipped dictionary", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local new = Flip(dictionary)

		expect(new).to.be.a("table")

		expect(new.world).to.equal("goodbye")
		expect(new.roblox).to.equal("hello")
	end)
end
