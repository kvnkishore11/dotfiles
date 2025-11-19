-- keybindings.lua
-- All keyboard shortcuts and mouse bindings

local wezterm = require("wezterm")
local act = wezterm.action
local module = {}

function module.apply_to_config(config)
	-- Leader key (like tmux) - press CTRL+A, then another key
	-- This prevents conflicts with other apps
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

	config.keys = {
		-- Toggle fullscreen
		{
			key = "q",
			mods = "CTRL",
			action = act.ToggleFullScreen,
		},

		-- Clear scrollback and viewport
		{
			key = "'",
			mods = "CTRL",
			action = act.ClearScrollback("ScrollbackAndViewport"),
		},

		-- Split panes (tmux-style with leader key)
		{
			key = "|",
			mods = "LEADER|SHIFT",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "LEADER",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},

		-- Navigate between panes
		{
			key = "h",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Down"),
		},

		-- Close current pane
		{
			key = "x",
			mods = "LEADER",
			action = act.CloseCurrentPane({ confirm = true }),
		},

		-- Font size adjustment
		{
			key = "=",
			mods = "CMD",
			action = act.IncreaseFontSize,
		},
		{
			key = "-",
			mods = "CMD",
			action = act.DecreaseFontSize,
		},
		{
			key = "0",
			mods = "CMD",
			action = act.ResetFontSize,
		},

		-- Activate resize mode (LEADER + r, then use hjkl to resize)
		{
			key = "r",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "resize_pane",
				one_shot = false,
			}),
		},

		-- Show debug overlay (useful for testing)
		{
			key = "L",
			mods = "CTRL|SHIFT",
			action = act.ShowDebugOverlay,
		},
	}

	-- Resize mode key table
	config.key_tables = {
		resize_pane = {
			{ key = "h", action = act.AdjustPaneSize({ "Left", 5 }) },
			{ key = "l", action = act.AdjustPaneSize({ "Right", 5 }) },
			{ key = "k", action = act.AdjustPaneSize({ "Up", 5 }) },
			{ key = "j", action = act.AdjustPaneSize({ "Down", 5 }) },
			-- Exit resize mode
			{ key = "Escape", action = "PopKeyTable" },
			{ key = "Enter", action = "PopKeyTable" },
		},
	}

	-- Mouse bindings
	config.mouse_bindings = {
		-- Paste with middle click
		{
			event = { Up = { streak = 1, button = "Middle" } },
			mods = "NONE",
			action = act.PasteFrom("Clipboard"),
		},
		-- Auto-copy selection when dragging
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = act.CompleteSelectionOrOpenLinkAtMouseCursor("ClipboardAndPrimarySelection"),
		},
	}
end

return module
