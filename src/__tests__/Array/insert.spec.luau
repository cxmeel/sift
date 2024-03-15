return function()
	local Insert = require(script.Parent.insert)

	it(
		"should insert the given values into an array at the given index, shifting all values after it to the right",
		function()
			local array = { 1, 2, 3 }

			local newArray = Insert(array, 2, 4, 5) -- { 1, 4, 5, 2, 3 }

			expect(newArray).to.be.a("table")
			expect(#newArray).to.equal(5)

			expect(newArray[1]).to.equal(1)
			expect(newArray[2]).to.equal(4)
			expect(newArray[3]).to.equal(5)
			expect(newArray[4]).to.equal(2)
			expect(newArray[5]).to.equal(3)
		end
	)

	it("should accept negative indices", function()
		local array = { 1, 2, 3 }

		local newArray = Insert(array, 0, 4, 5) -- { 1, 2, 3, 4, 5 }
		local newArray2 = Insert(array, -1, 4, 5) -- { 1, 2, 4, 5, 3 }

		expect(newArray).to.be.a("table")
		expect(#newArray).to.equal(5)
		expect(newArray[5]).to.equal(5)

		expect(newArray2).to.be.a("table")
		expect(#newArray2).to.equal(5)
		expect(newArray2[3]).to.equal(4)
		expect(newArray2[5]).to.equal(3)
	end)

	it("should accept length+1", function()
		local array = { 1, 2, 3 }

		local newArray = Insert(array, 4, 4, 5) -- { 1, 2, 3, 4, 5 }
		local newArray2 = Insert(array, 5, 4) -- { 1, 2, 3 }
		local newArray3 = Insert(array, 0, 4) -- { 1, 2, 3, 4 }

		expect(newArray).to.be.a("table")
		expect(#newArray).to.equal(5)
		expect(newArray[5]).to.equal(5)

		expect(newArray2).to.be.a("table")
		expect(#newArray2).to.equal(3)
		expect(newArray2[3]).to.equal(3)

		expect(newArray3).to.be.a("table")
		expect(#newArray3).to.equal(4)
		expect(newArray3[4]).to.equal(4)
	end)
end
