return function()
	local FreezeDeep = require(script.Parent.freezeDeep)

	it("should return a read-only copy of the given dictionary", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local frozen = FreezeDeep(dictionary)

		expect(frozen).to.be.a("table")
		expect(frozen).never.to.equal(dictionary)

		expect(frozen.hello).to.equal("roblox")
		expect(frozen.goodbye).to.equal("world")

		expect(function()
			frozen.hello = "world"
		end).to.throw()
	end)

	it("should freeze nested dictionaries", function()
		local dictionary = { hello = "roblox", goodbye = { world = "goodbye" } }

		local frozen = FreezeDeep(dictionary)

		expect(frozen).to.be.a("table")
		expect(frozen).never.to.equal(dictionary)

		expect(frozen.hello).to.equal("roblox")

		expect(frozen.goodbye).to.be.a("table")
		expect(frozen.goodbye).never.to.equal(dictionary.goodbye)

		expect(frozen.goodbye.world).to.equal("goodbye")

		expect(function()
			frozen.hello = "world"
		end).to.throw()

		expect(function()
			frozen.goodbye.world = "hello"
		end).to.throw()
	end)
end
