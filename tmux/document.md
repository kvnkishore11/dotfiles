# Tmux Configuration Documentation

**Last Updated:** 2025-11-19
**Prefix Key:** `Ctrl+s`
**Config Location:** `~/.config/tmux/`

---

## Table of Contents

- [Overview](#overview)
- [Configuration Files](#configuration-files)
- [Keybindings Reference](#keybindings-reference)
- [Plugins](#plugins)
- [Vim-Tmux Navigator](#vim-tmux-navigator)
- [Tips & Tricks](#tips--tricks)
- [Troubleshooting](#troubleshooting)

---

## Overview

This tmux configuration is optimized for:
- **Ergonomic prefix:** `Ctrl+s` (left hand friendly)
- **Vim-style navigation:** `h/j/k/l` for intuitive pane movement
- **Seamless vim integration:** Navigate between tmux panes and Neovim splits with `Ctrl+h/j/k/l`
- **Auto-equalization:** Panes automatically maintain equal sizes when splitting or killing
- **Session persistence:** Auto-save and restore sessions
- **Modern plugins:** SessionX, Floax, Thumbs, FZF integration
- **Beautiful UI:** Catppuccin theme with custom status bar

---

## Configuration Files

### Structure
```
~/.config/tmux/
├── tmux.conf              # Symlinked from ~/.tmux.conf (main config)
├── tmux.reset.conf        # Custom keybindings
├── changelog.md           # This file - tracks all changes
├── document.md            # Comprehensive documentation
├── scripts/               # Custom scripts for status bar
│   ├── battery_spaced.sh
│   └── cal.sh
└── plugins/               # TPM-managed plugins
```

### Main Config (`~/.tmux.conf` → `~/.config/tmux/tmux.conf`)

Key settings:
```bash
# Prefix
set -g prefix C-s

# Terminal
set-option -g default-terminal 'screen-256color'
set-option -g terminal-overrides ',xterm-256color:RGB'

# Behavior
set -g base-index 1              # Start indexing windows at 1
set -g detach-on-destroy off     # Don't exit when closing a session
set -g escape-time 0             # Zero-out escape time delay
set -g history-limit 1000000     # Increase history size
set -g renumber-windows on       # Renumber windows when any is closed
set -g set-clipboard on          # Use system clipboard
set -g status-position top       # macOS style
set -g mouse on                  # Enable mouse support
setw -g mode-keys vi             # Vi-style keybindings in copy mode
```

### Keybindings Config (`~/.config/tmux/tmux.reset.conf`)

See [Keybindings Reference](#keybindings-reference) below.

---

## Keybindings Reference

### Window Management

| Shortcut | Action | Notes |
|----------|--------|-------|
| `C-s c` | **Create new window** | Standard behavior |
| `C-s C-c` | Create new window | Alternative |
| `C-s n` | Next window | |
| `C-s p` | Previous window | |
| `C-s H` | Previous window | Capital H |
| `C-s L` | Next window | Capital L |
| `C-s 0-9` | Jump to window # | Direct access |
| `C-s C-a` | Toggle last window | Quick switch |
| `C-s w` | List all windows | Interactive picker |
| `C-s r` | Rename current window | Enter new name |
| `C-s &` | Kill window | With confirmation |

### Pane Management

| Shortcut | Action | Notes |
|----------|--------|-------|
| `C-s v` | **Split vertically** | Side-by-side panes + auto-equalize |
| `C-s s` | **Split horizontally** | Top/bottom panes + auto-equalize |
| `C-s x` | **Kill pane** | Auto-equalizes remaining panes |
| `C-s X` | Swap pane down | Capital X |
| `C-s z` | Zoom/unzoom pane | Toggle fullscreen |
| `C-s q` | Show pane numbers | Click number to select |
| `C-s o` | Cycle through panes | Round-robin |
| `C-s ;` | Go to last pane | Quick toggle |
| `C-s !` | Break pane to window | Make pane its own window |

**Auto-Equalization:**
- All split and kill operations automatically equalize pane sizes
- Panes always maintain equal spacing without manual intervention
- Example: 4 panes → split → 5 equal panes (20% each)
- Example: 4 panes → kill one → 3 equal panes (33% each)

### Pane Navigation

#### Vim-Style (with prefix)
| Shortcut | Direction |
|----------|-----------|
| `C-s h` | Move **LEFT** |
| `C-s j` | Move **DOWN** |
| `C-s k` | Move **UP** |
| `C-s l` | Move **RIGHT** |

#### Seamless Navigation (without prefix) - vim-tmux-navigator
| Shortcut | Direction | Notes |
|----------|-----------|-------|
| `C-h` | Move **LEFT** | Works in tmux AND vim |
| `C-j` | Move **DOWN** | Works in tmux AND vim |
| `C-k` | Move **UP** | Works in tmux AND vim |
| `C-l` | Move **RIGHT** | Works in tmux AND vim |
| `C-\` | Previous pane/split | Works in tmux AND vim |

**See [Vim-Tmux Navigator](#vim-tmux-navigator) section for details.**

### Pane Resizing

| Shortcut | Action | Amount |
|----------|--------|--------|
| `C-s ,` | Resize **left** | 20 units |
| `C-s .` | Resize **right** | 20 units |
| `C-s -` | Resize **down** | 7 units |
| `C-s =` | Resize **up** | 7 units |

### Session Management

| Shortcut | Action |
|----------|--------|
| `C-s d` | Detach from session |
| `C-s S` | Choose session (interactive) |
| `C-s $` | Rename current session |
| `C-s (` | Switch to previous session |
| `C-s )` | Switch to next session |
| `C-s N` | Create new session (prompts for name) |

### Copy Mode

| Shortcut | Action |
|----------|--------|
| `C-s [` | **Enter copy mode** |
| `C-s ]` | Paste from buffer |
| `C-s #` | List all buffers |

**In Copy Mode (Vi-style):**
- `v` - Begin selection
- `y` - Copy selection
- `Enter` - Copy and exit
- `q` - Exit copy mode
- `/` - Search forward
- `h/j/k/l` - Navigate

### General

| Shortcut | Action |
|----------|--------|
| `C-s :` | Command prompt |
| `C-s ?` | List all keybindings |
| `C-s R` | **Reload tmux config** |
| `C-s K` | Clear screen |

---

## Plugins

### Plugin Manager: TPM

**Installation:**
```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

**Plugin Management:**
| Shortcut | Action |
|----------|--------|
| `C-s I` | Install new plugins |
| `C-s U` | Update plugins |
| `C-s Alt-u` | Clean unused plugins |

### Installed Plugins

#### 1. **tmux-sensible**
Basic tmux settings everyone can agree on.
- Better default settings
- Automatically enabled

#### 2. **tmux-yank**
Copy to system clipboard.
| Shortcut | Action |
|----------|--------|
| `C-s y` | Copy current line |
| `C-s Y` | Copy pane's working directory |

#### 3. **tmux-resurrect**
Save and restore tmux sessions.
| Shortcut | Action |
|----------|--------|
| `C-s C-s` | **Save session** |
| `C-s C-r` | **Restore session** |

Config:
```bash
set -g @resurrect-strategy-nvim 'session'
```

#### 4. **tmux-continuum**
Automatic session saving/restoring.
```bash
set -g @continuum-restore 'on'
```
- Auto-saves every 15 minutes
- Auto-restores on tmux start

#### 5. **tmux-thumbs**
Copy/paste with keyboard hints.
| Shortcut | Action |
|----------|--------|
| `C-s Space` | Activate thumbs (copy hints) |

Shows hints for URLs, file paths, etc. Type the hint to copy.

#### 6. **tmux-fzf**
FZF integration for tmux.
| Shortcut | Action |
|----------|--------|
| `C-s F` | Open FZF menu |

#### 7. **tmux-fzf-url**
Extract and open URLs with FZF.
| Shortcut | Action |
|----------|--------|
| `C-s u` | FZF URL picker |

Config:
```bash
set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'
set -g @fzf-url-history-limit '2000'
```

#### 8. **tmux-sessionx**
Advanced session manager.
| Shortcut | Action |
|----------|--------|
| `C-s o` | Open SessionX |

Config:
```bash
set -g @sessionx-bind 'o'
set -g @sessionx-x-path '~/WebstormProjects'
set -g @sessionx-custom-paths '~/.config'
set -g @sessionx-filter-current 'false'
set -g @sessionx-preview-enabled 'true'
```

#### 9. **tmux-floax**
Floating panes (like a terminal dropdown).
| Shortcut | Action |
|----------|--------|
| `C-s p` | Toggle floating pane |

Config:
```bash
set -g @floax-width '80%'
set -g @floax-height '80%'
set -g @floax-border-color 'magenta'
set -g @floax-text-color 'blue'
```

#### 10. **tmux-battery**
Battery indicator for status bar.

Shows battery percentage and icon in status bar.

#### 11. **catppuccin-tmux**
Beautiful Catppuccin theme.

Config:
```bash
set -g @catppuccin_window_left_separator ""
set -g @catppuccin_window_right_separator " "
set -g @catppuccin_status_modules_right "directory date_time battery"
set -g @catppuccin_status_modules_left "session"
set -g @catppuccin_date_time_text "%H:%M"
```

#### 12. **vim-tmux-navigator**
Seamless navigation between tmux and vim/neovim.

See [Vim-Tmux Navigator](#vim-tmux-navigator) section below.

---

## Vim-Tmux Navigator

### Overview

Seamless navigation between tmux panes and Neovim splits using `Ctrl+h/j/k/l` without needing the tmux prefix.

### What It Does

- **Unified Navigation:** Use `Ctrl+h/j/k/l` to move between tmux panes AND Neovim splits
- **Smart Detection:** Automatically detects whether you're at a vim split or tmux pane boundary
- **No Prefix Needed:** Navigate without pressing `Ctrl+s` first
- **Backup Navigation:** Original `Ctrl+s h/j/k/l` navigation still works as fallback

### Installation

**Tmux Side:**
Plugin automatically installed via TPM (see Plugins section).

**Neovim Side:**
Configuration in `~/.config/nvim/lua/plugins/navigation.lua`:
```lua
return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
    { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
  },
}
```

### Keybindings

| Keybinding | Action | Context |
|------------|--------|---------|
| `Ctrl+h` | Move left | Tmux & Vim |
| `Ctrl+j` | Move down | Tmux & Vim |
| `Ctrl+k` | Move up | Tmux & Vim |
| `Ctrl+l` | Move right | Tmux & Vim |
| `Ctrl+\` | Previous pane/split | Tmux & Vim |

### How It Works

**In Tmux (without Neovim):**
- `Ctrl+h/j/k/l` navigates between tmux panes normally

**In Neovim (within tmux):**
- `Ctrl+h/j/k/l` navigates between Neovim splits
- When you reach the edge of Neovim, it automatically switches to the tmux pane in that direction
- Creates seamless boundary crossing

**Example:**
```
┌─────────────────────────────────┐
│ Tmux Pane 1: Neovim             │
│ ┌─────────┬─────────┐           │
│ │ Split 1 │ Split 2 │           │
│ └─────────┴─────────┘           │
└─────────────────────────────────┘
┌─────────────────────────────────┐
│ Tmux Pane 2: Terminal           │
└─────────────────────────────────┘
```

1. Start in Neovim Split 1
2. `Ctrl+l` → Move to Neovim Split 2
3. `Ctrl+l` → Still in Split 2 (at edge)
4. If there's a tmux pane to the right, it would switch there
5. `Ctrl+j` → Move to Tmux Pane 2 (terminal below)
6. `Ctrl+k` → Move back to Neovim in Tmux Pane 1

### Testing

```bash
# 1. Open tmux
tmux

# 2. Create splits in tmux
C-s v  # Vertical split
C-s s  # Horizontal split

# 3. Open Neovim in one pane
nvim

# 4. Create splits in Neovim
:vsplit

# 5. Test navigation
C-h/j/k/l  # Navigate seamlessly!
```

### Troubleshooting

**Navigation not working in Neovim:**
```vim
:Lazy
```
Check if `vim-tmux-navigator` is installed. Press `I` to install if missing.

**Navigation not working in Tmux:**
```bash
ls ~/.config/tmux/plugins/
```
Should see `vim-tmux-navigator` folder. If not:
```
C-s I  # Install plugins
```

**Ctrl+l clears screen instead:**
The plugin handles this, but if problematic, add to shell config:
```bash
bind -r '\C-l'  # Remove Ctrl+l binding
```

---

## Tips & Tricks

### Session Persistence

Your sessions auto-save every 15 minutes (tmux-continuum).

**Manual save/restore:**
```
C-s C-s  # Save session
C-s C-r  # Restore session
```

After reboot, sessions automatically restore!

### Quick Pane Switching

```
C-s ;     # Toggle between last two panes
C-s q     # Show pane numbers, type to jump
```

### Floating Pane

```
C-s p     # Toggle floating pane (80% size)
```
Great for quick tasks without disturbing layout.

### Copy URLs Easily

```
C-s u     # Show all URLs with FZF
```
Select to open in browser.

### Thumbs for Quick Copy

```
C-s Space # Highlight copyable items
```
Type the hint letters to copy.

### Double Prefix for Literal Key

```
C-s C-s   # Sends Ctrl+s to application
```
Useful for saving in vim/nano.

### SessionX Power

```
C-s o     # Open SessionX
```
Features:
- Preview sessions
- Create new sessions
- Search custom paths
- Filter sessions

---

## Troubleshooting

### Config not loading

```bash
# Reload config
C-s R

# Or from command line
tmux source-file ~/.tmux.conf
```

### Plugins not working

```bash
# Install plugins
C-s I

# Update plugins
C-s U

# Clean unused plugins
C-s Alt-u
```

### Colors look wrong

Check terminal supports 256 colors:
```bash
echo $TERM
# Should be: screen-256color or tmux-256color
```

Set in your shell config:
```bash
export TERM=screen-256color
```

### Session persistence not working

Check if continuum is running:
```bash
tmux show-environment -g | grep continuum
```

Force save:
```
C-s C-s
```

### Mouse not working

```bash
# Check setting
tmux show-options -g | grep mouse
# Should show: mouse on

# Enable if off
tmux set -g mouse on
```

---

## Quick Reference Card

### Most Used Commands

```
Ctrl+s then:

WINDOWS:
  c     = New window
  n/p   = Next/Previous window
  0-9   = Jump to window #

PANES:
  v     = Split vertical
  s     = Split horizontal
  x     = Kill pane
  z     = Zoom/fullscreen

NAVIGATION (no prefix):
  C-h/j/k/l = Navigate panes & vim splits

RESIZE:
  , .   = Shrink/Grow width
  - =   = Shrink/Grow height

SESSIONS:
  d     = Detach
  o     = SessionX (session manager)
  C-s   = Save session
  C-r   = Restore session

PLUGINS:
  Space = Thumbs (copy hints)
  p     = Floax (floating pane)
  u     = Open URLs with FZF

CONFIG:
  R     = Reload config
```

---

## External Resources

- [Tmux Official Docs](https://github.com/tmux/tmux/wiki)
- [TPM - Plugin Manager](https://github.com/tmux-plugins/tpm)
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [Catppuccin Theme](https://github.com/catppuccin/tmux)

---

**Maintained by:** Your dotfiles
**Last Updated:** 2025-11-19
