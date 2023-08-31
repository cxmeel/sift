return function()
	local CopyDeep = require(script.Parent.copyDeep)

	it("should return a copy of the given dictionary", function()
		local dictionary = {
			hello = "world",
		}

		local new = CopyDeep(dictionary)

		expect(new).to.be.a("table")
		expect(new).never.to.equal(dictionary)

		expect(new.hello).to.equal("world")
	end)

	it("should copy nested dictionaries", function()
		local dictionary = {
			hello = {
				world = "goodbye",
			},
		}

		local new = CopyDeep(dictionary)

		expect(new).to.be.a("table")
		expect(new).never.to.equal(dictionary)

		expect(new.hello).to.be.a("table")
		expect(new.hello).never.to.equal(dictionary.hello)

		expect(new.hello.world).to.equal("goodbye")
	end)

	it("should copy metatables", function()
		local meta = setmetatable({}, { __index = function() end })
		local dictionary = {
			hello = {},
			world = {},
			meta = meta,
		}

		local new = CopyDeep(dictionary)

		expect(new).to.be.a("table")
		expect(new).never.to.equal(dictionary)

		expect(function()
			return getmetatable(new[3])
		end).to.be.a("function")
	end)
end
