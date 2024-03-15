return function()
	local Flatten = require(script.Parent.flatten)

	it("should return a flattened dictionary", function()
		local dictionary = {
			hello = "world",
			goodbye = {
				yes = "no",
				no = "yes",
			},
		}

		local flattened = Flatten(dictionary)

		expect(flattened).to.be.a("table")

		expect(flattened.hello).to.equal("world")
		expect(flattened.yes).to.equal("no")
		expect(flattened.no).to.equal("yes")
	end)

	it("should not flatten nested dictionaries if depth = 0", function()
		local dictionary = {
			hello = "world",
			goodbye = {
				yes = "no",
				no = "yes",
			},
		}

		local flattened = Flatten(dictionary, 0)

		expect(flattened).to.be.a("table")

		expect(flattened.hello).to.equal("world")
		expect(flattened.goodbye).to.equal(dictionary.goodbye)
	end)

	it("should flatten as deeply as possible", function()
		local dictionary = {
			hello = "world",
			goodbye = {
				yes = "no",
				no = "yes",
				maybe = {
					maybe = "ok",
					okay = {
						experience = "roblox",
					},
				},
			},
		}

		local flattened = Flatten(dictionary)

		expect(flattened).to.be.a("table")

		expect(flattened.hello).to.equal("world")
		expect(flattened.yes).to.equal("no")
		expect(flattened.no).to.equal("yes")
		expect(flattened.maybe).to.equal("ok")
		expect(flattened.experience).to.equal("roblox")
	end)
end
