return function()
	local Map = require(script.Parent.map)

	it("should return a dictionary where entries are the result of the mapper function", function()
		local dictionary = Map({ hello = "roblox", goodbye = "world" }, function(value)
			return value .. "!"
		end)

		expect(dictionary).to.be.a("table")

		expect(dictionary.hello).to.equal("roblox!")
		expect(dictionary.goodbye).to.equal("world!")
	end)

	it("should not modify the original dictionary", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		Map(dictionary, function(value)
			return value .. "!"
		end)

		expect(dictionary).to.be.a("table")

		expect(dictionary.hello).to.equal("roblox")
		expect(dictionary.goodbye).to.equal("world")
	end)
end
