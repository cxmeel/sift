return function()
	local FindWhereLast = require(script.Parent.findWhereLast)

	it("should return the last element that matches the predicate", function()
		local array = { 1, 2, 3, 4, 5 }

		expect(FindWhereLast(array, function(value)
			return value % 2 == 0
		end)).to.equal(4)
	end)

	it("should return nil if no element matches the predicate", function()
		local array = { 1, 2, 3, 4, 5 }

		expect(FindWhereLast(array, function(value)
			return value == 6
		end)).never.to.be.ok()
	end)

	it("should return the last element that matches the predicate, given a starting index", function()
		local array = { 1, 2, 3, 4, 5 }

		expect(FindWhereLast(array, function(value)
			return value % 2 == 0
		end, 2)).to.equal(2)
	end)

	it("should return nil if no element matches the predicate, given a starting index", function()
		local array = { 1, 2, 3, 4, 5 }

		expect(FindWhereLast(array, function(value)
			return value == 4
		end, 3)).never.to.be.ok()
	end)
end
