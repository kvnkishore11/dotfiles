-- GitGraph - Visual branch graph like JetBrains Git Log
-- Shows commit history with visual branch lanes, merges, and tags
return {
  "isakbm/gitgraph.nvim",
  dependencies = { "sindrets/diffview.nvim" },
  opts = {
    symbols = {
      merge_commit = "M",
      commit = "*",
      merge_commit_end = "M",
      commit_end = "*",
    },
    format = {
      timestamp = "%Y-%m-%d %H:%M",
      fields = { "hash", "timestamp", "author", "branch_name", "tag" },
    },
    hooks = {
      -- Open Diffview when pressing Enter on a commit
      on_select_commit = function(commit)
        vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
      end,
      -- Open Diffview for commit range when selecting in visual mode
      on_select_range_commit = function(from, to)
        vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
      end,
    },
  },
  keys = {
    {
      "<leader>gG",
      function()
        require("gitgraph").draw({}, { all = true, max_count = 5000 })
      end,
      desc = "Git Graph (visual branches)",
    },
  },
}
