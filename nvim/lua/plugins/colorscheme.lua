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

            -- Diff highlighting (Blue/Orange - colorblind-friendly)
            DiffAdd = { bg = "#1a3a4d", fg = "NONE" },      -- Blue background for added lines
            DiffDelete = { bg = "#4d2a1a", fg = "#a86840" }, -- Orange background for deleted lines
            DiffChange = { bg = "#2d3a4d", fg = "NONE" },   -- Muted blue-gray for changed lines
            DiffText = { bg = "#2a5a7a", fg = "NONE", bold = true }, -- Brighter blue for word-level changes

            -- Diffview-specific highlights
            DiffviewDiffAdd = { bg = "#1a3a4d" },           -- Blue: Added content
            DiffviewDiffDelete = { bg = "#4d2a1a" },        -- Orange: Deleted content
            DiffviewDiffAddAsDelete = { bg = "#4d3520" },   -- Darker orange: Old version of changed text
            DiffviewDiffDeleteDim = { fg = "#a86840" },     -- Dimmed orange text

            -- GitSigns (gutter signs) - Blue/Orange theme
            GitSignsAdd = { fg = "#58a6ff" },              -- Blue: Added lines indicator
            GitSignsChange = { fg = "#d29922" },           -- Amber: Changed lines indicator
            GitSignsDelete = { fg = "#f97316" },           -- Orange: Deleted lines indicator
            GitSignsAddNr = { fg = "#58a6ff" },            -- Line number for added
            GitSignsChangeNr = { fg = "#d29922" },         -- Line number for changed
            GitSignsDeleteNr = { fg = "#f97316" },         -- Line number for deleted
            GitSignsAddLn = { bg = "#1a3a4d" },            -- Line highlight for added
            GitSignsChangeLn = { bg = "#3d3d1a" },         -- Line highlight for changed
            GitSignsDeleteLn = { bg = "#4d2a1a" },         -- Line highlight for deleted
            GitSignsAddInline = { bg = "#2a5a7a" },        -- Inline added text
            GitSignsChangeInline = { bg = "#5a5a2e" },     -- Inline changed text
            GitSignsDeleteInline = { bg = "#7a4020" },     -- Inline deleted text
            GitSignsCurrentLineBlame = { fg = "#6e7681", italic = true }, -- Blame text

            -- Neogit highlights - Blue/Orange theme
            NeogitDiffAdd = { bg = "#1a3a4d", fg = "#58a6ff" },        -- Added in neogit
            NeogitDiffDelete = { bg = "#4d2a1a", fg = "#f97316" },     -- Deleted in neogit
            NeogitDiffAddHighlight = { bg = "#2a5a7a", fg = "#79c0ff" }, -- Highlighted added
            NeogitDiffDeleteHighlight = { bg = "#7a4020", fg = "#ffa657" }, -- Highlighted deleted
            NeogitDiffContext = { bg = "#1e1e2e" },                    -- Context (unchanged)
            NeogitDiffContextHighlight = { bg = "#252535" },          -- Highlighted context
            NeogitHunkHeader = { bg = "#2d3a4d", fg = "#8b949e" },     -- Hunk header
            NeogitHunkHeaderHighlight = { bg = "#3d4a5d", fg = "#c9d1d9", bold = true },
            NeogitBranch = { fg = "#58a6ff", bold = true },           -- Branch names
            NeogitRemote = { fg = "#d29922", bold = true },           -- Remote names
            NeogitStagedchanges = { fg = "#58a6ff", bold = true },    -- Staged section
            NeogitUnstagedchanges = { fg = "#f97316", bold = true },  -- Unstaged section
            NeogitUntrackedfiles = { fg = "#8b949e" },                -- Untracked section

            -- Git commit message highlights
            gitcommitSummary = { fg = "#c9d1d9", bold = true },
            gitcommitOverflow = { fg = "#f97316" },                   -- Over 50 chars warning
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
