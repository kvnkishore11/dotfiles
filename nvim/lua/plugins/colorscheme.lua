-- GitHub Dark theme for Neovim (matching WezTerm)
return {
  -- Install official GitHub theme for Neovim
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        options = {
          -- Matching WezTerm GitHub Dark settings
          transparent = false,
          terminal_colors = true,
          dim_inactive = false,
          module_default = true,

          -- Style settings
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },

          -- Inverse settings
          inverse = {
            match_paren = false,
            visual = false,
            search = false,
          },

          darken = {
            floats = true,
            sidebars = {
              enable = true,
              list = { "qf", "help", "neo-tree", "terminal" },
            },
          },
        },

        -- Customize specific palette colors to match WezTerm
        palettes = {
          github_dark_default = {
            -- Match WezTerm background (Catppuccin Mocha base for tmux blending)
            canvas = {
              default = "#1e1e2e", -- Same as WezTerm background
              overlay = "#313244", -- Catppuccin surface0
              inset = "#181825",   -- Catppuccin mantle
              subtle = "#313244",  -- Catppuccin surface0
            },
            fg = {
              default = "#E6EDF3",
              muted = "#8D96A0",
              subtle = "#6E7681",
              on_emphasis = "#FFFFFF",
            },
            border = {
              default = "#30363D",
              muted = "#21262D",
              subtle = "#484F58",
            },
          },
        },

        -- Override specific highlight groups
        groups = {
          github_dark_default = {
            -- Cursor line to match WezTerm selection
            CursorLine = { bg = "#161B22" },
            -- Visual selection matching WezTerm
            Visual = { bg = "#305B74" },
            -- Search highlighting
            Search = { bg = "#C99C3E", fg = "#010408" },
            IncSearch = { bg = "#DDB577", fg = "#010408" },
          },
        },
      })

      -- Set the colorscheme to GitHub Dark Default
      vim.cmd.colorscheme("github_dark_default")
    end,
  },

  -- Configure LazyVim to use GitHub Dark theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_default",
    },
  },
}
