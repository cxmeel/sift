return function()
	local differenceSymmetric = require(script.Parent.differenceSymmetric)

	it("should return the symmetric difference between two arrays", function()
		local array = { "hello", "world" }
		local otherArray = { "cat", "dog", "hello" }

		local newArray = differenceSymmetric(array, otherArray)

		expect(newArray).to.be.a("table")
		expect(#newArray).to.equal(3)

		expect(table.find(newArray, "world")).to.be.ok()
		expect(table.find(newArray, "cat")).to.be.ok()
		expect(table.find(newArray, "dog")).to.be.ok()
	end)

	it("should accept vararg nil values", function()
		local array = { "hello", "world" }
		local otherArray = { "cat", "dog", "hello" }

		local newArray = differenceSymmetric(array, nil, otherArray)

		expect(newArray).to.be.a("table")
		expect(#newArray).to.equal(3)

		expect(table.find(newArray, "world")).to.be.ok()
		expect(table.find(newArray, "cat")).to.be.ok()
		expect(table.find(newArray, "dog")).to.be.ok()
	end)

	it("should accept multiple arrays", function()
		local array = { "hello", "world" }
		local otherArray = { "cat", "dog", "hello" }
		local anotherArray = { "hello", "panda" }

		local newArray = differenceSymmetric(array, otherArray, anotherArray)

		expect(newArray).to.be.a("table")
		expect(#newArray).to.equal(4)

		expect(table.find(newArray, "world")).to.be.ok()
		expect(table.find(newArray, "cat")).to.be.ok()
		expect(table.find(newArray, "dog")).to.be.ok()
		expect(table.find(newArray, "panda")).to.be.ok()
	end)
end
