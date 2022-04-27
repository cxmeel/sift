return function()
	local Splice = require(script.Parent.splice)

	it("should insert the given values into the given array", function()
		local array = { 1, 2, 3 }

		local spliced = Splice(array, 2, 0, 4, 5)

		expect(spliced).to.be.a("table")
		expect(#spliced).to.equal(3)
		expect(spliced[1]).to.equal(1)
		expect(spliced[2]).to.equal(4)
		expect(spliced[3]).to.equal(5)
	end)

	it("should insert the given values into the given array with a negative index", function()
		local array = { 1, 2, 3 }

		local spliced = Splice(array, -2, 0, 4, 5)

		expect(spliced).to.be.a("table")
		expect(#spliced).to.equal(2)
		expect(spliced[1]).to.equal(4)
		expect(spliced[2]).to.equal(5)
		expect(spliced[3]).never.to.be.ok()
	end)
end
