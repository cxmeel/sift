return function()
	local RemoveIndex = require(script.Parent.removeIndex)

	it("should remove the element at the given index", function()
		local array = { 1, 2, 3 }

		local removed = RemoveIndex(array, 2)

		expect(removed[1]).to.equal(1)
		expect(removed[2]).to.equal(3)
		expect(removed[3]).never.to.be.ok()
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3 }

		RemoveIndex(array, 2)

		expect(array[2]).to.equal(2)
	end)

	it("should remove an element at the given negative index", function()
		local array = { 1, 2, 3 }

		local removed = RemoveIndex(array, -1)

		expect(removed[1]).to.equal(1)
		expect(removed[2]).to.equal(3)
		expect(removed[3]).never.to.be.ok()
	end)
end
