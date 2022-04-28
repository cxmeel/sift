return function()
	local Last = require(script.Parent.last)

	it("should return the last element of the given array", function()
		local array = { 1, 2, 3 }

		local last = Last(array)

		expect(last).to.equal(3)
	end)
end
