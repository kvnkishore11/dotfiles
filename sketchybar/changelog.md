# SketchyBar Changelog

## 2025-12-06 - Custom Floating Islands + Catppuccin Mocha Theme

**What changed:** Complete redesign with floating islands style and Catppuccin Mocha colors

**Style:** Floating Islands (separated sections with gaps)
**Theme:** Catppuccin Mocha (warm pastels)

**Layout:**
- **Left Island:** Aerospace workspace indicators (1-9 + A, C, D, E, M, P, V, W)
- **Left:** Active app name with icon + window title
- **Center Island:** Clock with date
- **Right Island:** WiFi → Volume → Battery → Mic mute indicator
- **Right Island:** Menu bar aliases (Control Center items)

**Files created/modified:**
- `sketchybarrc` - Main config with floating islands style
- `colors.sh` - Catppuccin Mocha color palette
- `icons.sh` - Nerd Font icon definitions
- `plugins/aerospace.sh` - Aerospace workspace integration
- `plugins/front_app.sh` - Active app with icon
- `plugins/window_title.sh` - Window title display
- `plugins/clock.sh` - Date/time formatting
- `plugins/battery.sh` - Battery with color coding
- `plugins/volume.sh` - Volume with icons
- `plugins/wifi.sh` - WiFi status
- `plugins/mic.sh` - Mic mute indicator
- `plugins/mic_click.sh` - Toggle mic mute on click

**Aerospace integration:**
- Added `exec-on-workspace-change` to `~/.config/aerospace/aerospace.toml`
- Updated `outer.top` gap to 50px to accommodate SketchyBar
- Workspace indicators highlight active workspace in Mauve color

**Fonts installed:**
- Hack Nerd Font (for icons)
- sketchybar-app-font (for app icons)

---

## 2025-12-06 - Initial Setup

**What changed:** Installed and configured SketchyBar status bar

**Why:** User requested setup of SketchyBar for macOS status bar customization

**Details:**
- Installed SketchyBar v2.23.0 via Homebrew (`brew tap FelixKratz/formulae && brew install sketchybar`)
- Installed Hack Nerd Font for icon support
- Enabled auto-start via `brew services start felixkratz/formulae/sketchybar`

**Useful commands:**
- Restart: `brew services restart sketchybar`
- Stop: `brew services stop sketchybar`
- Reload config: `sketchybar --reload`
- Check status: `brew services list | grep sketchybar`

**Documentation:** https://felixkratz.github.io/SketchyBar/
