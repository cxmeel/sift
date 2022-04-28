return function()
	local Count = require(script.Parent.count)

	it("should return the number of elements in the given array", function()
		local array = { 1, 2, 3 }

		local count = Count(array)

		expect(count).to.equal(3)
	end)

	it("should return 0 for an empty array", function()
		local array = {}

		local count = Count(array)

		expect(count).to.equal(0)
	end)

	it("should return the number of elements matching the given predicate", function()
		local array = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }

		local count = Count(array, function(value)
			return value % 2 == 0
		end)

		expect(count).to.equal(5)
	end)
end
