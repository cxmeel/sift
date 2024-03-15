return function()
	local Update = require(script.Parent.update)

	it("should return a new dictionary with the given key updated", function()
		local dictionary = { cats = 2 }

		local new = Update(dictionary, "cats", function(value)
			return value + 1
		end)

		expect(new).to.be.a("table")

		expect(new.cats).to.equal(3)
	end)

	it("should not modify the original dictionary", function()
		local dictionary = { cats = 2 }

		Update(dictionary, "cats", function(value)
			return value + 1
		end)

		Update(dictionary, "dogs", nil, function()
			return 1
		end)

		expect(dictionary).to.be.a("table")

		expect(dictionary.cats).to.equal(2)
		expect(dictionary.dogs).to.equal(nil)
	end)

	it("should create the key if it does not exist", function()
		local dictionary = { cats = 2 }

		local new = Update(dictionary, "dogs", function(value)
			return value + 1
		end, function()
			return 1
		end)

		expect(new).to.be.a("table")

		expect(new.cats).to.equal(2)
		expect(new.dogs).to.equal(1)
	end)

	it("should not create a key if it doesn't exist and no callback is specified", function()
		local dictionary = { cats = 2 }

		local new = Update(dictionary, "dogs", function()
			return 1
		end)

		expect(new.dogs).to.equal(nil)
	end)
end
