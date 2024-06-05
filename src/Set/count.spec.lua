return function()
	local Count = require(script.Parent.count)

	it("should count the number of values in a set", function()
		local set = { hello = true, world = true }

		expect(Count(set)).to.equal(2)
	end)

	it("should count the number of values in a set matching the predicate", function()
		local set = { hello = true, world = true }

		expect(Count(set, function(value)
			return value == "hello"
		end)).to.equal(1)
	end)
end
