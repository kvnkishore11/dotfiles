# Tmux Configuration Changelog

All notable changes to the tmux configuration will be documented in this file.

---

## [2025-11-19] - Vim-Tmux-Navigator Integration

### Added
- `christoomey/vim-tmux-navigator` plugin for seamless navigation between tmux panes and vim splits
- Support for `Ctrl+h/j/k/l` navigation without prefix
- Documentation comments in `tmux.reset.conf` explaining the dual navigation system

### Changed
- Navigation now works seamlessly across tmux and Neovim boundaries
- Prefix-based navigation (`Ctrl+s h/j/k/l`) preserved as backup method

### Technical Details
- Plugin automatically detects vim/tmux boundaries
- Works with Neovim plugin of the same name
- No breaking changes to existing keybindings

**Commit:** `67cef3a`

---

## [2025-11-15] - Custom Keybindings & Plugins

### Changed
- Changed prefix from `Shift+Space` to `Ctrl+s` for better ergonomics
- Fixed dangerous keybinding where `c` killed panes (now creates windows)
- Remapped pane killing to `x` (standard behavior)
- Added `X` (Shift+X) for swapping panes

### Added
- tmux-resurrect for session persistence
- tmux-continuum for auto-save/restore
- tmux-floax for floating panes
- tmux-sessionx for better session management
- tmux-thumbs for URL/text copying
- tmux-battery for battery indicator in status bar
- Catppuccin theme
- Vim-style pane navigation (prefix + h/j/k/l)
- Custom status bar with 2-line layout
- Heavy pane borders with colors

### Configuration Files
- `~/.tmux.conf` - Main configuration
- `~/.config/tmux/tmux.reset.conf` - Keybindings reset and custom bindings

**Commits:** `029fcba`, `07c26d2`, `67e4555`

---

## Future Improvements

- [ ] Auto theme switching (light/dark) based on time
- [ ] Custom session templates for different workflows
- [ ] Integration with git status in status bar
- [ ] Custom scripts for status bar modules
