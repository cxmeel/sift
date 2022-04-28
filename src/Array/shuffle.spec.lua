return function()
	local Shuffle = require(script.Parent.shuffle)

	it("should return a shuffled array", function()
		local array = { 1, 2, 3 }

		local shuffled = Shuffle(array)

		expect(shuffled).to.be.a("table")
		expect(#shuffled).to.equal(3)
		expect(shuffled).never.to.equal(array)
	end)
end
