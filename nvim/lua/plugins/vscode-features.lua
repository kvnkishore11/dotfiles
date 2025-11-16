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
      -- Trouble v3 configuration
      auto_close = false, -- Auto close when no items
      auto_open = false, -- Auto open when items
      auto_preview = true, -- Automatically open preview
      auto_refresh = true, -- Automatically refresh
      auto_jump = false, -- Auto jump to first item
      focus = false, -- Focus trouble window when opened
      restore = true, -- Restore last location
      follow = true, -- Follow current item
      indent_guides = true, -- Show indent guides
      max_items = 200, -- Max items to show
      multiline = true, -- Render multi-line messages
      pinned = false, -- Keep window pinned
      warn_no_results = true, -- Show warning when no results
      open_no_results = false, -- Open even if no results
      -- Window configuration
      win = {
        type = "split",
        relative = "win",
        position = "bottom",
        size = 10,
      },
      -- Preview configuration
      preview = {
        type = "main",
        scratch = true,
      },
      -- Throttle refresh
      throttle = {
        refresh = 20,
        update = 10,
        render = 10,
        follow = 100,
        preview = { ms = 100, debounce = true },
      },
      -- Key mappings (v3 format)
      keys = {
        ["?"] = "help",
        r = "refresh",
        R = "toggle_refresh",
        q = "close",
        o = "jump_close",
        ["<esc>"] = "cancel",
        ["<cr>"] = "jump",
        ["<2-leftmouse>"] = "jump",
        ["<c-s>"] = "jump_split",
        ["<c-v>"] = "jump_vsplit",
        ["}"] = "next",
        ["]]"] = "next",
        ["{"] = "prev",
        ["[["] = "prev",
        dd = "delete",
        d = { action = "delete", mode = "v" },
        i = "inspect",
        p = "preview",
        P = "toggle_preview",
        zo = "fold_open",
        zO = "fold_open_recursive",
        zc = "fold_close",
        zC = "fold_close_recursive",
        za = "fold_toggle",
        zA = "fold_toggle_recursive",
        zm = "fold_more",
        zM = "fold_close_all",
        zr = "fold_reduce",
        zR = "fold_open_all",
        zx = "fold_update",
        zX = "fold_update_all",
        zn = "fold_disable",
        zN = "fold_enable",
        zi = "fold_toggle_enable",
        gb = { -- Toggle current folder
          action = function(view)
            local f = view:get_fold(vim.api.nvim_win_get_cursor(view.win)[1])
            if f then
              if f.folded then
                view:fold_open(f.pos[1], f.pos[2], true)
              else
                view:fold_close(f.pos[1], f.pos[2], true)
              end
            end
          end,
          desc = "Toggle fold for current group",
        },
      },
      -- Modes (v3 uses different mode system)
      modes = {
        diagnostics = {
          mode = "diagnostics",
          preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.3,
          },
        },
      },
      -- Icons (v3 format - object, not boolean)
      icons = {
        indent = {
          top = "│ ",
          middle = "├╴",
          last = "└╴",
          fold_open = " ",
          fold_closed = " ",
          ws = "  ",
        },
        folder_closed = " ",
        folder_open = " ",
        kinds = {
          Array = " ",
          Boolean = "󰨙 ",
          Class = " ",
          Constant = "󰏿 ",
          Constructor = " ",
          Enum = " ",
          EnumMember = " ",
          Event = " ",
          Field = " ",
          File = " ",
          Function = "󰊕 ",
          Interface = " ",
          Key = " ",
          Method = "󰊕 ",
          Module = " ",
          Namespace = "󰦮 ",
          Null = " ",
          Number = "󰎠 ",
          Object = " ",
          Operator = " ",
          Package = " ",
          Property = " ",
          String = " ",
          Struct = "󰆼 ",
          TypeParameter = " ",
          Variable = "󰀫 ",
        },
      },
    },
    cmd = { "Trouble" },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / References (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
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
    "nvim-mini/mini.map",
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

  -- Sticky context (shows parent function/class/heading at top of screen)
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    opts = {
      enable = true,
      max_lines = 3, -- Max number of context lines
      min_window_height = 0, -- Minimum editor height
      line_numbers = true,
      multiline_threshold = 20, -- Max lines a single context line can span
      trim_scope = "outer", -- Which context lines to discard
      mode = "cursor", -- Update based on cursor position
      separator = nil, -- Separator between context and content
      zindex = 20, -- Z-index of the context window
      on_attach = nil, -- Callback for enabling/disabling
    },
    keys = {
      {
        "[c",
        function()
          require("treesitter-context").go_to_context()
        end,
        desc = "Jump to context (parent heading/function)",
      },
    },
  },
}
