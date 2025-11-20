-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Folding keymaps for quick visibility control
vim.keymap.set("n", "<leader>z0", ":set foldlevel=0<CR>", { desc = "Fold Level 0 (close all)" })
vim.keymap.set("n", "<leader>z1", ":set foldlevel=1<CR>", { desc = "Fold Level 1" })
vim.keymap.set("n", "<leader>z2", ":set foldlevel=2<CR>", { desc = "Fold Level 2" })
vim.keymap.set("n", "<leader>z3", ":set foldlevel=3<CR>", { desc = "Fold Level 3" })
vim.keymap.set("n", "<leader>z9", ":set foldlevel=99<CR>", { desc = "Fold Level 99 (open all)" })

-- Toggle default fold level start (1 vs 99)
-- This controls what fold level new files open at
vim.keymap.set("n", "<leader>zt", function()
  local current = vim.opt.foldlevelstart:get()
  if current == 1 then
    vim.opt.foldlevelstart = 99
    vim.notify("Default fold level: ALL OPEN (99)", vim.log.levels.INFO)
  else
    vim.opt.foldlevelstart = 1
    vim.notify("Default fold level: LEVEL 1", vim.log.levels.INFO)
  end
end, { desc = "Toggle default fold level (1/99)" })
