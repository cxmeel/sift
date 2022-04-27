local fmt = string.format

local function assertTypeOf(method: string, argument: string, class: string, value: any?, level: number?)
	local actualTypeOf = typeof(value)

	if actualTypeOf ~= class then
		local errorMessage = fmt(
			"%s(...): %q expected a %s, got %q (%s)",
			method,
			argument,
			class,
			tostring(value),
			actualTypeOf
		)

		error(errorMessage, if level then level else 2)
	end
end

local function prepTypeOf(method: string)
	return function(argument: string, class: string, value: any?)
		assertTypeOf(method, argument, class, value, 3)
	end
end

return {
	typeOf = assertTypeOf,
	prepTypeOf = prepTypeOf,
}
