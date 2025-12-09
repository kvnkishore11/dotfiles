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
    -- 3-way merge tool for conflict resolution
    { "<leader>gM", "<cmd>DiffviewOpen --merge<cr>", desc = "3-way Merge Tool" },
    -- Compare current branch with main/master
    {
      "<leader>g=",
      function()
        -- Auto-detect main branch (main or master)
        local main_branch = vim.fn.system("git rev-parse --verify main 2>/dev/null"):gsub("\n", "")
        if main_branch == "" then
          main_branch = vim.fn.system("git rev-parse --verify master 2>/dev/null"):gsub("\n", "")
        end
        if main_branch ~= "" then
          vim.cmd("DiffviewOpen main...HEAD")
        else
          vim.notify("No main/master branch found", vim.log.levels.WARN)
        end
      end,
      desc = "Compare with main branch",
    },
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
    enhanced_diff_hl = true, -- Word-level diff highlighting
    use_icons = true,
    icons = {
      folder_closed = "",
      folder_open = "",
    },
    signs = {
      fold_closed = "",
      fold_open = "",
      done = "✓",
    },
    view = {
      default = {
        layout = "diff2_horizontal", -- side-by-side
        winbar_info = true,
        disable_diagnostics = true, -- Less noise in diff view
      },
      merge_tool = {
        layout = "diff3_horizontal",
        disable_diagnostics = true,
      },
      file_history = {
        layout = "diff2_horizontal",
        winbar_info = true,
        disable_diagnostics = true,
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
    file_history_panel = {
      log_options = {
        git = {
          single_file = {
            diff_merges = "combined",
            follow = true, -- Follow file renames
          },
          multi_file = {
            diff_merges = "first-parent",
          },
        },
      },
      win_config = {
        position = "bottom",
        height = 16,
      },
    },
    -- Show full file context, not just hunks
    hooks = {
      diff_buf_read = function(bufnr)
        -- Set large context to see full file
        vim.opt_local.foldmethod = "diff"
        vim.opt_local.foldlevel = 99 -- Keep all folds open
        -- Enable word wrap for long lines
        vim.opt_local.wrap = false
        -- Show line numbers for reference
        vim.opt_local.number = true
        vim.opt_local.relativenumber = false
      end,
      diff_buf_win_enter = function(bufnr, winid, ctx)
        -- Highlight the current line in diff views
        vim.opt_local.cursorline = true
      end,
    },
    keymaps = {
      -- Use default keymaps and only override specific ones
      disable_defaults = false,
      view = {
        { "n", "<tab>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
      },
      file_panel = {
        { "n", "<tab>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
      },
      file_history_panel = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
        { "n", "<tab>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
      },
    },
  },
}
