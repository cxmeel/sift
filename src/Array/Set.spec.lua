return function()
	local Set = require(script.Parent.set)

	it("should set the given value in the given array", function()
		local array = { 1, 2, 3 }

		local new = Set(array, 2, 4)

		expect(new[2]).to.equal(4)
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3 }

		Set(array, 2, 4)

		expect(array[1]).to.equal(1)
		expect(array[2]).to.equal(2)
		expect(array[3]).to.equal(3)
	end)
end
