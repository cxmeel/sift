return function()
	local Equals = require(script.Parent.equals)

	it("should return true if the arrays are equal", function()
		local array1 = { 1, 2, 3 }
		local array2 = { 1, 2, 3 }

		expect(Equals(array1, array2)).to.equal(true)
	end)

	it("should return false if the arrays are not equal", function()
		local array1 = { 1, 2, 3 }
		local array2 = { 1, 2, 4 }

		expect(Equals(array1, array2)).to.equal(false)
	end)

	it("should return false for nested arrays", function()
		--[[
      This is because the nested arrays have different memory addresses,
      despite having the same values. Use EqualsDeep instead if you want to
      compare nested arrays.
    --]]
		local array1 = { 1, 2, { 3, 4 } }
		local array2 = { 1, 2, { 3, 4 } }

		expect(Equals(array1, array2)).to.equal(false)
	end)
end
