return function()
	local Some = require(script.Parent.some)

	it("should return true if the given predicate returns true for any element", function()
		local array = { 1, 2, 3 }

		local result = Some(array, function(value)
			return value == 2
		end)

		expect(result).to.equal(true)
	end)

	it("should return false if the given predicate returns false for all elements", function()
		local array = { 1, 2, 3 }

		local result = Some(array, function(value)
			return value == 4
		end)

		expect(result).to.equal(false)
	end)
end
