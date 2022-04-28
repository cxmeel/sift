return function()
	local Map = require(script.Parent.map)

	it("should return an array where values are the result of the mapper function", function()
		local array = Map({ 1, 2, 3 }, function(value)
			return value * 2
		end)

		expect(array).to.be.a("table")
		expect(#array).to.equal(3)

		expect(array[1]).to.equal(2)
		expect(array[2]).to.equal(4)
		expect(array[3]).to.equal(6)
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3 }

		Map(array, function(value)
			return value * 2
		end)

		expect(array).to.be.a("table")
		expect(#array).to.equal(3)

		expect(array[1]).to.equal(1)
		expect(array[2]).to.equal(2)
		expect(array[3]).to.equal(3)
	end)
end
