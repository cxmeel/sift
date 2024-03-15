return function()
	local Update = require(script.Parent.update)

	it("should update the value at the given index", function()
		local array = { 1, 2, 3 }

		local result = Update(array, 2, function(value)
			return value + 1
		end)

		expect(result).to.be.a("table")
		expect(#result).to.equal(3)

		expect(result[1]).to.equal(1)
		expect(result[2]).to.equal(3)
		expect(result[3]).to.equal(3)
	end)

	it("should create values using the callback", function()
		local array = { 1, 2, 3 }

		local result = Update(array, 4, function(value)
			return value + 1
		end, function()
			return 5
		end)

		expect(result).to.be.a("table")
		expect(#result).to.equal(4)

		expect(result[1]).to.equal(1)
		expect(result[2]).to.equal(2)
		expect(result[3]).to.equal(3)
		expect(result[4]).to.equal(5)
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3 }

		Update(array, 2, function(value)
			return value + 1
		end)

		expect(array[1]).to.equal(1)
		expect(array[2]).to.equal(2)
		expect(array[3]).to.equal(3)
	end)
end
