# Markdown Shortcuts & Commands Reference

**Last Updated:** 2025-11-20

Quick reference for all markdown-related commands and shortcuts in your Neovim setup.

> **⚠️ IMPORTANT**: All editing and shortcuts work in **Neovim** (not the preview window).
> The preview window is read-only and updates live as you edit in Neovim.
> Use `<leader>mp` to open/close the preview.

---

## 🎯 Essential Workflows

### **1. Writing & Previewing**
```
1. Open markdown file:     nvim document.md
2. Open outline (left):    <leader>o
3. Open preview:           <leader>mp
4. Start writing!
```

### **2. Navigation**
```
- Outline window (left):   <leader>o (toggle)
- Preview window:          <leader>mp (toggle)
- Jump to heading:         Use outline + <Enter>
```

---

## ⌨️ Keybindings

### **Preview Controls**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>mp` | Toggle peek.nvim preview | Open/close main preview (webview) |
| `<leader>mb` | Toggle browser preview | Backup (opens in browser) |

**Note:**
- `<leader>` is usually **Space**, so `<leader>mp` = **Space + m + p**
- To close the peek preview: Press `<leader>mp` again (same command toggles)
- Preview window auto-sizes to 1600x1800px at position (600, 0)

### **Outline/TOC Controls**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>o` | Toggle outline | Show/hide outline on **left side** |
| `<leader>O` | Open outline + focus | Open outline and move cursor to it |

**Inside Outline Window:**
- `<Enter>` - Jump to heading under cursor
- `o` - Jump and stay in outline
- `q` - Close outline
- `j/k` - Navigate up/down
- `/` - Search headings

### **Markdown Editing**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>mt` | Toggle checkbox | Toggle task list item |
| `<leader>mT` | Insert TOC | Generate table of contents |
| `<leader>mc` | Insert code block | Add fenced code block |
| `<leader>mtc` | Generate GitHub TOC | Create GitHub-style TOC |
| `<leader>mtu` | Update TOC | Update existing TOC |

### **Formatting (In Visual Mode)**

| Key | Action | Description |
|-----|--------|-------------|
| `gsi` | Toggle italic | Surround with `*` |
| `gsb` | Toggle bold | Surround with `**` |
| `gss` | Toggle strikethrough | Surround with `~~` |
| `gsc` | Toggle code | Surround with `` ` `` |

### **Links**

| Key | Action | Description |
|-----|--------|-------------|
| `gl` | Add link | Create markdown link |
| `gx` | Follow link | Open link under cursor |

### **Navigation**

| Key | Action | Description |
|-----|--------|-------------|
| `]]` | Next heading | Jump to next heading |
| `[[` | Previous heading | Jump to previous heading |
| `]c` | Current heading | Go to current section heading |
| `]p` | Parent heading | Go to parent heading |

### **Images**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>pi` | Paste image | Paste from clipboard |
| `<leader>ps` | Select image | Browse and insert image |

---

## 📋 Commands

### **peek.nvim Commands**

```vim
:PeekOpen          " Open preview
:PeekClose         " Close preview
```

**In Preview Window (when focused):**
- `k/j` - Scroll up/down
- `u/d` - Half-page up/down
- `g/G` - Top/bottom of document
- Close window button (X) or click away

### **Outline Commands**

```vim
:Outline           " Toggle outline
:OutlineOpen       " Open outline
:OutlineClose      " Close outline
```

### **TOC Commands**

```vim
:GenTocGFM         " Generate GitHub-style TOC
:UpdateToc         " Update existing TOC
:RemoveToc         " Remove TOC
```

---

## 🪟 Window Management

### **Typical Setup**

```
┌─────────────────────────────────────────────────────────┐
│  Outline        │  Editor          │  Preview          │
│  (left)         │  (center)        │  (separate window)│
│                 │                  │                    │
│  # Heading 1    │  # Heading 1     │  [Peek Preview]   │
│  ## Sub 1       │                  │  Beautiful render │
│  ## Sub 2       │  Content here... │  with colors      │
│  # Heading 2    │                  │  and spacing      │
│                 │                  │                    │
└─────────────────────────────────────────────────────────┘
```

### **Opening/Closing Windows**

1. **Outline (left sidebar):**
   - Open: `<leader>o` or `:Outline`
   - Close: `<leader>o` again or `q` (when focused)
   - Width: 30 columns (fixed)

2. **Preview (separate window):**
   - Open: `<leader>mp` or `:PeekOpen`
   - Close: `<leader>mp` again or `:PeekClose`
   - Size: Controlled by macOS (resize manually)

3. **Browser Preview (backup):**
   - Open: `<leader>mb`
   - Close: `<leader>mb` or close browser tab

---

## 🎨 peek.nvim Window Size

**Issue:** Window opens small

**Solutions:**

1. **Manual Resize (macOS):**
   - Click and drag the "Peek preview" window edges
   - macOS remembers the size for next time

2. **Maximize:**
   - Double-click the title bar
   - Or use green button (top-left)

3. **Window Manager (Advanced):**
   ```bash
   # Using Rectangle/Magnet/BetterSnapTool
   # Drag window to screen position
   # Or use keyboard shortcuts
   ```

4. **Hammerspoon Script (Advanced):**
   ```lua
   -- Auto-resize "Peek preview" window
   hs.window.filter.new("Peek preview"):subscribe(
     hs.window.filter.windowCreated,
     function(window)
       window:setFrame({x=800, y=0, w=1200, h=1080})
     end
   )
   ```

---

## 💡 Tips & Tricks

### **Workflow 1: Full Writing Environment**

```
1. nvim document.md
2. <leader>o                 " Open outline (left)
3. <leader>mp                " Open preview (right/separate)
4. Write and see live updates!
```

### **Workflow 2: Quick Edit**

```
1. nvim document.md
2. Edit directly (in-buffer icons show structure)
3. <leader>mp when ready to see full preview
```

### **Workflow 3: Navigation Heavy**

```
1. nvim document.md
2. <leader>o                 " Open outline
3. Navigate with j/k in outline
4. <Enter> to jump to sections
5. Edit without preview (faster)
```

### **Creating GitHub-Style Callouts**

```markdown
> [!NOTE]
> This is a note

> [!TIP]
> This is a tip

> [!WARNING]
> This is a warning

> [!IMPORTANT]
> This is important

> [!CAUTION]
> This is dangerous
```

These render beautifully in peek.nvim with vibrant colors!

### **Task Lists**

```markdown
- [ ] Unchecked task
- [x] Completed task
- [-] In-progress task

Use <leader>mt to toggle!
```

---

## 🔧 Customization

### **Change Outline Position**

Edit `~/.config/nvim/lua/plugins/markdown.lua`:

```lua
outline_window = {
  position = "left",  -- or "right"
  width = 30,         -- adjust size
}
```

### **Disable Auto-Preview**

Already disabled! Preview opens only when you press `<leader>mp`

### **Change Preview Theme**

Edit `~/.config/nvim/lua/plugins/markdown.lua`:

```lua
theme = "dark",  -- or "light"
```

---

## 🐛 Troubleshooting

### **Preview Not Opening**

```vim
:PeekOpen                    " Try manual command
:messages                    " Check for errors
:checkhealth peek            " Verify Deno installed
```

### **Outline Not Showing Headings**

- Make sure you have headings (`#`, `##`, etc.)
- Try `:OutlineClose` then `<leader>o`
- Check `:Outline` command

### **Window Size Issues**

- peek.nvim window: Resize manually (macOS limitation)
- Outline window: Adjust `width` in config
- Editor: Use normal vim split commands (`:vertical resize`)

### **Keybindings Not Working**

```vim
:map <leader>mp              " Check if mapped
:verbose map <leader>o       " See what's mapped
```

If `<leader>` isn't Space:
```vim
:echo mapleader              " Check current leader
" Add to init.lua if needed:
vim.g.mapleader = " "
```

---

## 📚 Additional Resources

- **peek.nvim:** https://github.com/toppair/peek.nvim
- **outline.nvim:** https://github.com/hedyhli/outline.nvim
- **render-markdown.nvim:** https://github.com/MeanderingProgrammer/render-markdown.nvim

---

## 🎯 Quick Reference Card

**Most Used Commands:**

```
<leader>o        Toggle outline (left sidebar)
<leader>mp       Toggle preview (peek.nvim)
<leader>mt       Toggle checkbox
]]  [[           Next/previous heading
gx               Follow link
```

**Preview Navigation (when focused):**

```
j/k              Scroll
u/d              Half-page
g/G              Top/bottom
```

**Outline Navigation (when focused):**

```
j/k              Move up/down
<Enter>          Jump to heading
q                Close
/                Search
```

---

**Note:** Remember to restart Neovim to apply configuration changes!
