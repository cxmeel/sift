return function()
	local Filter = require(script.Parent.filter)

	it("should return a copy of the given dictionary with only the elements that match the predicate", function()
		local dictionary = { hello = "world", goodbye = "goodbye" }

		local new = Filter(dictionary, function(value)
			return value == "world"
		end)

		expect(new).to.be.a("table")
		expect(new).never.to.equal(dictionary)

		expect(new.hello).to.equal("world")
	end)

	it("should not modify the original dictionary", function()
		local dictionary = { hello = "world", goodbye = "goodbye" }

		local new = Filter(dictionary, function(value)
			return value == "world"
		end)

		expect(new).never.to.equal(dictionary)

		expect(dictionary.hello).to.equal("world")
		expect(dictionary.goodbye).to.equal("goodbye")

		expect(new.hello).to.equal("world")
	end)
end
