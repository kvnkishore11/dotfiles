-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.wrap = true

-- Folding settings for better code overview
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99       -- Start with all folds open
vim.opt.foldlevelstart = 99  -- Open all folds when opening a file
vim.opt.foldenable = true
vim.opt.foldnestmax = 10     -- Limit nested folds

-- ============================================================
-- VS Code-like appearance settings
-- ============================================================

-- Font configuration (works with GUI Neovim like Neovide)
vim.opt.guifont = "FiraCode Nerd Font:h14"

-- Line numbers (VS Code style)
vim.opt.number = true
vim.opt.relativenumber = true

-- Visual settings to match VS Code
vim.opt.cursorline = true           -- Highlight current line
vim.opt.signcolumn = "yes"          -- Always show sign column
vim.opt.termguicolors = true        -- True color support
vim.opt.showmode = false            -- Don't show mode (shown in statusline)

-- Indentation (VS Code defaults)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Smooth scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Better completion
vim.opt.completeopt = "menu,menuone,noselect"

-- Split behavior (VS Code style)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- File handling
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- UI performance
vim.opt.updatetime = 200
vim.opt.timeoutlen = 300
