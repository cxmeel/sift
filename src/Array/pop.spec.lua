return function()
	local Pop = require(script.Parent.pop)

	it("should remove the last element of the given array", function()
		local array = { 1, 2, 3 }

		local popped = Pop(array)

		expect(popped[1]).to.equal(1)
		expect(popped[2]).to.equal(2)
		expect(popped[3]).never.to.be.ok()
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3 }

		Pop(array)

		expect(array[3]).to.equal(3)
	end)

	it("should pop multiple elements from the array", function()
		local array = { 1, 2, 3, 4, 5 }

		local popped = Pop(array, 2)

		expect(popped[1]).to.equal(1)
		expect(popped[2]).to.equal(2)
		expect(popped[3]).to.equal(3)
		expect(popped[4]).never.to.be.ok()
	end)
end
