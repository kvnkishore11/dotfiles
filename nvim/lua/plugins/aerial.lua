return {
  {
    "stevearc/aerial.nvim",
    event = "LazyFile",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- Position and layout
      layout = {
        default_direction = "right", -- Open on the right side
        placement = "edge",          -- Place at the edge of the window
        width = 30,                  -- Width of outline window
        min_width = 20,
      },

      -- Attach to LSP and Treesitter
      attach_mode = "global",

      -- Show outline automatically for certain filetypes (optional)
      open_automatic = false,

      -- Close aerial when jumping to a symbol
      close_on_select = false,

      -- Highlight the symbol under cursor
      highlight_on_hover = true,

      -- Show line numbers in aerial window
      show_guides = true,

      -- Filter symbols
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
        "Type",
        "Field",
        "Property",
      },

      -- Treesitter settings for better symbol detection
      treesitter = {
        update_delay = 300,
      },

      -- LSP settings
      lsp = {
        diagnostics_trigger_update = true,
        update_when_errors = true,
        update_delay = 300,
      },

      -- Keymaps inside aerial window
      keymaps = {
        ["<CR>"] = "actions.jump",
        ["<C-v>"] = "actions.jump_vsplit",
        ["<C-s>"] = "actions.jump_split",
        ["p"] = "actions.scroll",
        ["<C-j>"] = "actions.down_and_scroll",
        ["<C-k>"] = "actions.up_and_scroll",
        ["{"] = "actions.prev",
        ["}"] = "actions.next",
        ["q"] = "actions.close",
      },

      -- Icons (uses nvim-web-devicons)
      icons = {},

      -- Fold settings
      fold = {
        enable = true,
        autofold = false,
      },
    },

    keys = {
      { "<leader>o", "<cmd>AerialToggle<CR>", desc = "Toggle Outline (Aerial)" },
      { "<leader>O", "<cmd>AerialNavToggle<CR>", desc = "Toggle Outline Nav" },
      { "{", "<cmd>AerialPrev<CR>", desc = "Previous Symbol" },
      { "}", "<cmd>AerialNext<CR>", desc = "Next Symbol" },
    },

    config = function(_, opts)
      require("aerial").setup(opts)

      -- Optional: Auto-open aerial for certain filetypes
      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = { "python", "go", "rust", "javascript", "typescript", "lua" },
      --   callback = function()
      --     vim.cmd("AerialOpen")
      --   end,
      -- })
    end,
  },
}
