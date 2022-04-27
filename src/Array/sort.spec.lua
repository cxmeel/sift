return function()
	local Sort = require(script.Parent.sort)

	it("should sort the given array", function()
		local array = { 1, 2, 3 }

		local new = Sort(array, function(a, b)
			return a < b
		end)

		expect(new).to.be.a("table")
		expect(#new).to.equal(3)
		expect(new[1]).to.equal(1)
		expect(new[2]).to.equal(2)
		expect(new[3]).to.equal(3)
	end)

	it("should sort the given array with a custom compare function", function()
		local array = { 1, 2, 3 }

		local new = Sort(array, function(a, b)
			return a > b
		end)

		expect(new).to.be.a("table")
		expect(#new).to.equal(3)
		expect(new[1]).to.equal(3)
		expect(new[2]).to.equal(2)
		expect(new[3]).to.equal(1)
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3 }

		Sort(array, function(a, b)
			return a > b
		end)

		expect(array).to.be.a("table")
		expect(array[1]).to.equal(1)
		expect(array[2]).to.equal(2)
		expect(array[3]).to.equal(3)
	end)
end
