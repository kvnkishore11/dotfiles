# peek.nvim Custom Features Guide

**Last Updated:** 2025-11-20

Advanced features added to your peek.nvim markdown preview!

---

## 🎯 What's New

### **1. Automatic Window Sizing** ✅
- Preview window auto-resizes to 1600x1800px
- Position: (x: 600, y: 0)
- No manual resizing needed!
- **To close**: Press `<leader>mp` again (toggles preview on/off)

### **2. TOC Sidebar (In Preview)** ✅
- Table of Contents on the **left side** of preview
- Auto-generated from all headings (H1-H6)
- **Collapsible sections:** Click ▼ to collapse H1 sections
- Click headings to jump to sections (smooth scroll)
- Active heading highlighted as you scroll
- Beautiful, readable system font

### **3. Foldable Sections** ✅
- Click any H1, H2, or H3 heading to fold/unfold
- Fold indicator: ▼ (expanded) / ▶ (collapsed)
- **Auto-centers when expanding** for better focus
- Keyboard shortcut: `Alt+F` to fold/unfold all

---

## 📐 Preview Layout

```
┌────────────────────────────────────────────────────────┐
│  TOC SIDEBAR     │  MARKDOWN CONTENT                   │
│  (280px fixed)   │  (scrollable)                       │
├──────────────────┼─────────────────────────────────────┤
│  CONTENTS        │                                     │
│                  │  ▼ # Main Heading                   │
│  • Main Heading  │  ═══════════════════════════        │
│    ◦ Sub 1       │                                     │
│    ◦ Sub 2       │  Content for main section...        │
│  • Section 2     │                                     │
│                  │  ▼ ## Sub 1                         │
│                  │  ─────────────────                  │
│                  │                                     │
│                  │  Content for sub 1...               │
│                  │                                     │
│  [Auto-         │  ▶ ## Sub 2 (collapsed)             │
│   highlights     │                                     │
│   current]       │  ▼ # Section 2                      │
│                  │  ═══════════════════════════        │
└──────────────────┴─────────────────────────────────────┘
```

---

## ⌨️ Keyboard Shortcuts

### **In Preview Window:**

| Shortcut | Action |
|----------|--------|
| `Alt+F` | Fold/unfold all sections |
| `Ctrl+T` | Toggle TOC sidebar visibility |
| `j/k` | Scroll up/down |
| `u/d` | Half-page up/down |
| `g/G` | Top/bottom of document |

### **Mouse Actions:**

| Action | Result |
|--------|--------|
| Click heading (H1/H2/H3) | Fold/unfold section |
| Click TOC link | Jump to that heading (smooth scroll) |
| Hover TOC item | Highlight |

---

## 🎨 Visual Features

### **TOC Sidebar Styling:**
- **Width:** 280px (fixed, left side)
- **Background:** Dark (#0d1117)
- **Scrollable:** Independent scroll
- **Indentation:** Nested headings indented
  - H1: 8px
  - H2: 20px
  - H3: 32px
  - H4: 44px
  - H5: 56px
  - H6: 68px

### **Active Heading:**
- **Blue highlight** (#58a6ff)
- **Background tint** (rgba)
- **Left border** indicator
- Updates as you scroll

### **Fold Indicators:**
- **▼** = Expanded (content visible)
- **▶** = Collapsed (content hidden)
- Smooth animations
- Heading dims when folded (opacity: 0.7)

---

## 🔧 How It Works

### **TOC Generation:**
1. JavaScript scans all H1-H6 headings
2. Creates hierarchical list
3. Adds smooth-scroll links
4. Updates active state on scroll

### **Folding System:**
1. Headings H1-H3 are foldable
2. Click heading to toggle
3. Content wrapped in `.fold-content` div
4. CSS hides folded content
5. Animation on fold/unfold

### **Auto-Sizing:**
1. Neovim autocmd detects `PeekOpen` event
2. Waits 500ms for window to appear
3. AppleScript resizes window via macOS System Events
4. Position: `{600, 0}`, Size: `{1600, 1800}`

---

## 🎯 Usage Examples

### **Example 1: Navigate Long Document**

```
1. Open preview: <leader>mp
2. Window auto-sizes and shows TOC
3. Scroll through TOC on left
4. Click heading to jump
5. Fold sections you're not working on
```

### **Example 2: Focus on One Section**

```
1. Open preview
2. Click all H1 headings to fold them
3. Unfold only the section you're editing
4. Less visual clutter!
```

### **Example 3: Quick Overview**

```
1. Open preview
2. Look at TOC sidebar (left)
3. See entire document structure at a glance
4. Current section highlighted in blue
```

---

## 💡 Tips & Tricks

### **Tip 1: Hide TOC Temporarily**
```
Press Ctrl+T to hide TOC
(Gives more space for content)
Press Ctrl+T again to show
```

### **Tip 2: Collapse All for Overview**
```
Press Alt+F to collapse all sections
Now you see just the headings
Press Alt+F again to expand all
```

### **Tip 3: Jump Around Quickly**
```
Use TOC to jump between sections
Much faster than scrolling!
Active heading always highlighted
```

### **Tip 4: Resize Window Once**
```
Auto-resize sets initial size
You can adjust manually if needed
macOS remembers your adjustment
```

---

## 🐛 Troubleshooting

### **TOC Not Appearing**

**Check:**
```
1. Open preview: <leader>mp
2. Wait 1-2 seconds for JS to load
3. Refresh if needed (close and reopen preview)
```

**If still missing:**
```
1. Check browser console (if using browser mode)
2. Verify custom-features.js is loaded
3. Check for JavaScript errors
```

### **Folding Not Working**

**Check:**
```
1. Only H1, H2, H3 are foldable
2. Click the heading text (not TOC)
3. Look for ▼/▶ indicator
```

### **Auto-Resize Not Working**

**Check:**
```
1. macOS Accessibility permissions for Neovim
2. System Events allowed to control windows
3. Check :messages for errors
```

**Grant permissions:**
```
System Settings → Privacy & Security → Accessibility
Add: Neovim or your terminal app
```

### **Window Too Small/Large**

**Adjust:**
```lua
-- Edit ~/.config/nvim/lua/plugins/markdown.lua
-- Find this line:
set size of peekWindow to {1600, 1800}
-- Change to your preferred size: {width, height}
```

---

## 🎨 Customization

### **Change TOC Width**

Edit `~/.local/share/nvim/lazy/peek.nvim/public/style.css`:

```css
#toc-sidebar {
  width: 280px;  /* Change this value */
}

.markdown-body {
  margin-left: 280px !important;  /* Match TOC width */
}
```

### **Change TOC Position (Right Side)**

```css
#toc-sidebar {
  left: auto;   /* Remove left positioning */
  right: 0;     /* Position on right */
}

.markdown-body {
  margin-left: 60px !important;   /* Normal left margin */
  margin-right: 280px !important; /* Make room on right */
}
```

### **Disable Folding**

Edit `~/.local/share/nvim/lazy/peek.nvim/public/style.css`:

```css
/* Comment out or remove these lines: */
.markdown-body h1::before,
.markdown-body h2::before,
.markdown-body h3::before {
  content: none !important; /* Hide fold indicators */
}
```

### **Change Fold Indicator**

```css
.markdown-body h1::before {
  content: "[ - ] ";  /* Change to your liking */
}

.markdown-body h1.folded::before {
  content: "[ + ] ";  /* Collapsed indicator */
}
```

---

## 📊 Technical Details

### **Files Modified:**

1. **`lua/plugins/markdown.lua`**
   - Added autocmd for auto-resizing
   - AppleScript integration

2. **`public/style.css`**
   - TOC sidebar styles
   - Fold indicator styles
   - Layout adjustments

3. **`public/custom-features.js`**
   - TOC generation logic
   - Fold functionality
   - Active heading tracking
   - Keyboard shortcuts

4. **`public/index.html`**
   - Script tag for custom-features.js

### **Browser Compatibility:**

- ✅ WebView (Deno) - Primary target
- ✅ Chrome/Chromium
- ✅ Safari
- ✅ Edge
- ⚠️ Firefox (may need tweaks)

---

## 🔄 Updating

After modifying CSS/JS files:

```vim
:PeekClose
:PeekOpen
" Or just reload Neovim
```

If using browser mode:
```
Hard refresh: Cmd+Shift+R
```

---

## 📚 Related Documentation

- **Main shortcuts:** `~/.config/nvim/MARKDOWN_SHORTCUTS.md`
- **peek.nvim repo:** https://github.com/toppair/peek.nvim
- **Custom CSS file:** `~/.local/share/nvim/lazy/peek.nvim/public/style.css`
- **Custom JS file:** `~/.local/share/nvim/lazy/peek.nvim/public/custom-features.js`

---

## 🎯 Quick Reference

**Essential:**
```
<leader>mp       Open preview (auto-sized, with TOC)
Alt+F            Fold/unfold all sections
Ctrl+T           Toggle TOC visibility
Click heading    Fold/unfold that section
Click TOC link   Jump to section
```

**Preview opens with:**
- ✅ Auto-sized to 1600x1800px
- ✅ TOC on left (280px)
- ✅ All sections expanded
- ✅ First heading active
- ✅ Close with `<leader>mp` (toggle)

---

**Enjoy your enhanced markdown preview! 🚀**
