return function()
	local Push = require(script.Parent.push)

	it("should return an array with new value(s) added", function()
		local array = Push({ 1, 2, 3 }, "Hello")

		expect(array).to.be.a("table")
		expect(#array).to.equal(4)

		expect(array[1]).to.equal(1)
		expect(array[2]).to.equal(2)
		expect(array[3]).to.equal(3)
		expect(array[4]).to.equal("Hello")
	end)

	it("should not modify the original array", function()
		local array = { 1, 2, 3 }

		Push(array, "Hello")

		expect(array).to.be.a("table")
		expect(#array).to.equal(3)

		expect(array[1]).to.equal(1)
		expect(array[2]).to.equal(2)
		expect(array[3]).to.equal(3)
		expect(array[4]).never.to.be.ok()
	end)
end
