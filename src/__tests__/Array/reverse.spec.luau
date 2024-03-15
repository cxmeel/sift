return function()
	local Reverse = require(script.Parent.reverse)

	it("should reverse the given array", function()
		local array = { 1, 2, 3 }

		local reversed = Reverse(array)

		expect(reversed[1]).to.equal(3)
		expect(reversed[2]).to.equal(2)
		expect(reversed[3]).to.equal(1)
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3 }

		Reverse(array)

		expect(array[1]).to.equal(1)
		expect(array[2]).to.equal(2)
		expect(array[3]).to.equal(3)
	end)
end
