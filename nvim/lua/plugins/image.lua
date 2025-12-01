return {
  -- ╔══════════════════════════════════════════════════════════════════════╗
  -- ║                    IMAGE.NVIM - INLINE IMAGE RENDERING               ║
  -- ║                         Sixel Backend for WezTerm + tmux             ║
  -- ╚══════════════════════════════════════════════════════════════════════╝
  {
    "3rd/image.nvim",
    build = false, -- No luarocks build needed, using magick_cli
    ft = { "markdown", "vimwiki", "norg" },
    event = "VeryLazy",
    opts = {
      -- Backend configuration
      backend = "sixel", -- Use sixel for WezTerm
      processor = "magick_cli", -- Use ImageMagick CLI (no luarocks needed)

      -- Rendering options
      max_width_window_percentage = 80,
      max_height_window_percentage = 50,

      -- Window behavior
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      tmux_show_only_in_active_window = true,

      -- File patterns to hijack (open images directly in neovim)
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },

      -- Markdown integration
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = true,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          floating_windows = false,
          filetypes = { "markdown", "vimwiki" },
        },
      },
    },
    keys = {
      { "<leader>ic", function() require("image").clear() end, desc = "Clear all images" },
      { "<leader>ir", "<cmd>e<cr>", desc = "Refresh images" },
    },
  },
}
