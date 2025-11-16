return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Disable markdown linting entirely, or configure specific rules
      linters_by_ft = {
        markdown = {}, -- Empty array = no linters for markdown
      },
    },
  },
}
