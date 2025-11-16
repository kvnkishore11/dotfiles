-- Additional VS Code-like features
return {
  -- Better autocomplete UI (like VS Code IntelliSense)
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        },
        documentation = {
          border = "rounded",
        },
      },
    },
  },

  -- Icons (VS Code uses codicons)
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        default_icon = {
          icon = "",
          name = "Default",
        },
      },
    },
  },

  -- Git signs in gutter (like VS Code)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      current_line_blame = false, -- Toggle with :Gitsigns toggle_current_line_blame
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 300,
      },
    },
  },

  -- Better LSP UI (hover, signature help, etc.)
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      ui = {
        border = "rounded",
        colors = {
          normal_bg = "NONE",
        },
      },
      lightbulb = {
        enable = true,
        sign = true,
        virtual_text = false,
      },
      symbol_in_winbar = {
        enable = true,
      },
    },
  },

  -- Smooth scrolling (VS Code has smooth scroll)
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
    },
  },

  -- Highlight color codes (like VS Code)
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "background",
      },
    },
  },

  -- Better quickfix/loclist (like VS Code problems panel)
  {
    "folke/trouble.nvim",
    opts = {
      position = "bottom",
      height = 10,
      icons = true,
      mode = "workspace_diagnostics",
      fold_open = "",
      fold_closed = "",
      group = true,
      padding = true,
      action_keys = {
        close = "q",
        cancel = "<esc>",
        refresh = "r",
        jump = { "<cr>", "<tab>" },
        open_split = { "<c-x>" },
        open_vsplit = { "<c-v>" },
        open_tab = { "<c-t>" },
        jump_close = { "o" },
        toggle_mode = "m",
        toggle_preview = "P",
        hover = "K",
        preview = "p",
        close_folds = { "zM", "zm" },
        open_folds = { "zR", "zr" },
        toggle_fold = { "zA", "za" },
        previous = "k",
        next = "j",
      },
    },
  },

  -- Breadcrumbs (like VS Code)
  {
    "SmiteshP/nvim-navic",
    opts = {
      separator = " › ",
      highlight = true,
      depth_limit = 5,
      icons = {
        File = " ",
        Module = " ",
        Namespace = " ",
        Package = " ",
        Class = " ",
        Method = " ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = " ",
        Interface = " ",
        Function = " ",
        Variable = " ",
        Constant = " ",
        String = " ",
        Number = " ",
        Boolean = " ",
        Array = " ",
        Object = " ",
        Key = " ",
        Null = " ",
        EnumMember = " ",
        Struct = " ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
      },
    },
  },

  -- Minimap (like VS Code minimap)
  {
    "echasnovski/mini.map",
    version = false,
    config = function()
      local map = require("mini.map")
      map.setup({
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.diagnostic(),
          map.gen_integration.gitsigns(),
        },
        symbols = {
          encode = map.gen_encode_symbols.dot("4x2"),
        },
        window = {
          width = 15,
          winblend = 25,
        },
      })
    end,
  },
}
