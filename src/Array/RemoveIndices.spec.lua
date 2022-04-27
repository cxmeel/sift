return function()
	local RemoveIndices = require(script.Parent.removeIndices)

	it("should remove the elements at the given indices", function()
		local array = { 1, 2, 3, 4, 5 }

		local removed = RemoveIndices(array, 2, 4)

		expect(removed[1]).to.equal(1)
		expect(removed[2]).to.equal(3)
		expect(removed[3]).to.equal(5)
		expect(removed[4]).never.to.be.ok()
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3, 4, 5 }

		RemoveIndices(array, 2, 4)

		expect(array[4]).to.equal(4)
	end)

	it("should remove indices at given negative indices", function()
		local array = { 1, 2, 3, 4, 5 }

		local removed = RemoveIndices(array, -1, -3)

		expect(removed[1]).to.equal(1)
		expect(removed[2]).to.equal(3)
		expect(removed[3]).to.equal(5)
		expect(removed[4]).never.to.be.ok()
	end)
end
