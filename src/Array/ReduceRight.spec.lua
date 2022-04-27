return function()
	local ReduceRight = require(script.Parent.reduceRight)

	it("should reduce the given array from the right", function()
		local array = { 1, 2, 3 }

		local reduced = ReduceRight(array, function(accumulator, value)
			return accumulator + value
		end, 0)

		expect(reduced).to.equal(6)
	end)

	it("should reduce the given array from the right, using the last element as the initial value", function()
		local array = { 1, 2, 3 }

		local reduced = ReduceRight(array, function(accumulator, value)
			return accumulator - value
		end)

		expect(reduced).to.equal(0)
	end)
end
