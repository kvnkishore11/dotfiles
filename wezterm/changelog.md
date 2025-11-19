# WezTerm Configuration Changelog

All notable changes to the WezTerm configuration will be documented in this file.

---

## [2025-11-15] - GitHub Dark Theme

### Added
- Custom GitHub Dark color scheme matching VS Code GitHub Dark theme
- `github-dark.lua` color module with authentic colors from official theme
- Font fallback configuration (FiraCode + Menlo) matching VS Code on macOS

### Changed
- Updated `appearance.lua` to use GitHub Dark colors
- Configured full ANSI color palette (16 colors)
- Set cursor, selection, and tab bar theming

### Technical Details
- Colors extracted from iTerm GitHub Dark colorscheme
- Converted from iTerm XML format to WezTerm Lua format
- Maintained color accuracy to official GitHub theme

**Files Modified:**
- Created: `github-dark.lua`
- Modified: `appearance.lua`

---

## [2025-11-15] - Initial Modular Setup

### Added
- Modular Lua configuration architecture
- Leader key pattern for keybindings (CTRL+A)
- Pane management keybindings
- Hot-reloading configuration support
- Font ligature support (FiraCode Nerd Font)

### Configuration Structure
```
~/.config/wezterm/
├── wezterm.lua           # Main entry point
├── config/
│   ├── appearance.lua    # Theme and colors
│   ├── keybindings.lua   # Keybinding configuration
│   ├── general.lua       # General settings
│   └── init.lua          # Module loader
├── github-dark.lua       # Color scheme module
└── utils/
    └── helpers.lua       # Helper functions
```

### Features
- Clean modular structure
- Easy to maintain and extend
- Leader key for tmux-style workflows
- Native pane management (can work without tmux)
- Font with ligatures for better code readability

---

## Future Improvements

- [ ] Workspace management for projects
- [ ] Custom status bar
- [ ] Auto theme switching (light/dark based on time)
- [ ] Integration with tmux for unified workflow
- [ ] Custom tab bar styling
- [ ] Project-specific configurations
