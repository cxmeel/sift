return function()
	local ToSet = require(script.Parent.toSet)

	it("should return a set", function()
		local array = { 1, 2, 3 }

		local set = ToSet(array)

		expect(set).to.be.a("table")
		expect(set[1]).to.equal(true)
		expect(set[2]).to.equal(true)
		expect(set[3]).to.equal(true)
	end)

	it("should return a set of strings", function()
		local array = { "a", "b", "b", "c" }

		local set = ToSet(array)

		expect(set).to.be.a("table")
		expect(set["a"]).to.equal(true)
		expect(set["b"]).to.equal(true)
		expect(set["c"]).to.equal(true)
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3 }

		ToSet(array)

		expect(array).to.be.a("table")
		expect(#array).to.equal(3)

		expect(array[1]).to.equal(1)
		expect(array[2]).to.equal(2)
		expect(array[3]).to.equal(3)
	end)
end
