return function()
	local Some = require(script.Parent.some)

	it("should return true if the predicate returns true for any of the values", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local result = Some(dictionary, function(value)
			return value == "roblox"
		end)

		expect(result).to.equal(true)
	end)

	it("should return false if the predicate returns false for all of the values", function()
		local dictionary = { hello = "roblox", goodbye = "world" }

		local result = Some(dictionary, function(value)
			return value == "hello"
		end)

		expect(result).to.equal(false)
	end)
end
