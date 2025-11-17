return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    integrations = {
      diffview = true,
      telescope = true,
    },
    -- Automatically refresh after switching to neogit
    auto_refresh = true,
    -- Show diffs inline
    disable_context_highlighting = false,
    -- Signs for the status buffer
    signs = {
      hunk = { "", "" },
      item = { ">", "v" },
      section = { ">", "v" },
    },
  },
  keys = {
    { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit (full interface)" },
    { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Commit" },
    { "<leader>gC", "<cmd>Neogit commit --amend<cr>", desc = "Commit (amend)" },
    { "<leader>gp", "<cmd>Neogit pull<cr>", desc = "Pull" },
    { "<leader>gP", "<cmd>Neogit push<cr>", desc = "Push" },
    { "<leader>gf", "<cmd>Neogit fetch<cr>", desc = "Fetch" },
    { "<leader>gl", "<cmd>Neogit log<cr>", desc = "Log (branch)" },
    { "<leader>gL", "<cmd>Neogit log --all<cr>", desc = "Log (all branches)" },
    { "<leader>gz", "<cmd>Neogit stash<cr>", desc = "Stash" },
    { "<leader>gZ", "<cmd>Neogit stash pop<cr>", desc = "Stash pop" },
    { "<leader>go", "<cmd>Neogit branch<cr>", desc = "Branch operations" },
    { "<leader>gw", "<cmd>Neogit worktree<cr>", desc = "Worktree" },
    { "<leader>gi", "<cmd>Neogit rebase<cr>", desc = "Rebase (interactive)" },
    { "<leader>gx", "<cmd>Neogit reset<cr>", desc = "Reset" },
    { "<leader>gX", "<cmd>Neogit revert<cr>", desc = "Revert" },
    { "<leader>gk", "<cmd>Neogit cherry_pick<cr>", desc = "Cherry pick" },
    { "<leader>gm", "<cmd>Neogit merge<cr>", desc = "Merge" },
  },
}
