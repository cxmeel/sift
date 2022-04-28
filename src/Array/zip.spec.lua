return function()
	local Zip = require(script.Parent.zip)

	it("should zip together two arrays", function()
		local array1 = { 1, 2, 3 }
		local array2 = { "a", "b", "c" }

		local new = Zip(array1, array2)

		expect(new).to.be.a("table")
		expect(#new).to.equal(3)

		expect(new[1]).to.be.a("table")
		expect(new[1][1]).to.equal(1)
		expect(new[1][2]).to.equal("a")

		expect(new[2]).to.be.a("table")
		expect(new[2][1]).to.equal(2)
		expect(new[2][2]).to.equal("b")

		expect(new[3]).to.be.a("table")
		expect(new[3][1]).to.equal(3)
		expect(new[3][2]).to.equal("c")
	end)

	it("should not modify the original arrays", function()
		local array1 = { 1, 2, 3 }
		local array2 = { "a", "b", "c" }

		Zip(array1, array2)

		expect(array1).to.be.a("table")
		expect(#array1).to.equal(3)

		expect(array1[1]).to.equal(1)
		expect(array1[2]).to.equal(2)
		expect(array1[3]).to.equal(3)

		expect(array2).to.be.a("table")
		expect(#array2).to.equal(3)

		expect(array2[1]).to.equal("a")
		expect(array2[2]).to.equal("b")
		expect(array2[3]).to.equal("c")
	end)
end
