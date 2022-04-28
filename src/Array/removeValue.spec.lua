return function()
	local RemoveValue = require(script.Parent.removeValue)

	it("should remove the elements with the given value", function()
		local array = { 1, 2, 3, 4, 5 }

		local removed = RemoveValue(array, 2)

		expect(removed[1]).to.equal(1)
		expect(removed[2]).to.equal(3)
		expect(removed[3]).to.equal(4)
		expect(removed[4]).to.equal(5)
		expect(removed[5]).never.to.be.ok()
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3, 4, 5 }

		RemoveValue(array, 2)

		expect(array[2]).to.equal(2)
	end)
end
