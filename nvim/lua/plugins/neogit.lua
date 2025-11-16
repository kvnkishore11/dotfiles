return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = true,
  keys = {
    { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
    { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Neogit Commit" },
    { "<leader>gp", "<cmd>Neogit pull<cr>", desc = "Neogit Pull" },
    { "<leader>gP", "<cmd>Neogit push<cr>", desc = "Neogit Push" },
  },
}
