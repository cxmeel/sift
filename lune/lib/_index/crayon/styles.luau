local MODIFIERS = table.freeze({
	RESET = { 0, 0 },
	BOLD = { 1, 22 },
	DIM = { 2, 22 },
	ITALIC = { 3, 23 },
	UNDERLINE = { 4, 24 },
	OVERLINE = { 53, 55 },
	INVERSE = { 7, 27 },
	HIDDEN = { 8, 28 },
	STRIKETHROUGH = { 9, 29 },
})

local FOREGROUND_COLORS = table.freeze({
	BLACK = { 30, 39 },
	RED = { 31, 39 },
	GREEN = { 32, 39 },
	YELLOW = { 33, 39 },
	BLUE = { 34, 39 },
	MAGENTA = { 35, 39 },
	CYAN = { 36, 39 },
	WHITE = { 37, 39 },

	GREY = { 90, 39 },
	BLACK_BRIGHT = { 90, 39 },
	RED_BRIGHT = { 91, 39 },
	GREEN_BRIGHT = { 92, 39 },
	YELLOW_BRIGHT = { 93, 39 },
	BLUE_BRIGHT = { 94, 39 },
	MAGENTA_BRIGHT = { 95, 39 },
	CYAN_BRIGHT = { 96, 39 },
	WHITE_BRIGHT = { 97, 39 },
})

local BACKGROUND_COLORS = table.freeze({
	BLACK = { 40, 49 },
	RED = { 41, 49 },
	GREEN = { 42, 49 },
	YELLOW = { 43, 49 },
	BLUE = { 44, 49 },
	MAGENTA = { 45, 49 },
	CYAN = { 46, 49 },
	WHITE = { 47, 49 },

	GREY = { 100, 49 },
	BLACK_BRIGHT = { 100, 49 },
	RED_BRIGHT = { 101, 49 },
	GREEN_BRIGHT = { 102, 49 },
	YELLOW_BRIGHT = { 103, 49 },
	BLUE_BRIGHT = { 104, 49 },
	MAGENTA_BRIGHT = { 105, 49 },
	CYAN_BRIGHT = { 106, 49 },
	WHITE_BRIGHT = { 107, 49 },
})

return table.freeze({
	MODIFIERS = MODIFIERS,
	FOREGROUND_COLORS = FOREGROUND_COLORS,
	BACKGROUND_COLORS = BACKGROUND_COLORS,
})
