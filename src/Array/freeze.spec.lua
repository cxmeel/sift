return function()
	local Freeze = require(script.Parent.freeze)

	it("should return a read-only copy of the given array", function()
		local array = { 1, 2, 3 }

		local frozen = Freeze(array)

		expect(frozen).to.be.a("table")
		expect(frozen).never.to.equal(array)
		expect(#frozen).to.equal(3)

		expect(frozen[1]).to.equal(1)
		expect(frozen[2]).to.equal(2)
		expect(frozen[3]).to.equal(3)

		expect(function()
			frozen[1] = 4
		end).to.throw()
	end)

	it("should not freeze nested arrays", function()
		local array = { 1, 2, { 3, 4 } }

		local frozen = Freeze(array)

		expect(frozen).to.be.a("table")
		expect(frozen).never.to.equal(array)
		expect(#frozen).to.equal(3)

		expect(frozen[1]).to.equal(1)
		expect(frozen[2]).to.equal(2)
		expect(frozen[3]).to.be.a("table")
		expect(frozen[3]).to.equal(array[3])
		expect(#frozen[3]).to.equal(2)

		expect(frozen[3][1]).to.equal(3)
		expect(frozen[3][2]).to.equal(4)

		expect(function()
			frozen[1] = 4
		end).to.throw()

		expect(function()
			frozen[3][1] = 5
		end).never.to.throw()
	end)
end
