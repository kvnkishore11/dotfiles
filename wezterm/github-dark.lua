-- github-dark.lua
-- GitHub Dark Default color scheme for WezTerm
-- Based on the official GitHub VS Code theme

local module = {}

function module.colors()
	return {
		-- The default text color
		foreground = "#E7ECEF",
		-- The default background color (matched to Catppuccin Mocha for tmux status bar blending)
		background = "#1e1e2e",

		-- Cursor colors
		cursor_bg = "#2F81F7",
		cursor_fg = "#010408",
		cursor_border = "#2F81F7",

		-- Selection colors
		selection_fg = "#E7ECEF",
		selection_bg = "#305B74",

		-- Scrollbar
		scrollbar_thumb = "#4A4E58",

		-- Split pane dividers
		split = "#4A4E58",

		-- ANSI color palette
		ansi = {
			"#4A4E58", -- black
			"#EE8277", -- red
			"#644C5C", -- green (darker in GitHub theme)
			"#C99C3E", -- yellow
			"#6BA4F8", -- blue
			"#B48EF8", -- magenta
			"#66C2CD", -- cyan
			"#B3B9C3", -- white
		},

		-- Bright ANSI colors
		brights = {
			"#6F7682", -- bright black
			"#F1A59D", -- bright red
			"#79D0B8", -- bright green
			"#DDB577", -- bright yellow
			"#89BFFA", -- bright blue
			"#CBABFA", -- bright magenta
			"#7AD1DB", -- bright cyan
			"#FFFFFF", -- bright white
		},

		-- Tab bar colors (if enabled)
		tab_bar = {
			background = "#1e1e2e",  -- Matched to Catppuccin Mocha
			active_tab = {
				bg_color = "#305B74",
				fg_color = "#E7ECEF",
				intensity = "Bold",
			},
			inactive_tab = {
				bg_color = "#0D1117",
				fg_color = "#6F7682",
			},
			inactive_tab_hover = {
				bg_color = "#161B22",
				fg_color = "#B3B9C3",
			},
			new_tab = {
				bg_color = "#0D1117",
				fg_color = "#6F7682",
			},
			new_tab_hover = {
				bg_color = "#161B22",
				fg_color = "#B3B9C3",
			},
		},
	}
end

return module
