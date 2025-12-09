# Neovim Keyboard Shortcuts Quick Reference

**Leader Key:** `Space`

---

## 🗂️ File Operations

| Shortcut | Action |
|----------|--------|
| `<leader>e` | Toggle file explorer (Neo-tree) |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Grep/search in files |
| `<leader>fb` | Browse open buffers |
| `<leader>fr` | Recent files |
| `<leader>fn` | New file |
| `:w` | Save file |
| `:q` | Quit |
| `:wq` | Save and quit |

---

## 🧭 Navigation

### Window/Split Navigation (Tmux-aware)
| Shortcut | Action |
|----------|--------|
| `Ctrl+h` | Move left (works with tmux) |
| `Ctrl+j` | Move down (works with tmux) |
| `Ctrl+k` | Move up (works with tmux) |
| `Ctrl+l` | Move right (works with tmux) |
| `Ctrl+\` | Previous split/pane |

### Window Management
| Shortcut | Action |
|----------|--------|
| `<leader>\|` | Split vertical |
| `<leader>-` | Split horizontal |
| `<leader>wd` | Close window |
| `<leader>wm` | Maximize/restore window |

### Buffer Navigation
| Shortcut | Action |
|----------|--------|
| `]b` | Next buffer |
| `[b` | Previous buffer |
| `<leader>bd` | Delete buffer |
| `<leader>bo` | Close other buffers |

---

## 📁 Folding

### Set Fold Levels
| Shortcut | Action |
|----------|--------|
| `<leader>zt` | **Toggle default fold level (1 ↔ 99)** |
| `<leader>z0` | Fold level 0 (close all) |
| `<leader>z1` | Fold level 1 (top-level only) |
| `<leader>z2` | Fold level 2 |
| `<leader>z3` | Fold level 3 |
| `<leader>z9` | Fold level 99 (open all) |

### Navigate Folds
| Shortcut | Action |
|----------|--------|
| `zj` | **Jump to next fold** |
| `zk` | **Jump to previous fold** |

### Manipulate Folds
| Shortcut | Action |
|----------|--------|
| `za` | **Toggle fold** (open ↔ close) |
| `zo` | Open fold under cursor |
| `zc` | Close fold under cursor |
| `zO` | Open fold recursively (all nested) |
| `zC` | Close fold recursively |
| `zA` | Toggle fold recursively |
| `zR` | Open **all** folds in file |
| `zM` | Close **all** folds in file |

**Common Workflow:**
```
zj → za    # Jump to next fold and toggle it
zk → zo    # Jump to previous fold and open it
```

---

## 💻 Code Editing

### LSP Actions
| Shortcut | Action |
|----------|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>cf` | Format code |
| `<leader>cd` | Line diagnostics |

### Diagnostics
| Shortcut | Action |
|----------|--------|
| `<leader>xx` | Toggle trouble (problems panel) |
| `<leader>xw` | Workspace diagnostics |
| `<leader>xd` | Document diagnostics |
| `]d` | Next diagnostic |
| `[d` | Previous diagnostic |

### Commenting
| Shortcut | Action |
|----------|--------|
| `gcc` | Toggle line comment |
| `gbc` | Toggle block comment |
| `gc` (visual) | Comment selection |
| `gcap` | Comment paragraph |

### Surround Operations
| Shortcut | Action | Example |
|----------|--------|---------|
| `ysiw"` | Surround word with quotes | `word` → `"word"` |
| `cs"'` | Change double to single quotes | `"word"` → `'word'` |
| `ds"` | Delete surrounding quotes | `"word"` → `word` |
| `yss)` | Surround line with parentheses | `text` → `(text)` |

---

## 🔍 Search & Replace

| Shortcut | Action |
|----------|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next search result |
| `N` | Previous search result |
| `*` | Search word under cursor (forward) |
| `#` | Search word under cursor (backward) |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all (with confirmation) |
| `<leader>sh` | Search help |
| `<leader>sk` | Search keymaps |

---

## 🎨 Git Integration

### Quick Access (Most Used)
| Shortcut | Action |
|----------|--------|
| `<leader>gg` | **LazyGit** (full TUI - like JetBrains Git) |
| `<leader>gn` | Neogit (Magit-style interface) |
| `<leader>gG` | **Git Graph** (visual branch tree) |

### Side-by-Side Diff (JetBrains-style)
| Shortcut | Action |
|----------|--------|
| `<leader>gd` | Open Diffview (see all changes) |
| `<leader>g0` | **Toggle FULL FILE context** (key feature!) |
| `<leader>gh` | File history (current file) |
| `<leader>gH` | Branch history (all files) |
| `<leader>g=` | Compare with main branch |
| `<leader>gM` | 3-way merge tool |
| `<leader>gq` | Close Diffview |

### Navigate Changes (Satellite shows WHERE they are!)
| Shortcut | Action |
|----------|--------|
| `]g` | Jump to NEXT change |
| `[g` | Jump to PREVIOUS change |
| `]G` | Jump to LAST change in file |
| `[G` | Jump to FIRST change in file |

### Stage/Unstage
| Shortcut | Action |
|----------|--------|
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gS` | Stage entire buffer |
| `<leader>gu` | Undo stage hunk |
| `<leader>gR` | Reset entire buffer |

### View Changes
| Shortcut | Action |
|----------|--------|
| `<leader>gv` | Preview hunk (popup) |
| `<leader>gV` | Preview hunk inline |
| `<leader>gt` | Toggle deleted lines |
| `<leader>gb` | Blame line (full details) |
| `<leader>gB` | Toggle line blame |

### Git Operations (Neogit)
| Shortcut | Action |
|----------|--------|
| `<leader>gc` | Commit |
| `<leader>gC` | Commit --amend |
| `<leader>gp` | Pull |
| `<leader>gP` | Push |
| `<leader>gf` | Fetch |
| `<leader>go` | Branch operations |
| `<leader>gz` | Stash |
| `<leader>gZ` | Stash pop |
| `<leader>gi` | Rebase |
| `<leader>gm` | Merge |

### GitHub (Octo.nvim) - Capital G
| Shortcut | Action |
|----------|--------|
| `<leader>Gp` | List Pull Requests |
| `<leader>Gc` | Create Pull Request |
| `<leader>Gr` | Start PR Review |
| `<leader>Gs` | Submit PR Review |
| `<leader>Gi` | List Issues |
| `<leader>Ga` | All GitHub Actions |

**JetBrains Workflow in Neovim:**
```
1. See changes in scrollbar (satellite.nvim - automatic)
2. Jump between changes: ]g / [g
3. Full file diff: <leader>gd then <leader>g0
4. Visual branch graph: <leader>gG
5. Quick operations: <leader>gg (LazyGit)
```

---

## 🛠️ Utilities

| Shortcut | Action |
|----------|--------|
| `<leader>cs` | Toggle symbols outline (Aerial) |
| `<leader>um` | Toggle minimap |
| `<leader>cc` (visual) | Code screenshot |
| `<leader>cC` (visual) | Screenshot to clipboard |
| `<leader>?` | Show keymaps |
| `<leader>l` | Lazy plugin manager |
| `<leader>m` | Mason (LSP installer) |

---

## 📝 Markdown (when in .md files)

| Shortcut | Action |
|----------|--------|
| `<leader>mp` | Toggle markdown preview |
| `<leader>mt` | Toggle checkbox |
| `<leader>mT` | Insert table of contents |
| `<leader>mc` | Insert code block |
| `<leader>mtc` | Generate TOC (GitHub style) |
| `<leader>mtu` | Update existing TOC |
| `<leader>pi` | Paste image from clipboard |
| `gl` | Add link |
| `gx` | Follow link |
| `]]` | Next heading |
| `[[` | Previous heading |

---

## ⌨️ Vim Basics (Essential)

### Modes
| Key | Mode |
|-----|------|
| `Esc` or `Ctrl+[` | Normal mode |
| `i` | Insert mode (before cursor) |
| `a` | Insert mode (after cursor) |
| `I` | Insert at line start |
| `A` | Insert at line end |
| `o` | New line below |
| `O` | New line above |
| `v` | Visual mode (character) |
| `V` | Visual mode (line) |
| `Ctrl+v` | Visual block mode |

### Motion
| Key | Action |
|-----|--------|
| `h/j/k/l` | Left/Down/Up/Right |
| `w` | Next word start |
| `b` | Previous word start |
| `e` | Next word end |
| `0` | Line start |
| `^` | First non-blank character |
| `$` | Line end |
| `gg` | File start |
| `G` | File end |
| `{` | Previous paragraph |
| `}` | Next paragraph |
| `Ctrl+u` | Scroll up half page |
| `Ctrl+d` | Scroll down half page |

### Editing
| Key | Action |
|-----|--------|
| `x` | Delete character |
| `dd` | Delete line |
| `yy` | Copy line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `.` | Repeat last change |
| `~` | Toggle case |
| `ciw` | Change inner word |
| `diw` | Delete inner word |
| `caw` | Change around word |

---

## 🎯 Tips & Tricks

### Quick Fold Workflow
```vim
<leader>z1     " Start with level 1 (overview)
zj             " Jump to next fold
za             " Toggle it open
zj             " Next fold
zo             " Open it
<leader>z9     " Open all when needed
```

### Search & Navigate
```vim
/pattern       " Search
n              " Next match
cgn            " Change next match
.              " Repeat change on next match
```

### Multi-cursor Simulation
```vim
:%s/old/new/gc " Global replace with confirmation
" Or use visual block mode:
Ctrl+v         " Visual block
jjj            " Select lines
I              " Insert at start
Esc            " Apply to all lines
```

### Quick File Navigation
```vim
<leader>ff     " Find files
<leader>fg     " Grep content
<leader>fr     " Recent files
gd             " Go to definition
Ctrl+o         " Jump back
Ctrl+i         " Jump forward
```

---

## 📚 Resources

- **Full Documentation:** `~/.config/nvim/document.md`
- **Changelog:** `~/.config/nvim/changelog.md`
- **LazyVim Docs:** https://lazyvim.org
- **Vim Cheatsheet:** https://vim.rtorr.com/

---

**Last Updated:** 2025-11-19
**Config Location:** `~/.config/nvim/`
