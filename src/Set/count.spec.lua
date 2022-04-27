return function()
	local count = require(script.Parent.count)

	it("should count the number of values in a set", function()
		local set = { hello = true, world = true }

		expect(count(set)).to.equal(2)
	end)

	it("should count the number of values in a set matching the predicate", function()
		local set = { hello = true, world = true }

		expect(count(set, function(value)
			return value == "hello"
		end)).to.equal(1)
	end)
end
