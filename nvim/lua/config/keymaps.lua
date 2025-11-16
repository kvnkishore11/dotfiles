-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Folding keymaps for quick visibility control
vim.keymap.set("n", "<leader>z0", ":set foldlevel=0<CR>", { desc = "Fold Level 0 (close all)" })
vim.keymap.set("n", "<leader>z1", ":set foldlevel=1<CR>", { desc = "Fold Level 1" })
vim.keymap.set("n", "<leader>z2", ":set foldlevel=2<CR>", { desc = "Fold Level 2" })
vim.keymap.set("n", "<leader>z3", ":set foldlevel=3<CR>", { desc = "Fold Level 3" })
vim.keymap.set("n", "<leader>z9", ":set foldlevel=99<CR>", { desc = "Fold Level 99 (open all)" })
