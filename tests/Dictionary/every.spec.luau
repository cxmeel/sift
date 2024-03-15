return function()
	local Every = require(script.Parent.every)

	it("should return true if all elements match the predicate", function()
		local dictionary = { hello = "world", goodbye = "world" }

		expect(Every(dictionary, function(value)
			return value == "world"
		end)).to.equal(true)
	end)

	it("should return false if any elements do not match the predicate", function()
		local dictionary = { hello = "world", goodbye = "world" }

		expect(Every(dictionary, function(value)
			return value == "hello"
		end)).to.equal(false)
	end)
end
