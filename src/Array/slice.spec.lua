return function()
	local Slice = require(script.Parent.slice)

	it("should return a slice of the given array", function()
		local array = { 1, 2, 3 }

		local slice = Slice(array, 2, 3)

		expect(slice).to.be.a("table")
		expect(#slice).to.equal(2)
		expect(slice[1]).to.equal(2)
		expect(slice[2]).to.equal(3)
	end)

	it("should return a slice of the given array with a negative start index", function()
		local array = { 1, 2, 3 }

		local slice = Slice(array, -1, 3)

		expect(slice).to.be.a("table")
		expect(#slice).to.equal(2)
		expect(slice[1]).to.equal(2)
		expect(slice[2]).to.equal(3)
	end)

	it("should return a slice of the given array with a negative end index", function()
		local array = { 1, 2, 3 }

		local slice = Slice(array, 1, -1)

		expect(slice).to.be.a("table")
		expect(#slice).to.equal(2)
		expect(slice[1]).to.equal(1)
		expect(slice[2]).to.equal(2)
	end)

	it("should return a slice of the given array with a negative start and end index", function()
		local array = { 1, 2, 3 }

		local slice = Slice(array, -2, -1)

		expect(slice).to.be.a("table")
		expect(#slice).to.equal(2)
		expect(slice[1]).to.equal(1)
		expect(slice[2]).to.equal(2)
	end)
end
