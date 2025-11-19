# WezTerm Configuration Documentation

**Last Updated:** 2025-11-19
**Config Location:** `~/.config/wezterm/`
**Terminal:** WezTerm

---

## Table of Contents

- [Overview](#overview)
- [File Structure](#file-structure)
- [Keybindings](#keybindings)
- [Appearance & Themes](#appearance--themes)
- [Customization](#customization)
- [Tips & Tricks](#tips--tricks)
- [Troubleshooting](#troubleshooting)

---

## Overview

This WezTerm configuration provides a modern, modular terminal setup with:

- **Modular Architecture:** Organized into separate files for maintainability
- **Leader Key System:** CTRL+A for tmux-style workflows
- **Native Pane Management:** Split and navigate panes without tmux
- **GitHub Dark Theme:** Authentic VS Code GitHub Dark colors
- **Font Ligatures:** FiraCode Nerd Font with programming ligatures
- **Performance:** Optimized with GPU acceleration and 120 FPS

---

## File Structure

```
~/.config/wezterm/
├── wezterm.lua          # Main entry point
├── appearance.lua       # Visual settings (colors, fonts)
├── keybindings.lua     # Keyboard shortcuts
├── github-dark.lua     # GitHub Dark color scheme
├── changelog.md        # Changes log
├── document.md         # This file
└── wezterm.lua.backup  # Original config backup
```

### Main Config (`wezterm.lua`)

Entry point that loads all modules:
```lua
local config = {}
require('appearance').apply_to_config(config)
require('keybindings').apply_to_config(config)
return config
```

### Appearance (`appearance.lua`)

Visual configuration:
- Color scheme (GitHub Dark)
- Font settings
- Window styling
- Performance options

### Keybindings (`keybindings.lua`)

All keyboard shortcuts:
- Leader key configuration
- Pane management
- Font size controls
- Special commands

### Color Scheme (`github-dark.lua`)

Custom GitHub Dark theme module:
- Authentic GitHub colors from VS Code
- Full ANSI palette (16 colors)
- Cursor and selection styling

---

## Keybindings

### Leader Key

**Leader:** `CTRL+A`

Press `CTRL+A`, release, then press the command key.

### Basic Commands

| Shortcut | Action |
|----------|--------|
| `CTRL+Q` | Toggle fullscreen |
| `CTRL+'` | Clear scrollback buffer |
| `CMD+=` | Increase font size |
| `CMD+-` | Decrease font size |
| `CMD+0` | Reset font size |
| `CTRL+SHIFT+L` | Show debug overlay |

### Pane Management

Press `CTRL+A` first, then:

| After Leader | Action |
|--------------|--------|
| `SHIFT+\|` | Split horizontally (side by side) |
| `-` | Split vertically (top/bottom) |
| `h` | Move to left pane |
| `j` | Move to lower pane |
| `k` | Move to upper pane |
| `l` | Move to right pane |
| `x` | Close current pane (with confirmation) |
| `r` | Enter resize mode |

**Mnemonics:**
- `h/j/k/l` = Vim-style navigation (left/down/up/right)
- `|` = Vertical line (splits horizontally)
- `-` = Horizontal line (splits vertically)
- `r` = **R**esize mode
- `x` = Close (e**X**it)

### Resize Mode

After pressing `CTRL+A` then `r`:

| Key | Action |
|-----|--------|
| `h` | Shrink pane left |
| `j` | Shrink pane down |
| `k` | Grow pane up |
| `l` | Grow pane right |
| `ESC` or `ENTER` | Exit resize mode |

**Tip:** Stay in resize mode to make multiple adjustments without re-pressing `CTRL+A`.

### Mouse Actions

| Action | Result |
|--------|--------|
| `CTRL+Click` | Open URL under cursor |

---

## Appearance & Themes

### Current Theme: GitHub Dark

Authentic GitHub Dark colors from VS Code.

**Base Colors:**
- Background: `#010408` (deep black)
- Foreground: `#E7ECEF` (soft white)
- Cursor: `#2F81F7` (bright blue)
- Selection: `#305B74` (blue-tinted)

**ANSI Colors:**
- Black: `#505966`
- Red: `#FF7B72`
- Green: `#3FB950`
- Yellow: `#D29922`
- Blue: `#58A6FF`
- Magenta: `#BC8CFF`
- Cyan: `#76E3EA`
- White: `#CDD6D3`

### Font Configuration

**Font Stack:**
```lua
FiraCode Nerd Font → Menlo → Monaco → monospace
```

**Features:**
- Programming ligatures (FiraCode)
- Fallback to VS Code default (Menlo on macOS)
- Size: 14pt

**Font Settings:**
```lua
config.font = wezterm.font_with_fallback({
  "FiraCode Nerd Font",
  "Menlo",
  "Monaco",
  "monospace",
})
config.font_size = 14
config.line_height = 1.2
```

### Window Styling

```lua
config.window_decorations = "RESIZE"  -- Minimal decorations
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}
```

### Performance Settings

```lua
config.max_fps = 120                  -- Smooth rendering
config.front_end = "WebGpu"           -- GPU acceleration
config.cursor_blink_rate = 800        -- Blinking cursor
```

---

## Customization

### Change Color Scheme

#### Option 1: Use Built-in Themes

Edit `appearance.lua`:
```lua
-- Comment out GitHub Dark
-- config.colors = github_dark.colors()

-- Use built-in theme
config.color_scheme = "Catppuccin Mocha"
```

**Popular Themes:**
- `"Tokyo Night"`
- `"Nord"`
- `"Dracula"`
- `"Solarized Dark"`
- `"Gruvbox Dark"`

Browse all: https://wezfurlong.org/wezterm/colorschemes/index.html

#### Option 2: Customize GitHub Dark

Edit `github-dark.lua` to tweak colors:
```lua
background = "#010408",   -- Make darker/lighter
cursor_bg = "#2F81F7",    -- Change cursor color
-- etc.
```

### Change Leader Key

Edit `keybindings.lua`:
```lua
-- Change from CTRL+A to CTRL+B
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
```

### Add Custom Keybindings

Edit `keybindings.lua`:
```lua
table.insert(config.keys, {
  key = "t",
  mods = "CMD",
  action = act.SpawnTab("CurrentPaneDomain"),
})
```

### Change Font

Edit `appearance.lua`:
```lua
config.font = wezterm.font("JetBrains Mono")
config.font_size = 16
```

### Adjust Window Padding

Edit `appearance.lua`:
```lua
config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 20,
}
```

---

## Tips & Tricks

### Leader Key Workflow

1. **Think of `CTRL+A` as "command mode"**
   - Press it, release, then press your command
   - Similar to tmux workflow
   - Prevents conflicts with other apps

2. **Common Sequences:**
   ```
   CTRL+A |   = Split for code + terminal
   CTRL+A h/l = Switch between them
   CTRL+A r   = Adjust sizes
   ```

### Coding Workflow

**Side-by-side editing:**
```
1. CTRL+A then |   → Split horizontally
2. CTRL+A then h/l → Switch between editor and terminal
3. CTRL+A then r   → Resize to preferred ratio
```

**Multi-project setup:**
```
1. CTRL+A then -   → Split vertically
2. CTRL+A then |   → Split one side horizontally
3. CTRL+A then hjkl → Navigate between all panes
```

### Presentation Mode

```
1. CMD+0       → Reset font to default
2. CMD+=       → Increase for visibility (multiple times)
3. CTRL+Q      → Fullscreen
4. CTRL+'      → Clear clutter
```

### Quick Font Adjustments

```
CMD+=  → Bigger (for presentations, pair programming)
CMD+-  → Smaller (for more screen space)
CMD+0  → Reset (back to default 14pt)
```

### Working with URLs

```
CTRL+Click → Open any URL in browser
```

Works with:
- http/https URLs
- File paths
- Git hashes (on GitHub)

### Resize Mode Efficiency

```
CTRL+A r       → Enter resize mode once
h h h h        → Make multiple adjustments
j j j          → Resize in different directions
ESC            → Exit when done
```

No need to keep pressing `CTRL+A`!

---

## Troubleshooting

### Config Not Loading

**Reload WezTerm:**
1. Close and reopen WezTerm
2. Or use config reload if bound

**Check for errors:**
```bash
wezterm -n check-config
```

### Colors Look Wrong

**Check terminal color support:**
```bash
echo $TERM
```

Should show `wezterm`.

**Force true color:**
Add to shell config (~/.zshrc or ~/.bashrc):
```bash
export COLORTERM=truecolor
```

### Font Not Rendering Properly

**Check font is installed:**
```bash
fc-list | grep FiraCode
```

**Install FiraCode Nerd Font:**
```bash
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font
```

**Use fallback:**
Edit `appearance.lua` to use a font you have:
```lua
config.font = wezterm.font("Monaco")
```

### Ligatures Not Working

**Enable ligatures:**
```lua
config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
```

**Or disable them:**
```lua
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
```

### Panes Not Working

**Check keybindings:**
```lua
-- In wezterm.lua
print(config.leader)  -- Should show CTRL+A
```

**Test leader key:**
```
CTRL+A ?  -- Shows all keybindings
```

### Performance Issues

**Reduce FPS:**
```lua
config.max_fps = 60
```

**Change front-end:**
```lua
config.front_end = "OpenGL"  -- Instead of WebGpu
```

**Disable animations:**
```lua
config.animation_fps = 1
```

---

## Common Workflows

### Development Setup

**Typical layout:**
```
┌─────────────┬──────────┐
│             │          │
│   Editor    │ Terminal │
│             │          │
├─────────────┴──────────┤
│   Test Runner          │
└────────────────────────┘
```

**How to create:**
```
1. CTRL+A |  → Split right for terminal
2. CTRL+A -  → Split bottom for tests
3. CTRL+A h  → Back to editor
```

### System Administration

**Monitor multiple logs:**
```
┌──────┬──────┬──────┐
│ Log1 │ Log2 │ Log3 │
├──────┴──────┴──────┤
│   Command Pane     │
└────────────────────┘
```

**How to create:**
```
1. CTRL+A |  → Split right
2. CTRL+A |  → Split right again
3. CTRL+A -  → Split bottom
```

### Note Taking

**Reference + Notes:**
```
┌─────────────┐
│  Reference  │
├─────────────┤
│    Notes    │
└─────────────┘
```

**How to create:**
```
1. CTRL+A -  → Split bottom
2. CTRL+A r  → Resize to 70/30 split
```

---

## Quick Reference Card

### Essential Commands

```
CTRL+Q          → Fullscreen
CTRL+'          → Clear Screen
CMD +/-/0       → Font Size

PANE MANAGEMENT (CTRL+A then...):
  |             → Split Horizontal
  -             → Split Vertical
  h/j/k/l       → Navigate Panes
  x             → Close Pane
  r             → Resize Mode

IN RESIZE MODE:
  h/j/k/l       → Resize Directions
  ESC           → Exit
```

---

## External Resources

- [WezTerm Official Docs](https://wezfurlong.org/wezterm/)
- [Color Schemes](https://wezfurlong.org/wezterm/colorschemes/index.html)
- [GitHub Dark Theme Source](https://github.com/projekt0n/github-theme-contrib)
- [FiraCode Font](https://github.com/tonsky/FiraCode)

---

**Maintained by:** Your dotfiles
**Last Updated:** 2025-11-19
