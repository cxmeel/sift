return function()
	local Shift = require(script.Parent.shift)

	it("should remove the first item from the array", function()
		local array = { 1, 2, 3 }

		local shifted = Shift(array)

		expect(shifted[1]).to.equal(2)
		expect(shifted[2]).to.equal(3)
		expect(shifted[3]).never.to.be.ok()
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3 }

		Shift(array)

		expect(array[1]).to.equal(1)
	end)

	it("should shift given a number of items to remove", function()
		local array = { 1, 2, 3, 4, 5 }

		local shifted = Shift(array, 2)

		expect(shifted[1]).to.equal(3)
		expect(shifted[2]).to.equal(4)
		expect(shifted[3]).to.equal(5)
		expect(shifted[4]).never.to.be.ok()
	end)
end
