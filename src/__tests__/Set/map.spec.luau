return function()
	local map = require(script.Parent.map)

	it("should map a set", function()
		local set = { hello = true, world = true }

		local newSet = map(set, function(value)
			return value .. "!"
		end)

		expect(newSet).to.be.a("table")
		expect(newSet).never.to.equal(set)

		expect(newSet.hello).to.equal(nil)
		expect(newSet.world).to.equal(nil)

		expect(newSet["hello!"]).to.equal(true)
		expect(newSet["world!"]).to.equal(true)
	end)

	it("should not modify the original set", function()
		local set = { hello = true }

		map(set, function(value)
			return value .. "!"
		end)

		expect(set).to.be.a("table")

		expect(set.hello).to.equal(true)
	end)
end
