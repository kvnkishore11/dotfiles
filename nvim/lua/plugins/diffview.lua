return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
    { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    { "<leader>ge", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle file panel" },
    { "<leader>gE", "<cmd>DiffviewFocusFiles<cr>", desc = "Focus file panel" },
    {
      "<leader>g+",
      function()
        -- Increase context lines (show more surrounding code)
        vim.g.diffview_context_lines = (vim.g.diffview_context_lines or 3) + 3
        vim.cmd("DiffviewRefresh")
        vim.notify("Context: " .. vim.g.diffview_context_lines .. " lines", vim.log.levels.INFO)
      end,
      desc = "Increase context lines",
    },
    {
      "<leader>g-",
      function()
        -- Decrease context lines (show less surrounding code)
        vim.g.diffview_context_lines = math.max(0, (vim.g.diffview_context_lines or 3) - 3)
        vim.cmd("DiffviewRefresh")
        vim.notify("Context: " .. vim.g.diffview_context_lines .. " lines", vim.log.levels.INFO)
      end,
      desc = "Decrease context lines",
    },
    {
      "<leader>g0",
      function()
        -- Toggle between minimal and full context
        if vim.g.diffview_full_context then
          vim.g.diffview_context_lines = 3
          vim.g.diffview_full_context = false
          vim.notify("Minimal context (3 lines)", vim.log.levels.INFO)
        else
          vim.g.diffview_context_lines = 9999
          vim.g.diffview_full_context = true
          vim.notify("Full file context", vim.log.levels.INFO)
        end
        vim.cmd("DiffviewRefresh")
      end,
      desc = "Toggle full/minimal context",
    },
  },
  opts = {
    diff_binaries = false,
    enhanced_diff_hl = true,
    use_icons = true,
    view = {
      default = {
        layout = "diff2_horizontal", -- side-by-side
        winbar_info = true,
      },
      merge_tool = {
        layout = "diff3_horizontal",
      },
      file_history = {
        layout = "diff2_horizontal",
        winbar_info = true,
      },
    },
    file_panel = {
      listing_style = "tree",
      tree_options = {
        flatten_dirs = true,
        folder_statuses = "only_folded",
      },
      win_config = {
        position = "left",
        width = 35,
      },
    },
    -- Show full file context, not just hunks
    hooks = {
      diff_buf_read = function(bufnr)
        -- Set large context to see full file
        vim.opt_local.foldmethod = "diff"
        vim.opt_local.foldlevel = 99 -- Keep all folds open
      end,
    },
    keymaps = {
      view = {
        -- Inside diff view
        { "n", "<tab>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
        { "n", "<leader>co", "<cmd>DiffviewFocusFiles<cr>", { desc = "Focus file panel" } },
      },
      file_panel = {
        -- Inside file panel
        { "n", "j", "j", { desc = "Down" } },
        { "n", "k", "k", { desc = "Up" } },
        { "n", "<cr>", "select_entry", { desc = "Open diff for selected file" } },
        { "n", "o", "select_entry", { desc = "Open diff for selected file" } },
        { "n", "s", "toggle_stage_entry", { desc = "Stage / unstage file" } },
        { "n", "S", "stage_all", { desc = "Stage all files" } },
        { "n", "U", "unstage_all", { desc = "Unstage all files" } },
        { "n", "X", "restore_entry", { desc = "Restore file (discard changes)" } },
        { "n", "R", "refresh_files", { desc = "Refresh" } },
        { "n", "<tab>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
      },
      file_history_panel = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
        { "n", "y", "copy_hash", { desc = "Copy commit hash" } },
        { "n", "zo", "open_fold", { desc = "Open fold" } },
        { "n", "zc", "close_fold", { desc = "Close fold" } },
        { "n", "za", "toggle_fold", { desc = "Toggle fold" } },
        { "n", "zR", "open_all_folds", { desc = "Open all folds" } },
        { "n", "zM", "close_all_folds", { desc = "Close all folds" } },
      },
    },
  },
}
