# Neovim Configuration Changelog

All notable changes to the Neovim/LazyVim configuration will be documented in this file.

---

## [2025-12-03] - Enhanced Git Integration (JetBrains-like Experience)

### Added
- **satellite.nvim** - Scrollbar with git change indicators
  - Shows colored marks on scrollbar where changes are (green=add, red=delete, blue=change)
  - Also shows diagnostics and search matches
  - By lewis6991 (same author as gitsigns)

- **lazygit.nvim** - Quick access to LazyGit TUI
  - `<leader>gg` opens LazyGit in floating window
  - `<leader>gF` opens LazyGit for current file history

- **gitgraph.nvim** - Visual branch graph (like JetBrains Git Log)
  - `<leader>gG` shows commit history with visual branch lanes
  - Press Enter on any commit to open its diff in Diffview

- **octo.nvim** - Full GitHub integration
  - `<leader>Gp` list PRs, `<leader>Gc` create PR
  - `<leader>Gr` start PR review, `<leader>Gs` submit review
  - `<leader>Gi` list issues, `<leader>Ga` all GitHub actions

### Changed
- **diffview.lua** - Added new keybindings:
  - `<leader>gM` - 3-way merge tool for conflict resolution
  - `<leader>g=` - Compare current branch with main/master

### Reminder
- `<leader>g0` toggles between minimal (3 lines) and full file context in Diffview
- `]g` / `[g` navigates between git changes (hunks)
- Satellite.nvim shows WHERE changes are, then use `]g`/`[g` to jump to them

**Files Added:**
- `lua/plugins/satellite.lua`
- `lua/plugins/lazygit.lua`
- `lua/plugins/gitgraph.lua`
- `lua/plugins/octo.lua`

**Files Modified:**
- `lua/plugins/diffview.lua`

---

## [2025-11-27] - Python Fold Level 0 by Default

### Changed
- Python files now open with fold level 0 (all folds closed) instead of level 1
- Other filetypes (markdown, JS, etc.) remain at fold level 1

### Added
- FileType autocmd for Python in `lua/config/autocmds.lua`

---

## [2025-11-21] - Clean Monochromatic Theme & Auto-Bold Labels

### Added
- **Auto-Bold Labels (Mini-Headers)**
  - Text at the beginning of lines before colons is automatically bolded
  - Creates visual hierarchy for labels like "issue_number:", "IMPORTANT:", "adw_id:", etc.
  - JavaScript function processes text nodes in paragraphs, lists, tables, and blockquotes
  - Works with live preview updates via mutation observer
  - Skips already bolded text and code blocks
  - Labels displayed in bright white (#e6edf3) with font-weight 700
- **Keyboard Shortcuts to Close Preview Window**
  - `Escape` - Quick close (easiest)
  - `Cmd+W` - macOS standard close window
  - `Cmd+Q` - macOS quit application
  - `Ctrl+Q` - Cross-platform close
  - Works when focused on preview window (no need to switch back to Neovim)
  - Perfect for full-screen preview mode
- **Auto Full Screen on Open**
  - Preview window automatically enters native macOS full screen when opened
  - Creates a dedicated space/desktop for the preview
  - AppleScript sets AXFullScreen attribute on window
  - No manual resizing needed - instant full screen experience

### Changed
- **Clean Monochromatic Dark Theme**
  - Changed from colorful blue gradient headings to clean white (#e6edf3)
  - Changed heading borders from thick colored lines to subtle 1px gray lines (#30363d)
  - Changed inline code from orange to clean light gray (#c9d1d9)
  - Overall theme now monochromatic and professional (matching VS Code style)
  - Headings maintain size hierarchy but use consistent white color
  - Strong/bold text now uses bright white (#e6edf3) for emphasis
  - Subtle blue (#79c0ff) retained only for italic emphasis
- **Responsive Centered Layout**
  - Changed from fixed 450px padding to responsive 20% padding
  - Prevents text from wrapping vertically on smaller windows
  - Content stays centered with balanced margins on all window sizes
  - Full window width utilized (max-width: 100%)

### Technical Details
- Modified files:
  - `~/.local/share/nvim/lazy/peek.nvim/public/style.css` (monochromatic theme)
  - `~/.local/share/nvim/lazy/peek.nvim/public/custom-features.js` (auto-bold labels function)
- All changes made to plugin installation directory (not tracked in git)

---

## [2025-11-20] - peek.nvim Styling Improvements & Text Rendering Fixes

### Changed
- **Improved Typography**
  - Line height reduced from 1.8 to 1.5 (more compact, easier to read)
  - Paragraph spacing reduced from 20px to 12px (tighter layout)
  - List item spacing reduced from 8px to 4px (more compact lists)
  - Font stack: GitHub's default system fonts (-apple-system, BlinkMacSystemFont, Segoe UI)
- **Layout & Spacing**
  - Changed max-width to 100% to utilize full window width
  - Increased horizontal padding to 450px on each side for centered content
  - Content now perfectly centered with equal margins on both sides
  - Full window utilized with balanced, uncluttered layout
- **Enhanced List Rendering**
  - Fixed nested list display issues (sub-items under numbered lists)
  - Proper indentation for nested bullets
  - List markers properly displayed (numbers, bullets, circles for nested)
  - Added explicit `display: list-item` and `display: block` rules
- **Text Wrapping (Enhanced)**
  - Added aggressive `word-wrap: break-word !important` to prevent horizontal overflow
  - Added `overflow-wrap: anywhere !important` for maximum wrapping
  - Added `word-break: break-word !important` to handle extremely long words
  - Added `white-space: normal !important` to ensure text wraps
  - Added `max-width: 100% !important` to prevent element overflow
  - Applied wrapping rules to all child elements with universal selector
  - **Fixed code block wrapping:** Added `white-space: pre-wrap !important` to `<pre>` and `<code>` elements
  - Code blocks now wrap text instead of creating horizontal scroll
  - Absolutely no horizontal overflow - all text wraps within content area

### Removed
- Reverted vim-style fold shortcuts experiment (za, zo, zc, Space+z commands)
  - Removed complex keyboard sequence state machine
  - Removed fold level indicator
  - Removed active heading indicator
  - Kept basic fold functionality (Alt+F to toggle all)
  - Kept TOC sidebar with Ctrl+T toggle

### Technical Details
- Modified files: `~/.local/share/nvim/lazy/peek.nvim/public/style.css`
- Modified files: `~/.local/share/nvim/lazy/peek.nvim/public/custom-features.js`
- All changes made to plugin installation directory (not tracked in git)

---

## [2025-11-20] - Advanced peek.nvim Features + Font & UX Improvements

### Added
- **Automatic Window Sizing** via AppleScript
  - Preview window automatically resizes on open
  - Size: 1600x1800px (increased from 1200x1400px)
  - Position: (600, 0)
  - No manual resizing needed
  - Requires macOS Accessibility permissions
- **Beautiful Typography**
  - System font stack for readability: -apple-system, Segoe UI, etc.
  - Font smoothing enabled (antialiased)
  - Base font size: 16px with 1.8 line height
- **TOC Sidebar in Preview** (Enhanced)
  - Table of Contents on left side (280px fixed width)
  - Auto-generated from all headings (H1-H6)
  - **Hierarchical & collapsible:** H1 sections can be collapsed
  - Click ▼ next to H1 to show/hide child headings
  - Click headings to jump with smooth scroll (centers in viewport)
  - Active heading highlighted as you scroll
  - Toggle entire TOC with Ctrl+T
- **Foldable Sections in Preview** (Enhanced)
  - Click any H1, H2, or H3 heading to fold/unfold
  - Fold indicators: ▼ (expanded) / ▶ (collapsed)
  - **Auto-centers when expanding** for better focus
  - Keyboard shortcut: Alt+F to fold/unfold all
  - Content wrapped in collapsible divs
  - Smooth animations
- **Custom JavaScript** (~350 lines)
  - `custom-features.js` implements TOC and folding
  - MutationObserver for live updates
  - Extensive error handling and logging
  - Works with peek.nvim's live preview

### Changed
- **Window Dimensions:** Updated from 1200x1400px to 1600x1800px
- **Window Position:** Adjusted from (800, 0) to (600, 0) for better centering
- **CSS Enhancements:**
  - TOC sidebar styles (fixed left position, 280px width)
  - Fold indicator styles (::before pseudo-elements)
  - Layout adjustments (body margin-left for TOC space)
  - Active heading highlighting

### Fixed
- **JavaScript Loading Error**
  - Rewrote custom-features.js with extensive error handling
  - Added try-catch blocks around all functions
  - Added 1-second delay for DOM readiness
  - Fixed content wrapping logic that caused stuck loading spinner
  - Added console.log debugging statements

### Usage
```bash
# Open markdown preview
<leader>mp    # Opens preview (auto-sizes to 1600x1800px)

# Close preview
<leader>mp    # Same command toggles close

# In Preview Window (read-only):
Ctrl+T        # Toggle TOC sidebar visibility
Alt+F         # Fold/unfold all sections
Click heading # Fold/unfold that section
Click TOC     # Jump to heading
```

### Important Notes
- **All editing happens in Neovim** (not the preview window)
- Preview is read-only and updates live as you edit
- Use `<leader>mp` to open/close the preview
- All markdown shortcuts work in Neovim only

**Files Modified:**
- `lua/plugins/markdown.lua`
  - Added AppleScript autocmd for auto-resizing
  - Updated window dimensions
- `~/.local/share/nvim/lazy/peek.nvim/public/style.css`
  - Added TOC sidebar CSS (~50 lines)
  - Added fold indicator CSS
  - Added active heading highlighting
- `~/.local/share/nvim/lazy/peek.nvim/public/custom-features.js`
  - **NEW FILE** (~350 lines)
  - TOC generation logic
  - Fold functionality
  - Scroll tracking
  - Keyboard shortcuts
  - Error handling
- `~/.local/share/nvim/lazy/peek.nvim/public/index.html`
  - Added script tag for custom-features.js
- `PEEK_FEATURES.md`
  - Updated window dimensions throughout
  - Added close instructions
- `MARKDOWN_SHORTCUTS.md`
  - Added important note about editing in Neovim
  - Updated preview toggle instructions
  - Added window dimensions

**Troubleshooting:**
- If auto-resize doesn't work:
  - Check macOS Accessibility permissions for your terminal app
  - System Settings → Privacy & Security → Accessibility
  - Add Neovim or your terminal (e.g., WezTerm, iTerm2)
- If TOC/fold features don't work:
  - Check browser console for JavaScript errors
  - Wait 1-2 seconds for features to initialize
  - Try closing and reopening preview

**Commit:** (pending)

---

## [2025-11-20] - peek.nvim + Simplified Markdown Rendering

### Added
- **peek.nvim** - Modern webview-based markdown preview (requires Deno)
  - GitHub-style rendering in separate window
  - Live updates as you type
  - Dark theme support
  - Auto-load when entering markdown buffers
  - Keybinding: `<leader>mp` to toggle preview
  - Beautiful typography with proper heading sizes
  - Clean layout with good spacing and margins

### Changed
- **Enhanced render-markdown.nvim configuration** (rich in-buffer rendering)
  - Beautiful heading icons (󰲡, 󰲣, 󰲥, etc.)
  - Full-style code blocks with language labels
  - GitHub-style callouts restored (NOTE, TIP, WARNING, etc.)
  - Interactive checkboxes with custom icons
  - Link icons (web, email, image, hyperlink)
  - Full-width headings and tables
  - **Philosophy:** Use peek.nvim for final preview, render-markdown for rich editing experience

- **markdown-preview.nvim keybinding**
  - Changed from `<leader>mp` to `<leader>mb` (browser preview as backup)
  - peek.nvim now uses `<leader>mp` (primary preview)

### Installed
- **Deno runtime** (v2.5.6) via Homebrew
  - Required dependency for peek.nvim
  - Installed with: `brew install deno`

### Reason
- **User feedback:** Previous render-markdown config was overwhelming, needed true webview experience
- **Terminal limitation:** Can't change actual font sizes in terminal Neovim
- **Solution:** Use peek.nvim for proper preview with real heading sizes, spacing, and web-like layout
- **Result:** Best of both worlds
  - peek.nvim for final preview (web-quality rendering)
  - render-markdown for quick in-buffer feedback while editing

### Visual Improvements
- ✅ **Colorful & vibrant webview design:**
  - H1: Bright blue (#58a6ff), 2.5em, thick underline
  - H2: Lighter blue (#79c0ff), 2em, medium underline
  - H3: Even lighter blue (#a5d6ff), 1.6em
  - H4-H6: Progressive gray scale
- ✅ **Spacious layout:**
  - Wider content (1200px max-width vs 980px)
  - More padding (60px vertical, 80px horizontal)
  - Line height: 1.8 (vs 1.5)
  - Larger margins between elements
- ✅ **Enhanced elements:**
  - Colorful code blocks with shadows
  - Orange inline code (#f0883e)
  - Blue blockquotes with background tint
  - Blue table headers (#1f6feb)
  - Gradient horizontal rules
  - Vibrant GitHub alert callouts
- ✅ Live synchronization with editor
- ✅ Rich in-buffer rendering with icons

### Usage
```bash
# Open markdown file in Neovim
nvim document.md

# Preview opens automatically (auto_load: true)
# Or manually toggle with: <leader>mp

# Alternative browser preview: <leader>mb
```

**Files Modified:**
- `lua/plugins/markdown.lua`
  - Added peek.nvim configuration
  - Restored full-featured render-markdown.nvim setup
  - Updated keybindings
- `~/.local/share/nvim/lazy/peek.nvim/public/style.css`
  - **Custom CSS enhancements** for colorful & spacious design
  - Vibrant heading colors (blue gradient)
  - Larger font sizes (H1: 2.5em, H2: 2em, H3: 1.6em)
  - Wider max-width (1200px) and more padding
  - Enhanced code blocks, tables, blockquotes
  - Colorful GitHub alerts/callouts

**Dependencies:**
- Installed Deno v2.5.6 (Homebrew)
- peek.nvim built successfully

**Commit:** (pending)

---

## [2025-11-19] - Default Fold Level 1 on File Open

### Changed
- Files now open at fold level 1 by default (showing only top-level folds)
- Changed `foldlevelstart` from 99 to 1 in `options.lua`

### Added
- Toggle keybinding `<leader>zt` to switch default fold level between 1 and 99
- Visual notification when toggling fold level setting

### Reason
- Better overview when opening large files (markdown, code)
- Start collapsed, expand as needed (progressive disclosure)
- Can still manually expand with `<leader>z9` or toggle default with `<leader>zt`

### Keybindings
- `<leader>zt` - Toggle default fold level (1 ↔ 99)
- `<leader>z0` - Fold level 0 (close all)
- `<leader>z1` - Fold level 1
- `<leader>z2` - Fold level 2
- `<leader>z3` - Fold level 3
- `<leader>z9` - Fold level 99 (open all)

**Files Modified:**
- `lua/config/options.lua` - Changed foldlevelstart
- `lua/config/keymaps.lua` - Added toggle function

**Commit:** `7802d90`

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
