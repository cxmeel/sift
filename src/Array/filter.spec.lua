return function()
	local Filter = require(script.Parent.filter)

	it("should return a copy of the given array with only the elements that match the predicate", function()
		local array = { 1, 2, 3 }

		local new = Filter(array, function(value)
			return value % 2 == 0
		end)

		expect(new).to.be.a("table")
		expect(new).never.to.equal(array)
		expect(#new).to.equal(1)

		expect(new[1]).to.equal(2)
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3 }

		local new = Filter(array, function(value)
			return value % 2 == 0
		end)

		expect(new).never.to.equal(array)

		expect(array[1]).to.equal(1)
		expect(array[2]).to.equal(2)
		expect(array[3]).to.equal(3)

		expect(new[1]).to.equal(2)
	end)
end
