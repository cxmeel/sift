return function()
	local Unshift = require(script.Parent.unshift)

	it("should return a new array with the given value at the beginning", function()
		local array = { 1, 2, 3 }

		local newArray = Unshift(array, 4)

		expect(newArray).to.be.a("table")
		expect(#newArray).to.equal(4)

		expect(newArray[1]).to.equal(4)
		expect(newArray[2]).to.equal(1)
		expect(newArray[3]).to.equal(2)
		expect(newArray[4]).to.equal(3)
	end)

	it("should prepend multiple values to the array", function()
		local array = { 1, 2, 3 }

		local newArray = Unshift(array, 4, 5, 6)

		expect(newArray).to.be.a("table")
		expect(#newArray).to.equal(6)

		expect(newArray[1]).to.equal(4)
		expect(newArray[2]).to.equal(5)
		expect(newArray[3]).to.equal(6)
		expect(newArray[4]).to.equal(1)
		expect(newArray[5]).to.equal(2)
		expect(newArray[6]).to.equal(3)
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3 }

		Unshift(array, 4)

		expect(array[1]).to.equal(1)
	end)
end
