return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  opts = {
    -- Add a space between comment and line
    padding = true,
    -- Keep cursor position after commenting
    sticky = true,
    -- Ignore empty lines when commenting
    ignore = "^$",
    -- LHS of toggle mappings in NORMAL mode
    toggler = {
      line = "gcc", -- Line-comment toggle
      block = "gbc", -- Block-comment toggle
    },
    -- LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
      line = "gc", -- Line-comment operator
      block = "gb", -- Block-comment operator
    },
    -- Extra mappings
    extra = {
      above = "gcO", -- Add comment on line above
      below = "gco", -- Add comment on line below
      eol = "gcA", -- Add comment at end of line
    },
  },
}
