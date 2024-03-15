return function()
	local Create = require(script.Parent.create)

	it("should return an array of the given length, filled with the given value", function()
		local array = Create(3, "Hello")

		expect(array).to.be.a("table")
		expect(#array).to.equal(3)

		expect(array[1]).to.equal("Hello")
		expect(array[2]).to.equal("Hello")
		expect(array[3]).to.equal("Hello")
	end)
end
