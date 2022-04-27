return function()
	local FindWhere = require(script.Parent.findWhere)

	it("should return the first element in the array that matches the given predicate", function()
		local array = { 1, 2, 3 }

		local result = FindWhere(array, function(value)
			return value == 2
		end)

		expect(result).to.equal(2)
	end)

	it("should return nil if no element matches the given predicate", function()
		local array = { 1, 2, 3 }

		local result = FindWhere(array, function(value)
			return value == 4
		end)

		expect(result).never.to.be.ok()
	end)

	it(
		"should return the first element in the array that matches the given predicate, given a starting index",
		function()
			local array = { 1, 2, 3 }

			local result = FindWhere(array, function(value)
				return value == 3
			end, 2)

			expect(result).to.equal(3)
		end
	)

	it("should return nil if no element matches the given predicate, given a starting index", function()
		local array = { 1, 2, 3 }

		local result = FindWhere(array, function(value)
			return value == 1
		end, 2)

		expect(result).never.to.be.ok()
	end)
end
