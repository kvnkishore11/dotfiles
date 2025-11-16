-- wezterm.lua
-- Main configuration file - loads all modules

local wezterm = require("wezterm")
local appearance = require("appearance")
local keybindings = require("keybindings")

-- Initialize config object
local config = {}

-- Use config_builder for better error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Apply appearance settings
appearance.apply_to_config(config)

-- Apply keybindings
keybindings.apply_to_config(config)

-- Additional platform-specific settings
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- Windows-specific settings
	config.default_prog = { "pwsh.exe", "-NoLogo" }
elseif wezterm.target_triple:find("darwin") then
	-- macOS-specific settings (you're on macOS)
	config.native_macos_fullscreen_mode = false
	config.send_composed_key_when_left_alt_is_pressed = false
	config.send_composed_key_when_right_alt_is_pressed = false
end

-- Enable scroll bar (optional - uncomment if you want it)
-- config.enable_scroll_bar = true

-- GPU acceleration (WezTerm auto-detects, but you can override)
-- config.front_end = "WebGpu"  -- Options: WebGpu, OpenGL, Software

-- Performance settings
config.max_fps = 120
config.animation_fps = 60

-- Scrollback settings
config.scrollback_lines = 10000
config.enable_scroll_bar = true
config.min_scroll_bar_height = "2cell"

-- Mouse wheel behavior in alternate screen (TUI apps like Claude Code, vim, etc.)
-- Set to 0 to pass raw mouse events to apps (needed for tmux mouse scrolling)
-- Non-zero values convert wheel to arrow keys, breaking tmux scrollback
config.alternate_buffer_wheel_scroll_speed = 0

-- Start window at full display size (works with Aerospace window manager)
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	-- Get the dimensions of the active screen
	local screen = wezterm.gui.screens().active

	-- Spawn window filling the entire display
	local tab, pane, window = mux.spawn_window(cmd or {})

	-- Set position to top-left of screen and size to fill display
	local gui_window = window:gui_window()
	if gui_window then
		gui_window:set_position(screen.x, screen.y)
		gui_window:set_inner_size(screen.width, screen.height)
	end
end)

return config
