-- Octo.nvim - GitHub integration for PRs, Issues, and Reviews
-- Requires: GitHub CLI (gh) to be installed and authenticated
-- Run `gh auth status` to verify authentication
return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    enable_builtin = true,
    default_merge_method = "squash", -- or "merge", "rebase"
    picker = "telescope",
    -- Suppress projects v2 warning if you don't use GitHub Projects
    suppress_missing_scope = {
      projects_v2 = true,
    },
    -- Use delta for PR diffs if available
    use_local_fs = false,
    -- Show PR changed files in a tree
    file_panel = {
      size = 10,
      use_icons = true,
    },
  },
  keys = {
    -- Pull Request operations (most common for heavy GitHub users)
    { "<leader>Gp", "<cmd>Octo pr list<cr>", desc = "List Pull Requests" },
    { "<leader>Gc", "<cmd>Octo pr create<cr>", desc = "Create Pull Request" },
    { "<leader>Gm", "<cmd>Octo pr merge<cr>", desc = "Merge Pull Request" },
    { "<leader>Gx", "<cmd>Octo pr close<cr>", desc = "Close Pull Request" },
    { "<leader>Go", "<cmd>Octo pr checkout<cr>", desc = "Checkout PR" },

    -- Review operations
    { "<leader>Gr", "<cmd>Octo review start<cr>", desc = "Start PR Review" },
    { "<leader>GR", "<cmd>Octo review resume<cr>", desc = "Resume PR Review" },
    { "<leader>Gs", "<cmd>Octo review submit<cr>", desc = "Submit PR Review" },
    { "<leader>Gd", "<cmd>Octo review discard<cr>", desc = "Discard PR Review" },

    -- Comments
    { "<leader>GC", "<cmd>Octo comment add<cr>", desc = "Add Comment" },
    { "<leader>GD", "<cmd>Octo comment delete<cr>", desc = "Delete Comment" },

    -- Issue operations
    { "<leader>Gi", "<cmd>Octo issue list<cr>", desc = "List Issues" },
    { "<leader>GI", "<cmd>Octo issue create<cr>", desc = "Create Issue" },

    -- Search/browse
    { "<leader>Ga", "<cmd>Octo actions<cr>", desc = "All Octo Actions (Telescope)" },
    { "<leader>Gf", "<cmd>Octo search<cr>", desc = "Search GitHub" },

    -- Reactions
    { "<leader>G+", "<cmd>Octo reaction thumbs_up<cr>", desc = "Thumbs Up" },
    { "<leader>G-", "<cmd>Octo reaction thumbs_down<cr>", desc = "Thumbs Down" },
  },
}
