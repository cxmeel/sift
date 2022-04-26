return function()
	local Merge = require(script.Parent.Merge)

	it("should combines two or more dictionaries, where the last value overrides previous", function()
		local dictionary1 = { hello = "roblox", goodbye = "world" }
		local dictionary2 = { hello = "hello" }

		local merged = Merge(dictionary1, dictionary2)

		expect(merged).to.be.a("table")

		expect(merged.hello).to.equal("hello")
		expect(merged.goodbye).to.equal("world")
	end)

	it("should not modify the original dictionaries", function()
		local dictionary1 = { hello = "roblox", goodbye = "world" }
		local dictionary2 = { hello = "hello" }

		Merge(dictionary1, dictionary2)

		expect(dictionary1).to.be.a("table")
		expect(dictionary2).to.be.a("table")

		expect(dictionary1.hello).to.equal("roblox")
		expect(dictionary2.hello).to.equal("hello")
	end)
end
