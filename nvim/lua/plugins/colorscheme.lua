-- VS Code Dark+ theme for Neovim
return {
  -- Install vscode.nvim theme (exact VS Code colors)
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        -- Transparent background (set to false if you want solid background)
        transparent = false,

        -- Enable italic comments (matches VS Code)
        italic_comments = true,

        -- Disable nvim-tree background color
        disable_nvimtree_bg = false,

        -- Override colors to match VS Code exactly
        color_overrides = {
          -- You can override specific colors here if needed
        },

        -- Override highlight groups
        group_overrides = {
          -- Customize specific highlight groups if needed
        },
      })

      -- Set the colorscheme
      vim.cmd.colorscheme("vscode")
    end,
  },

  -- Configure LazyVim to use vscode theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
