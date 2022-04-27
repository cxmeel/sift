return function()
	local Every = require(script.Parent.every)

	it("should return true if all elements match the predicate", function()
		local array = { 1, 2, 3 }

		expect(Every(array, function(value)
			return value % 1 == 0
		end)).to.equal(true)
	end)

	it("should return false if any elements do not match the predicate", function()
		local array = { 1, 2, 3 }

		expect(Every(array, function(value)
			return value % 2 == 0
		end)).to.equal(false)
	end)
end
