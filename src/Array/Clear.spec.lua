return function()
	local Clear = require(script.Parent.Clear)

	it("should not overwrite the original array", function()
		local array = { 1, 2, 3 }

		local new = Clear(array)

		expect(array).to.be.a("table")
		expect(array).never.to.equal(new)

		expect(array[1]).to.equal(1)
		expect(array[2]).to.equal(2)
		expect(array[3]).to.equal(3)
	end)

	it("should clear the contents of an array", function()
		local array = { 1, 2, 3 }

		local new = Clear(array)

		expect(new).to.be.a("table")
		expect(new).never.to.equal(array)

		expect(new[1]).to.equal(nil)
		expect(new[2]).to.equal(nil)
		expect(new[3]).to.equal(nil)
	end)
end
