return function()
	local Flatten = require(script.Parent.flatten)

	it("should return a flattened array", function()
		local array = { 1, 2, { 3, 4 } }

		local flattened = Flatten(array)

		expect(flattened).to.be.a("table")
		expect(#flattened).to.equal(4)

		expect(flattened[1]).to.equal(1)
		expect(flattened[2]).to.equal(2)
		expect(flattened[3]).to.equal(3)
		expect(flattened[4]).to.equal(4)
	end)

	it("should not flatten nested arrays if depth = 0", function()
		local array = { 1, 2, { 3, 4 } }

		local flattened = Flatten(array, 0)

		expect(flattened).to.be.a("table")
		expect(#flattened).to.equal(3)

		expect(flattened[1]).to.equal(1)
		expect(flattened[2]).to.equal(2)
		expect(flattened[3]).to.equal(array[3])
	end)

	it("should flatten as deeply as possible", function()
		local array = { 1, 2, { 3, 4, { 5, 6, { 7, 8 } } } }

		local flattened = Flatten(array)

		expect(flattened).to.be.a("table")
		expect(#flattened).to.equal(8)

		expect(flattened[1]).to.equal(1)
		expect(flattened[2]).to.equal(2)
		expect(flattened[3]).to.equal(3)
		expect(flattened[4]).to.equal(4)
		expect(flattened[5]).to.equal(5)
		expect(flattened[6]).to.equal(6)
		expect(flattened[7]).to.equal(7)
		expect(flattened[8]).to.equal(8)
	end)
end
