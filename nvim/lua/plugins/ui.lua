-- UI configuration to match VS Code
return {
  -- Better UI with noice.nvim (modern VS Code-like notifications and cmdline)
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

  -- Configure lualine (status line) to match VS Code
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "vscode",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true, -- Single statusline for all windows (like VS Code)
      },
    },
  },

  -- Neo-tree (file explorer) configuration to match VS Code
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

  -- Bufferline (tabs) to match VS Code
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

  -- Dashboard (start screen) similar to VS Code welcome
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
          "           [ VS Code Theme - Powered by LazyVim ]",
          "",
        },
      },
    },
  },

  -- Indent guides (like VS Code)
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
