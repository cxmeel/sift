return function()
	local EqualsDeep = require(script.Parent.equalsDeep)

	it("should return true if the dictionaries are equal", function()
		local dictionary1 = { hello = "world", goodbye = "world" }
		local dictionary2 = { hello = "world", goodbye = "world" }

		expect(EqualsDeep(dictionary1, dictionary2)).to.equal(true)
	end)

	it("should return false if the dictionaries are not equal", function()
		local dictionary1 = { hello = "world", goodbye = "world" }
		local dictionary2 = { hello = "world", goodbye = "world2" }

		expect(EqualsDeep(dictionary1, dictionary2)).to.equal(false)
	end)

	it("should return true for nested dictionaries", function()
		local dictionary1 = { hello = "world", goodbye = { world = "hello" } }
		local dictionary2 = { hello = "world", goodbye = { world = "hello" } }
		local dictionary3 = { hello = "world", goodbye = { world = "world" } }

		expect(EqualsDeep(dictionary1, dictionary2)).to.equal(true)
		expect(EqualsDeep(dictionary1, dictionary3)).to.equal(false)
	end)
end
