return function()
	local dotFlatten = require(script.Parent.dotFlatten)

	it("flattens a dictionary using dot-notation", function()
		local dictionary = {
			hello = {
				world = "hello!",
				cat = "meow",
				animal = {
					dog = "woof",
					unicorn = {
						"sparkle",
						"rainbow",
					},
				},
			},
		}

		local flattened = dotFlatten(dictionary)

		expect(flattened).to.be.a("table")

		expect(flattened["hello.world"]).to.equal("hello!")
		expect(flattened["hello.cat"]).to.equal("meow")
		expect(flattened["hello.animal.dog"]).to.equal("woof")
		expect(flattened["hello.animal.unicorn[1]"]).to.equal("sparkle")
		expect(flattened["hello.animal.unicorn[2]"]).to.equal("rainbow")
	end)

	it("should escape special characters", function()
		local dictionary = {
			["hello.world"] = "hello!",
			["co[ff]ee"] = "bork",
			["0mg"] = {
				["0mg.0mg"] = true,
			},
			["player\\data"] = 1,
			[10] = "yes.",
			["11"] = "no.",
		}

		local flattened = dotFlatten(dictionary)

		expect(flattened).to.be.a("table")

		expect(flattened["hello\\.world"]).to.equal("hello!")
		expect(flattened["co\\[ff]ee"]).to.equal("bork")
		expect(flattened["0mg.0mg\\.0mg"]).to.equal(true)
		expect(flattened["player\\\\data"]).to.equal(1)
		expect(flattened["[10]"]).to.equal("yes.")
		expect(flattened["11"]).to.equal("no.")
	end)
end
