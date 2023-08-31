return function()
	local Reduce = require(script.Parent.reduce)

	it("should reduce the given array to a single value", function()
		local array = { 1, 2, 3 }

		local reduced = Reduce(array, function(accumulator, value)
			return accumulator + value
		end, 0)

		expect(reduced).to.equal(6)
	end)

	it(
		"should reduce the given array to a single value, using the first element as the initial value",
		function()
			local array = { 1, 2, 3 }

			local reduced = Reduce(array, function(accumulator, value)
				return accumulator - value
			end)

			expect(reduced).to.equal(-4)
		end
	)

	it("should reduce the array, even if the array has a falsy initial value", function()
		local array = { true, false, false }

		local reduced = Reduce(array, function(accumulator, value)
			return accumulator or value
		end, false)

		expect(reduced).to.equal(true)
	end)
end
