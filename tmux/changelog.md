# Tmux Configuration Changelog

All notable changes to the tmux configuration will be documented in this file.

---

## [2025-11-19] - Add `f` as Zoom Alias

### Added
- `f` now zooms/unzooms pane (same as `z`)
- Alternative keybinding for easier reach

### Reason
- `z` is further to reach compared to `f`
- `f` is more ergonomic and faster to access
- `F` (capital) remains for FZF menu

**Commit:** TBD

---

## [2025-11-19] - Auto-Equalization for Pane Operations

### Added
- Automatic pane equalization after splitting panes
- Automatic pane equalization after killing panes
- `select-layout -E` command automatically runs after pane operations

### Changed
- `v` (split vertical) now auto-equalizes all panes after splitting
- `s` (split horizontal) now auto-equalizes all panes after splitting
- `x` (kill pane) now auto-equalizes remaining panes after deletion

### Behavior
- When creating panes: All panes automatically resize to equal sizes
- When deleting panes: Remaining panes automatically redistribute equally
- Example: 4 equal panes (25% each) → split one → 5 equal panes (20% each)
- Example: 4 equal panes (25% each) → kill one → 3 equal panes (33% each)

### Technical Details
- Uses tmux's `select-layout -E` flag to spread panes evenly
- Applied to both horizontal and vertical splits
- No manual equalization needed (previously required `Ctrl+s E`)

**Commit:** `4adcf30`

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
