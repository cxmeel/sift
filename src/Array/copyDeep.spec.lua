return function()
	local CopyDeep = require(script.Parent.copyDeep)

	it("should return a copy of the given array", function()
		local array = { 1, 2, 3 }

		local new = CopyDeep(array)

		expect(new).to.be.a("table")
		expect(new).never.to.equal(array)

		expect(new[1]).to.equal(1)
		expect(new[2]).to.equal(2)
		expect(new[3]).to.equal(3)
	end)

	it("should copy nested arrays", function()
		local array = { 1, 2, { 3, 4 } }

		local new = CopyDeep(array)

		expect(new).to.be.a("table")
		expect(new).never.to.equal(array)

		expect(new[1]).to.equal(1)
		expect(new[2]).to.equal(2)
		expect(new[3]).never.to.equal(array[3])
	end)
end
