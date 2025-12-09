-- Satellite.nvim - Scrollbar with git changes, diagnostics, and search marks
-- By lewis6991 (same author as gitsigns) - perfect integration!
-- Shows colored indicators on the scrollbar showing WHERE changes are in the file
return {
  "lewis6991/satellite.nvim",
  event = "VeryLazy",
  opts = {
    current_only = false, -- Show satellite in all windows
    winblend = 50, -- Transparency (0 = opaque, 100 = invisible)
    zindex = 40, -- Z-index of the satellite window
    excluded_filetypes = {
      "neo-tree",
      "NvimTree",
      "Outline",
      "TelescopePrompt",
      "lazy",
      "mason",
      "noice",
      "notify",
    },
    -- Width of the satellite bar
    width = 2,
    handlers = {
      cursor = {
        enable = true,
        -- Show cursor position in scrollbar
        symbols = { "=" },
      },
      search = {
        enable = true,
        -- Highlight search matches in scrollbar
      },
      diagnostic = {
        enable = true,
        -- Show diagnostics (errors, warnings) in scrollbar
        signs = { "-", "=", "=" },
        min_severity = vim.diagnostic.severity.HINT,
      },
      gitsigns = {
        enable = true,
        -- This is the key feature - shows git changes in scrollbar!
        -- Green = added, Red = deleted, Blue = modified
        signs = {
          add = "│",
          change = "│",
          delete = "_",
        },
      },
      marks = {
        enable = true,
        -- Show marks in scrollbar
        show_builtins = false, -- Only show custom marks
      },
      quickfix = {
        enable = true,
        -- Show quickfix items in scrollbar
      },
    },
  },
}
