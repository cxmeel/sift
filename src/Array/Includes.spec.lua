return function()
	local Includes = require(script.Parent.includes)

	it("should return true if the given array includes the given value", function()
		local array = { 1, 2, 3 }

		local includes = Includes(array, 2)

		expect(includes).to.equal(true)
	end)
end
