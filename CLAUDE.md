# Configuration Files Documentation

**Location:** `~/.config/`
**Last Updated:** 2025-11-19
**Purpose:** Central documentation for all configuration files and changes

---

## 📋 Table of Contents

- [Overview](#overview)
- [Tmux Configuration](#tmux-configuration)
- [WezTerm Configuration](#wezterm-configuration)
- [Neovim Configuration](#neovim-configuration)
- [Quick Reference](#quick-reference)
- [Recent Changes](#recent-changes)

---

## 🎯 Overview

This directory contains all application configurations:

```
~/.config/
├── tmux/                    # Tmux terminal multiplexer
│   ├── tmux.conf           # Main config
│   ├── tmux.reset.conf     # Custom keybindings
│   ├── changelog.md        # Tmux changelog
│   ├── document.md         # Comprehensive docs
│   ├── scripts/            # Custom scripts
│   └── plugins/            # TPM-managed plugins
│
├── wezterm/                # WezTerm terminal emulator
│   ├── wezterm.lua         # Main config
│   ├── appearance.lua      # Theme & fonts
│   ├── keybindings.lua     # Keybindings
│   └── github-dark.lua     # Custom theme
│
├── nvim/                   # Neovim editor
│   └── lua/
│       ├── config/         # Core config
│       └── plugins/        # Plugin configs
│
└── CLAUDE.md              # This file
```

---

## 🖥️ Tmux Configuration

**Prefix Key:** `Ctrl+s`
**Location:** `~/.config/tmux/`
**Detailed Docs:** `~/.config/tmux/document.md`
**Changelog:** `~/.config/tmux/changelog.md`

### Key Features

- **Auto-Equalization:** Panes automatically maintain equal sizes when splitting/killing
- **Vim Integration:** Seamless navigation between tmux and Neovim with `Ctrl+h/j/k/l`
- **Session Persistence:** Auto-save/restore with tmux-resurrect + continuum
- **Modern Plugins:** SessionX, Floax, Thumbs, FZF integration
- **Catppuccin Theme:** Beautiful UI with custom status bar

### Essential Keybindings

```
Ctrl+s then:
  v     = Split vertical (auto-equalizes)
  s     = Split horizontal (auto-equalizes)
  x     = Kill pane (auto-equalizes remaining)
  c     = New window
  o     = SessionX (session manager)
  p     = Floax (floating pane)
  R     = Reload config

No prefix needed:
  Ctrl+h/j/k/l = Navigate panes & vim splits
```

### Recent Updates

**2025-11-19:** Auto-equalization for pane operations
- Splits and kills now automatically equalize all panes
- Uses `select-layout -E` flag
- No manual equalization needed
- **Commit:** `4adcf30`

**2025-11-19:** Vim-tmux-navigator integration
- Seamless navigation between tmux panes and Neovim splits
- No prefix needed for navigation
- **Commit:** `67cef3a`

### Configuration Files

| File | Purpose |
|------|---------|
| `tmux.conf` | Main configuration, plugins, settings |
| `tmux.reset.conf` | Custom keybindings |
| `changelog.md` | All changes documented |
| `document.md` | Comprehensive documentation |
| `scripts/` | Battery, calendar scripts |

### Quick Commands

```bash
# Reload config
Ctrl+s then R

# Edit configs
nvim ~/.config/tmux/tmux.conf
nvim ~/.config/tmux/tmux.reset.conf

# View docs
cat ~/.config/tmux/document.md
cat ~/.config/tmux/changelog.md
```

---

## 🖼️ WezTerm Configuration

**Location:** `~/.config/wezterm/`
**Detailed Docs:** `~/.claude/documents/terminal/wezterm-setup/README.md`

### Key Features

- **Modular Architecture:** Separate files for appearance, keys, etc.
- **Leader Key:** `Ctrl+A` for pane management
- **GitHub Dark Theme:** Custom color scheme matching VS Code
- **Font:** FiraCode Nerd Font with Menlo fallback
- **Hot Reload:** Config changes apply immediately

### Structure

```
wezterm/
├── wezterm.lua         # Main entry point
├── appearance.lua      # Theme, fonts, window
├── keybindings.lua     # All keybindings
├── github-dark.lua     # Custom theme colors
└── config/            # Additional configs
```

### Leader Key Pattern

```
Ctrl+A then:
  h/j/k/l = Navigate panes
  v       = Split vertical
  s       = Split horizontal
  x       = Close pane
  z       = Zoom pane
```

### Configuration Files

| File | Purpose |
|------|---------|
| `wezterm.lua` | Main config, imports modules |
| `appearance.lua` | Theme, colors, fonts, opacity |
| `keybindings.lua` | Leader key, pane management |
| `github-dark.lua` | Custom GitHub Dark colors |

### Quick Commands

```bash
# Edit config
nvim ~/.config/wezterm/wezterm.lua

# View keybindings
cat ~/.claude/documents/terminal/wezterm-setup/KEYBINDINGS.md

# Config reloads automatically on save
```

---

## ✏️ Neovim Configuration

**Location:** `~/.config/nvim/`
**Framework:** LazyVim
**Detailed Docs:** `~/.claude/documents/editors/neovim-vscode-theme/README.md`

### Key Features

- **VS Code Theme:** Default Dark+ theme port
- **LSP Integration:** Full language server support
- **Modern UI:** Lualine, Bufferline, Neo-tree
- **Git Integration:** GitSigns for inline git info
- **Vim-Tmux Navigation:** Seamless pane navigation with tmux

### Structure

```
nvim/
└── lua/
    ├── config/
    │   ├── options.lua      # Editor options
    │   ├── keymaps.lua      # Keybindings
    │   └── lazy.lua         # Plugin manager
    └── plugins/
        ├── colorscheme.lua  # VS Code theme
        ├── ui.lua           # UI components
        ├── navigation.lua   # Vim-tmux-navigator
        └── vscode-features.lua
```

### Essential Plugins

- **vscode.nvim** - VS Code Dark+ theme
- **lualine.nvim** - Status line
- **neo-tree.nvim** - File explorer
- **vim-tmux-navigator** - Seamless tmux navigation
- **gitsigns.nvim** - Git integration
- **lspsaga.nvim** - LSP UI enhancements

### Navigation

```
Ctrl+h/j/k/l = Navigate splits & tmux panes (no prefix!)
Space        = Leader key
Space+e      = Toggle file explorer
Space+ff     = Find files
Space+fg     = Live grep
```

### Quick Commands

```bash
# Edit config
nvim ~/.config/nvim/

# Install/update plugins
:Lazy

# LSP manager
:Mason
```

---

## ⚡ Quick Reference

### Common Tasks

**Reload Configurations:**
```bash
# Tmux
Ctrl+s then R

# WezTerm
# Auto-reloads on save

# Neovim
:source ~/.config/nvim/init.lua
```

**Edit Configurations:**
```bash
# Tmux
nvim ~/.config/tmux/tmux.reset.conf

# WezTerm
nvim ~/.config/wezterm/wezterm.lua

# Neovim
nvim ~/.config/nvim/
```

**View Documentation:**
```bash
# Tmux
cat ~/.config/tmux/document.md
cat ~/.config/tmux/changelog.md

# WezTerm
cat ~/.claude/documents/terminal/wezterm-setup/README.md

# Neovim
cat ~/.claude/documents/editors/neovim-vscode-theme/README.md
```

### Navigation Patterns

**Tmux + Neovim:**
- `Ctrl+h/j/k/l` - Navigate seamlessly (no prefix)
- Works across tmux panes AND Neovim splits

**WezTerm:**
- `Ctrl+A` then `h/j/k/l` - Navigate panes

---

## 📝 Recent Changes

### 2025-11-19

#### Tmux Auto-Equalization
- Added automatic pane equalization after splits and kills
- Panes always maintain equal sizes
- Uses `select-layout -E` flag
- **Files:** `tmux/tmux.reset.conf`
- **Commits:** `4adcf30`, `f58eb4d`

#### Tmux Documentation
- Updated changelog with auto-equalization feature
- Enhanced pane management documentation
- Added behavior examples
- **Files:** `tmux/changelog.md`, `tmux/document.md`

### Earlier 2025-11

#### Vim-Tmux Navigator
- Seamless navigation between tmux and Neovim
- No prefix needed for `Ctrl+h/j/k/l`
- **Commit:** `67cef3a`

#### Tmux Keybinding Fixes
- Changed prefix from `Shift+Space` to `Ctrl+s`
- Fixed dangerous `c` keybinding (was kill-pane, now new-window)
- Added comprehensive plugin ecosystem

#### WezTerm Setup
- Modular Lua configuration
- GitHub Dark theme port
- Leader key pattern implementation

#### Neovim VS Code Theme
- LazyVim with VS Code Dark+ theme
- Full LSP integration
- Modern UI components

---

## 🔗 Links to Detailed Documentation

### Local Documentation
- **Tmux Full Docs:** `~/.config/tmux/document.md`
- **Tmux Changelog:** `~/.config/tmux/changelog.md`
- **Tmux Keybindings:** `~/.claude/documents/terminal/tmux-keybindings/CHEATSHEET.md`
- **WezTerm Guide:** `~/.claude/documents/terminal/wezterm-setup/README.md`
- **Neovim Guide:** `~/.claude/documents/editors/neovim-vscode-theme/README.md`
- **Global Index:** `~/.claude/CLAUDE.md`

### External Resources
- [Tmux Official Docs](https://github.com/tmux/tmux/wiki)
- [WezTerm Docs](https://wezfurlong.org/wezterm/)
- [LazyVim Docs](https://www.lazyvim.org/)
- [Neovim Docs](https://neovim.io/doc/)

---

## 💡 Tips

### When Making Config Changes

1. **Document in Changelog:** Update relevant changelog.md files
2. **Test Thoroughly:** Reload and verify changes work
3. **Commit with Context:** Use descriptive commit messages
4. **Update This File:** Keep this CLAUDE.md current

### Git Workflow

```bash
# After making changes
git status
git diff
git add .
git commit -m "feat(component): description"
git push
```

### Finding Things

```bash
# Search configs
grep -r "pattern" ~/.config/

# Find config files
fd -t f . ~/.config/

# View recent commits
git log --oneline -10
```

---

## 📊 Statistics

**Last Updated:** 2025-11-19
**Total Configurations:** 3 (Tmux, WezTerm, Neovim)
**Config Files:** 20+
**Documentation Files:** 6
**Recent Commits:** 5+

---

**Note:** This file is maintained during Claude sessions to provide immediate context when working with configuration files. For the global index of all learnings, see `~/.claude/CLAUDE.md`.
