return function()
	local FindLast = require(script.Parent.findLast)

	it("should return the first element that matches the given value", function()
		local array = { 1, 2, 3 }

		expect(FindLast(array, 2)).to.equal(2)
	end)

	it("should return nil if no element matches the given value", function()
		local array = { 1, 2, 3 }

		expect(FindLast(array, 4)).never.to.be.ok()
	end)

	it("should return nil if no element matches, given a starting index", function()
		local array = { 1, 2, 3 }

		expect(FindLast(array, 3, 2)).never.to.be.ok()
	end)

	it("should return the first element that matches, given a starting index", function()
		local array = { 1, 2, 3 }

		expect(FindLast(array, 1, 2)).to.equal(1)
	end)

	it("should accept a negative starting index", function()
		local array = { 1, 2, 3 }

		expect(FindLast(array, 2, -1)).to.equal(2)
	end)
end
