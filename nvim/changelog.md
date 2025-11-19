# Neovim Configuration Changelog

All notable changes to the Neovim/LazyVim configuration will be documented in this file.

---

## [2025-11-19] - Vim-Tmux-Navigator Integration

### Added
- `christoomey/vim-tmux-navigator` plugin for seamless navigation between Neovim splits and tmux panes
- New plugin config: `lua/plugins/navigation.lua`
- Keybindings: `Ctrl+h/j/k/l` for tmux-aware navigation
- `Ctrl+\` for navigating to previous split/pane

### Technical Details
- Works in conjunction with tmux plugin of the same name
- Smart boundary detection between vim and tmux
- No breaking changes to existing navigation

**Files Modified:**
- Created: `lua/plugins/navigation.lua`

---

## [2025-11-15] - VS Code Theme & LazyVim Setup

### Added
- LazyVim as the base configuration framework
- `vscode.nvim` plugin for VS Code Dark+ theme
- UI plugins:
  - `lualine.nvim` - Statusline
  - `bufferline.nvim` - Tab/buffer line
  - `neo-tree.nvim` - File explorer
- LSP enhancements:
  - `lspsaga.nvim` - Better LSP UI
  - `trouble.nvim` - Problems panel
  - `nvim-navic` - Breadcrumbs
- Feature plugins:
  - `gitsigns.nvim` - Git integration
  - `mini.map` - Code minimap
  - `neoscroll.nvim` - Smooth scrolling
  - `nvim-colorizer.lua` - Color preview

### Configuration Files Created
- `lua/config/lazy.lua` - LazyVim bootstrap
- `lua/config/options.lua` - Editor options
- `lua/config/keymaps.lua` - Custom keymaps
- `lua/plugins/colorscheme.lua` - VS Code theme config
- `lua/plugins/ui.lua` - UI plugin configs
- `lua/plugins/vscode-features.lua` - VS Code-like features

### Features
- Authentic VS Code Dark+ colors
- File explorer with icons
- Integrated git signs
- LSP-powered code intelligence
- Minimap for code navigation
- Smooth scrolling
- Color code preview (#hex colors)
- Problems panel

---

## Future Improvements

- [ ] Configure language servers via Mason
- [ ] Set up debugger (nvim-dap)
- [ ] Configure snippets (LuaSnip)
- [ ] Add custom keybindings for specific workflows
- [ ] Test runner integration
