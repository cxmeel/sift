return function()
	local difference = require(script.Parent.difference)

	it("should return the difference between two arrays", function()
		local array = { "hello", "world" }
		local otherArray = { "cat", "dog", "hello" }

		local newArray = difference(array, otherArray)

		expect(newArray).to.be.a("table")
		expect(#newArray).to.equal(1)

		expect(table.find(newArray, "world")).to.be.ok()
	end)

	it("should accept vararg nil values", function()
		local array = { "hello", "world" }
		local otherArray = { "cat", "dog", "hello" }

		local newArray = difference(array, nil, otherArray)

		expect(newArray).to.be.a("table")
		expect(#newArray).to.equal(1)

		expect(table.find(newArray, "world")).to.be.ok()
	end)

	it("should accept multiple arrays", function()
		local array = { "hello", "world" }
		local otherArray = { "cat", "dog", "hello" }
		local anotherArray = { "hello", "panda" }

		local newArray = difference(array, otherArray, anotherArray)

		expect(newArray).to.be.a("table")
		expect(#newArray).to.equal(1)

		expect(table.find(newArray, "world")).to.be.ok()
	end)
end
