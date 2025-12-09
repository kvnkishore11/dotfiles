-- LazyGit integration for Neovim
-- Provides quick access to the LazyGit TUI from within Neovim
return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit (full TUI)" },
    -- Note: <leader>gf is used by Neogit for fetch, so we use <leader>gF for file history
    { "<leader>gF", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit file history" },
  },
  config = function()
    -- Ensure LazyGit opens in a floating window
    vim.g.lazygit_floating_window_winblend = 0 -- Transparency
    vim.g.lazygit_floating_window_scaling_factor = 0.9 -- Size (90% of screen)
    vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
    vim.g.lazygit_use_neovim_remote = 1 -- Enable neovim-remote for commit editing
  end,
}
