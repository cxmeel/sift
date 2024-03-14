local ANSI_STYLES = require("./styles")

local process = require("@lune/process")
local env, args = process.env, process.args

local isColorSupported = (function()
	local isNoColor = env.NO_COLOR
		or table.find(args, "--no-color")
		or table.find(args, "--color=false")
	local isForcedColor = env.FORCE_COLOR
		or table.find(args, "--color")
		or table.find(args, "--color=true")
	local isWindows = process.os == "windows"
	local isDumbTerminal = env.TERM == "dumb"

	local isCompatible = env.TERM and env.TERM ~= "dumb"
	local isCI = env.CI and (env.GITHUB_ACTIONS or env.GITLAB_CI or env.CIRCLECI)

	-- selene: allow(shadowing)
	local isColorSupported = not isNoColor
		and (isForcedColor or (isWindows and not isDumbTerminal) or isCompatible or isCI)

	return isColorSupported
end)()

local function styler(codepoint: { number })
	local open, close = codepoint[1], codepoint[2]

	return function(text: string)
		if not isColorSupported then
			return text
		end

		return `\27[{open}m{text}\27[{close}m`
	end
end

local Crayon = {
	-- Modifiers
	reset = styler(ANSI_STYLES.MODIFIERS.RESET),
	bold = styler(ANSI_STYLES.MODIFIERS.BOLD),
	dim = styler(ANSI_STYLES.MODIFIERS.DIM),
	italic = styler(ANSI_STYLES.MODIFIERS.ITALIC),
	underline = styler(ANSI_STYLES.MODIFIERS.UNDERLINE),
	overline = styler(ANSI_STYLES.MODIFIERS.OVERLINE),
	inverse = styler(ANSI_STYLES.MODIFIERS.INVERSE),
	hidden = styler(ANSI_STYLES.MODIFIERS.HIDDEN),
	strikethrough = styler(ANSI_STYLES.MODIFIERS.STRIKETHROUGH),

	-- Foreground colors
	black = styler(ANSI_STYLES.FOREGROUND_COLORS.BLACK),
	red = styler(ANSI_STYLES.FOREGROUND_COLORS.RED),
	green = styler(ANSI_STYLES.FOREGROUND_COLORS.GREEN),
	yellow = styler(ANSI_STYLES.FOREGROUND_COLORS.YELLOW),
	blue = styler(ANSI_STYLES.FOREGROUND_COLORS.BLUE),
	magenta = styler(ANSI_STYLES.FOREGROUND_COLORS.MAGENTA),
	cyan = styler(ANSI_STYLES.FOREGROUND_COLORS.CYAN),
	white = styler(ANSI_STYLES.FOREGROUND_COLORS.WHITE),
	grey = styler(ANSI_STYLES.FOREGROUND_COLORS.GREY),
	blackBright = styler(ANSI_STYLES.FOREGROUND_COLORS.BLACK_BRIGHT),
	redBright = styler(ANSI_STYLES.FOREGROUND_COLORS.RED_BRIGHT),
	greenBright = styler(ANSI_STYLES.FOREGROUND_COLORS.GREEN_BRIGHT),
	yellowBright = styler(ANSI_STYLES.FOREGROUND_COLORS.YELLOW_BRIGHT),
	blueBright = styler(ANSI_STYLES.FOREGROUND_COLORS.BLUE_BRIGHT),
	magentaBright = styler(ANSI_STYLES.FOREGROUND_COLORS.MAGENTA_BRIGHT),
	cyanBright = styler(ANSI_STYLES.FOREGROUND_COLORS.CYAN_BRIGHT),
	whiteBright = styler(ANSI_STYLES.FOREGROUND_COLORS.WHITE_BRIGHT),

	-- Background colors
	bgBlack = styler(ANSI_STYLES.BACKGROUND_COLORS.BLACK),
	bgRed = styler(ANSI_STYLES.BACKGROUND_COLORS.RED),
	bgGreen = styler(ANSI_STYLES.BACKGROUND_COLORS.GREEN),
	bgYellow = styler(ANSI_STYLES.BACKGROUND_COLORS.YELLOW),
	bgBlue = styler(ANSI_STYLES.BACKGROUND_COLORS.BLUE),
	bgMagenta = styler(ANSI_STYLES.BACKGROUND_COLORS.MAGENTA),
	bgCyan = styler(ANSI_STYLES.BACKGROUND_COLORS.CYAN),
	bgWhite = styler(ANSI_STYLES.BACKGROUND_COLORS.WHITE),
	bgGrey = styler(ANSI_STYLES.BACKGROUND_COLORS.GREY),
	bgBlackBright = styler(ANSI_STYLES.BACKGROUND_COLORS.BLACK_BRIGHT),
	bgRedBright = styler(ANSI_STYLES.BACKGROUND_COLORS.RED_BRIGHT),
	bgGreenBright = styler(ANSI_STYLES.BACKGROUND_COLORS.GREEN_BRIGHT),
	bgYellowBright = styler(ANSI_STYLES.BACKGROUND_COLORS.YELLOW_BRIGHT),
	bgBlueBright = styler(ANSI_STYLES.BACKGROUND_COLORS.BLUE_BRIGHT),
	bgMagentaBright = styler(ANSI_STYLES.BACKGROUND_COLORS.MAGENTA_BRIGHT),
	bgCyanBright = styler(ANSI_STYLES.BACKGROUND_COLORS.CYAN_BRIGHT),
	bgWhiteBright = styler(ANSI_STYLES.BACKGROUND_COLORS.WHITE_BRIGHT),
}

-- selene: allow(shadowing)
function Crayon.label(text: string, styler: (string) -> string)
	return styler(Crayon.bold(` {text:upper()} `))
end

return Crayon
