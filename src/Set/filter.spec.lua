return function()
	local Filter = require(script.Parent.filter)

	it("should filter a set", function()
		local set = { hello = true, world = true }

		local newSet = Filter(set, function(value)
			return value ~= "hello"
		end)

		expect(newSet).to.be.a("table")

		expect(newSet.hello).to.equal(nil)
		expect(newSet.world).to.equal(true)
	end)

	it("should not modify the original set", function()
		local set = { hello = true }

		Filter(set, function(value)
			return value ~= "hello"
		end)

		expect(set).to.be.a("table")

		expect(set.hello).to.equal(true)
	end)
end
