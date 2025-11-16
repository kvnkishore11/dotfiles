-- UI configuration to match GitHub Dark (WezTerm theme)
return {
  -- Fix trouble.nvim icons configuration (prevents lualine error)
  {
    "folke/trouble.nvim",
    opts = {
      icons = {
        indent = {
          middle = " ",
          last = " ",
          top = " ",
          ws = "│  ",
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
  },

  -- Better UI with noice.nvim (modern notifications and cmdline)
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },

  -- Configure lualine (status line) to match GitHub Dark
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto", -- Will automatically use github_dark_default colors
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true, -- Single statusline for all windows
      },
    },
  },

  -- Neo-tree (file explorer) configuration
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      window = {
        position = "left",
        width = 35,
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
        },
      },
    },
  },

  -- Bufferline (tabs) matching GitHub Dark aesthetic
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        separator_style = "thin",
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
      },
      highlights = {
        buffer_selected = {
          italic = false,
          bold = false,
        },
      },
    },
  },

  -- Dashboard (start screen) with GitHub Dark branding
  {
    "nvimdev/dashboard-nvim",
    opts = {
      theme = "doom",
      config = {
        header = {
          "",
          "",
          " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
          " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
          " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
          " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
          " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
          " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
          "",
          "         [ GitHub Dark Theme - Powered by LazyVim ]",
          "",
        },
      },
    },
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
      },
      indent = {
        char = "│",
      },
    },
  },
}
