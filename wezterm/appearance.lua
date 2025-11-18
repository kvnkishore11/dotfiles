-- appearance.lua
-- Visual configuration: colors, fonts, window styling

local wezterm = require("wezterm")
local github_dark = require("github-dark")
local module = {}

function module.apply_to_config(config)
	-- GitHub Dark color scheme (matching VS Code)
	-- To switch back to Catppuccin, change to: config.color_scheme = "Catppuccin Mocha"
	config.colors = github_dark.colors()

	-- Font configuration (matching VS Code default for macOS)
	-- VS Code uses: "Menlo, Monaco, 'Courier New', monospace"
	-- Keeping FiraCode Nerd Font with ligatures, but you can switch to Menlo for exact VS Code match
	config.font = wezterm.font_with_fallback({
		{ family = "FiraCode Nerd Font", weight = "Regular" }, -- Programming ligatures
		{ family = "Menlo", weight = "Regular" }, -- VS Code default on macOS
		{ family = "Monaco", weight = "Regular" }, -- Fallback
		"monospace", -- System fallback
	})
	config.font_size = 14.0

	-- Enable font ligatures (makes =>, !=, etc. look prettier)
	config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

	-- Line height and character spacing for better readability
	config.line_height = 1.2
	config.cell_width = 1.0

	-- Window appearance
	config.window_decorations = "RESIZE"
	config.enable_tab_bar = false  -- Disabled since using tmux for session management

	-- Window padding (adds breathing room around terminal content)
	config.window_padding = {
		left = 40,
		right = 40,
		top = 40,
		bottom = 30,
	}

	-- Transparency and blur effects (macOS)
	-- Set to 1.0 for solid background (eliminates dark band issue)
	config.window_background_opacity = 1.0
	config.macos_window_background_blur = 0

	-- Prevent window from resizing when font size changes
	config.adjust_window_size_when_changing_font_size = false

	-- Optional: Uncomment to use background image
	-- config.window_background_image = '/path/to/your/image.jpg'
	-- config.window_background_image_hsb = {
	-- 	brightness = 0.01,
	-- 	hue = 1.0,
	-- 	saturation = 0.5,
	-- }

	-- Cursor style
	config.default_cursor_style = "BlinkingBar"
	config.cursor_blink_rate = 800
end

return module
