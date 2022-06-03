return function()
	local MergeDeep = require(script.Parent.mergeDeep)
	local None = require(script.Parent.Parent.None)

	it("should combine two or more dictionaries, where the last value overrides previous, recursively", function()
		local dictionary1 = { hello = "roblox", goodbye = { world = "world" } }
		local dictionary2 = { goodbye = { world = "hello" } }

		local merged = MergeDeep(dictionary1, dictionary2)

		expect(merged).to.be.a("table")

		expect(merged.hello).to.equal("roblox")
		expect(merged.goodbye.world).to.equal("hello")
	end)

	it("should not modify the original dictionaries", function()
		local dictionary1 = { hello = "roblox", goodbye = { world = "world" } }
		local dictionary2 = { goodbye = { world = "hello" } }

		MergeDeep(dictionary1, dictionary2)

		expect(dictionary1).to.be.a("table")
		expect(dictionary2).to.be.a("table")

		expect(dictionary1.hello).to.equal("roblox")
		expect(dictionary1.goodbye.world).to.equal("world")
	end)

	it("should accept nil values", function()
		local dictionary1 = { hello = "roblox", goodbye = { world = "world" } }

		local merged = MergeDeep(dictionary1, nil)
		local merged2 = MergeDeep(nil, dictionary1)

		expect(merged).to.be.a("table")

		expect(merged.hello).to.equal("roblox")
		expect(merged.goodbye.world).to.equal("world")

		expect(merged2).to.be.a("table")

		expect(merged2.hello).to.equal("roblox")
		expect(merged2.goodbye.world).to.equal("world")
	end)

	it("should remove values set to None", function()
		local dictionary1 = { hello = "roblox", goodbye = { world = "world" } }
		local dictionary2 = { goodbye = None }

		local merged = MergeDeep(dictionary1, dictionary2)

		expect(merged).to.be.a("table")

		expect(merged.hello).to.equal("roblox")
		expect(merged.goodbye).to.equal(nil)
	end)
end
