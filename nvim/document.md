# Neovim (LazyVim) Configuration Documentation

**Last Updated:** 2025-11-19
**Config Location:** `~/.config/nvim/`
**Framework:** LazyVim

---

## Table of Contents

- [Overview](#overview)
- [File Structure](#file-structure)
- [Plugins](#plugins)
- [Keybindings](#keybindings)
- [Vim-Tmux Navigator](#vim-tmux-navigator)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)

---

## Overview

This Neovim configuration uses LazyVim as a base and is customized to match VS Code's look and feel while maintaining Vim's powerful editing capabilities.

### Key Features

- **VS Code Dark+ Theme:** Authentic colors from VS Code
- **Seamless Tmux Integration:** Navigate between vim splits and tmux panes with `Ctrl+h/j/k/l`
- **Modern UI:** Statusline, bufferline, file explorer, dashboard
- **LSP Intelligence:** Code completion, diagnostics, hover docs
- **Git Integration:** Visual git status and diff in gutter
- **Advanced Features:** Minimap, smooth scrolling, color preview

---

## File Structure

```
~/.config/nvim/
├── init.lua                      # Main entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua              # LazyVim bootstrap
│   │   ├── options.lua           # Editor settings
│   │   ├── keymaps.lua           # Custom keybindings
│   │   └── autocmds.lua          # Auto commands
│   └── plugins/
│       ├── colorscheme.lua       # VS Code Dark+ theme
│       ├── ui.lua                # UI components
│       ├── vscode-features.lua   # Advanced features
│       ├── navigation.lua        # Vim-Tmux Navigator
│       ├── aerial.lua            # Code outline
│       ├── codesnap.lua          # Code screenshots
│       ├── comment.lua           # Better commenting
│       ├── conform.lua           # Code formatting
│       ├── diffview.lua          # Git diff viewer
│       ├── go.lua                # Go language support
│       ├── lint.lua              # Linting
│       ├── markdown.lua          # Markdown support
│       ├── neogit.lua            # Git UI
│       └── surround.lua          # Surround operations
├── changelog.md                  # Configuration changes log
└── document.md                   # This file
```

---

## Plugins

### Core Framework

#### **LazyVim**
Modern Neovim configuration framework.
- Plugin management with lazy.nvim
- Sensible defaults
- Easy customization

**Bootstrap:** `lua/config/lazy.lua`

### Theme & UI

#### **vscode.nvim**
Authentic VS Code Dark+ color scheme.

**Config:** `lua/plugins/colorscheme.lua`
```lua
return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("vscode").setup({
      transparent = false,
      italic_comments = true,
    })
    vim.cmd.colorscheme("vscode")
  end,
}
```

#### **lualine.nvim**
Statusline (bottom bar).

**Features:**
- File info
- Git branch
- LSP status
- Cursor position

#### **bufferline.nvim**
Tab/buffer line (top bar).

**Features:**
- Visual buffer tabs
- Close buttons
- Modified indicators

#### **neo-tree.nvim**
File explorer sidebar.

**Keybinding:** `<leader>e` - Toggle file tree

**Features:**
- File browser
- Git status
- File operations (create, delete, rename)

#### **dashboard-nvim**
Welcome screen on startup.

**Features:**
- Recent files
- Quick actions
- Custom header

#### **indent-blankline.nvim**
Visual indentation guides.

### LSP & Code Intelligence

#### **lspsaga.nvim**
Enhanced LSP UI.

**Features:**
- Better hover docs
- Code actions
- Rename UI
- Diagnostics

**Keybindings:**
- `K` - Hover documentation
- `gd` - Go to definition
- `gr` - Go to references
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

#### **trouble.nvim**
Problems panel (like VS Code).

**Keybindings:**
- `<leader>xx` - Toggle trouble
- `<leader>xw` - Workspace diagnostics
- `<leader>xd` - Document diagnostics

#### **nvim-navic**
Breadcrumbs navigation.

Shows current code context in statusline.

### Git Integration

#### **gitsigns.nvim**
Git changes in gutter.

**Features:**
- Added/modified/deleted line indicators
- Inline blame
- Stage/unstage hunks

**Keybindings:**
- `]c` - Next change
- `[c` - Previous change
- `<leader>hs` - Stage hunk
- `<leader>hu` - Undo stage hunk
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line

#### **neogit.nvim**
Magit-like git UI.

**Keybinding:** `<leader>gg` - Open neogit

#### **diffview.nvim**
Git diff viewer.

**Keybindings:**
- `<leader>gd` - Open diff view
- `<leader>gh` - File history

### Advanced Features

#### **mini.map**
Code minimap (like VS Code).

**Keybinding:** `<leader>um` - Toggle minimap

#### **neoscroll.nvim**
Smooth scrolling animation.

Makes scrolling feel natural.

#### **nvim-colorizer.lua**
Highlight color codes.

**Features:**
- Preview #hex colors
- Preview rgb() colors
- Preview color names

### Navigation

#### **vim-tmux-navigator**
Seamless navigation between vim splits and tmux panes.

**See [Vim-Tmux Navigator](#vim-tmux-navigator) section below.**

### Language Support

#### **conform.nvim**
Code formatting.

**Keybinding:** `<leader>cf` - Format code

#### **nvim-lint**
Linting integration.

#### **Go Support**
Go language tooling via `go.lua`

### Utilities

#### **nvim-surround**
Surround operations (quotes, brackets, tags).

**Examples:**
- `ysiw"` - Surround word with quotes
- `cs"'` - Change double quotes to single
- `ds"` - Delete surrounding quotes

#### **Comment.nvim**
Better commenting.

**Keybindings:**
- `gcc` - Toggle line comment
- `gbc` - Toggle block comment
- `gc` (visual) - Comment selection

#### **aerial.nvim**
Code outline/symbols sidebar.

**Keybinding:** `<leader>cs` - Toggle symbols outline

#### **codesnap.nvim**
Beautiful code screenshots.

**Keybindings:**
- `<leader>cc` (visual) - Code screenshot
- `<leader>cC` (visual) - Save to clipboard

---

## Keybindings

### General Leader Key

`<leader>` = `Space`

### File Operations

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file tree |
| `<leader>ff` | Find files |
| `<leader>fg` | Grep search |
| `<leader>fb` | Browse buffers |
| `<leader>fr` | Recent files |

### Window/Split Navigation

#### Without Prefix (vim-tmux-navigator)
| Key | Action |
|-----|--------|
| `Ctrl+h` | Move left (works with tmux) |
| `Ctrl+j` | Move down (works with tmux) |
| `Ctrl+k` | Move up (works with tmux) |
| `Ctrl+l` | Move right (works with tmux) |
| `Ctrl+\` | Previous split/pane (works with tmux) |

#### Standard Vim
| Key | Action |
|-----|--------|
| `<leader>\|` | Split vertical |
| `<leader>-` | Split horizontal |
| `<leader>wd` | Close window |

### Code Actions

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>cf` | Format code |

### Diagnostics

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle trouble |
| `<leader>xw` | Workspace diagnostics |
| `<leader>xd` | Document diagnostics |
| `]d` | Next diagnostic |
| `[d` | Previous diagnostic |

### Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Open neogit |
| `<leader>gd` | Diff view |
| `<leader>gh` | File history |
| `]c` | Next git change |
| `[c` | Previous git change |
| `<leader>hs` | Stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |

### Folding

| Key | Action |
|-----|--------|
| `<leader>z0` | Fold level 0 (close all) |
| `<leader>z1` | Fold level 1 |
| `<leader>z2` | Fold level 2 |
| `<leader>z3` | Fold level 3 |
| `<leader>z9` | Fold level 99 (open all) |

### Utilities

| Key | Action |
|-----|--------|
| `<leader>cs` | Toggle symbols outline |
| `<leader>um` | Toggle minimap |
| `gcc` | Toggle line comment |
| `<leader>cc` | Code screenshot (visual) |

---

## Vim-Tmux Navigator

### Overview

Navigate seamlessly between Neovim splits and tmux panes using `Ctrl+h/j/k/l` without any prefix.

### Configuration

**File:** `lua/plugins/navigation.lua`

```lua
return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right" },
    { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate Previous" },
  },
}
```

### Keybindings

| Key | Action | Context |
|-----|--------|---------|
| `Ctrl+h` | Navigate left | Vim & Tmux |
| `Ctrl+j` | Navigate down | Vim & Tmux |
| `Ctrl+k` | Navigate up | Vim & Tmux |
| `Ctrl+l` | Navigate right | Vim & Tmux |
| `Ctrl+\` | Previous split/pane | Vim & Tmux |

### How It Works

**In Neovim (standalone):**
- `Ctrl+h/j/k/l` navigates between vim splits normally

**In Neovim (within tmux):**
- `Ctrl+h/j/k/l` navigates between vim splits
- When at edge of vim, automatically switches to adjacent tmux pane
- Seamless boundary crossing!

**Example:**
```
Tmux Pane 1: Neovim with 2 splits
┌──────────┬──────────┐
│  Split1  │  Split2  │
└──────────┴──────────┘

Tmux Pane 2: Terminal
┌─────────────────────┐
│  Terminal           │
└─────────────────────┘

Navigation:
1. In Split1, press Ctrl+l → goes to Split2
2. In Split2, press Ctrl+j → goes to Terminal (Tmux Pane 2)
3. In Terminal, press Ctrl+k → goes back to Neovim
```

### Troubleshooting

**Check plugin installation:**
```vim
:Lazy
```
Look for `vim-tmux-navigator`. Press `I` to install if missing.

**Check keybindings:**
```vim
:map <C-h>
```
Should show TmuxNavigateLeft mapping.

---

## Customization

### Changing Theme

Edit `lua/plugins/colorscheme.lua`:
```lua
vim.cmd.colorscheme("vscode")  -- Change to your theme
```

### Adding Plugins

Create new file in `lua/plugins/`:
```lua
-- lua/plugins/myplugin.lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin setup here
  end,
}
```

LazyVim will auto-load it!

### Modifying Options

Edit `lua/config/options.lua`:
```lua
vim.opt.number = true           -- Line numbers
vim.opt.relativenumber = true   -- Relative numbers
vim.opt.tabstop = 4             -- Tab width
vim.opt.shiftwidth = 4          -- Indent width
```

### Custom Keybindings

Edit `lua/config/keymaps.lua`:
```lua
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
```

---

## Troubleshooting

### Plugins not loading

```vim
:Lazy
```
- Press `I` to install
- Press `U` to update
- Press `X` to clean

### LSP not working

```vim
:Mason
```
Install language servers for your languages.

**Example for Python:**
```vim
:MasonInstall pyright
```

### Theme not applying

```vim
:colorscheme vscode
```

Check if plugin is installed:
```vim
:Lazy
```

### Keybindings not working

Check for conflicts:
```vim
:map <leader>e
```

View all mappings:
```vim
:map
```

### Slow startup

Check startup time:
```bash
nvim --startuptime startup.log
```

Disable plugins in `lua/plugins/` by adding:
```lua
enabled = false,
```

---

## Quick Reference

### Essential Keybindings

```
LEADER KEY: Space

FILES:
  <leader>e    = Toggle file tree
  <leader>ff   = Find files
  <leader>fg   = Grep search

NAVIGATION (no prefix):
  Ctrl+h/j/k/l = Navigate splits & tmux panes

CODE:
  K            = Hover docs
  gd           = Go to definition
  <leader>ca   = Code actions
  <leader>cf   = Format

GIT:
  <leader>gg   = Neogit
  <leader>gd   = Diff view
  ]c / [c      = Next/prev change

DIAGNOSTICS:
  <leader>xx   = Toggle trouble
  ]d / [d      = Next/prev diagnostic

UTILITIES:
  gcc          = Comment line
  <leader>cs   = Symbols outline
  <leader>um   = Toggle minimap
```

---

## External Resources

- [LazyVim Documentation](https://lazyvim.org)
- [Neovim Documentation](https://neovim.io/doc)
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [vscode.nvim Theme](https://github.com/Mofiqul/vscode.nvim)

---

**Maintained by:** Your dotfiles
**Last Updated:** 2025-11-19
