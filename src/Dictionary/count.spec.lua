return function()
	local Count = require(script.Parent.count)

	it("should return the number of elements in the given dictionary", function()
		local dictionary = { hello = "world", goodbye = "world" }

		local count = Count(dictionary)

		expect(count).to.equal(2)
	end)

	it("should return 0 for an empty dictionary", function()
		local dictionary = {}

		local count = Count(dictionary)

		expect(count).to.equal(0)
	end)

	it("should return the number of elements matching the given predicate", function()
		local dictionary = { hello = "world", goodbye = "world" }

		local count = Count(dictionary, function(_, key)
			return key == "goodbye"
		end)

		expect(count).to.equal(1)
	end)
end
