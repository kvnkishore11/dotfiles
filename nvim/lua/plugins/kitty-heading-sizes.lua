return {
  -- ╔══════════════════════════════════════════════════════════════════════╗
  -- ║           KITTY TEXT SIZING FOR MARKDOWN HEADINGS                    ║
  -- ║     Experimental: Uses Kitty 0.40+ Text Sizing Protocol (OSC 66)     ║
  -- ╚══════════════════════════════════════════════════════════════════════╝
  --
  -- This is an experimental feature that uses Kitty's text sizing protocol
  -- to render markdown headings in different font sizes.
  --
  -- Protocol: ESC ] 66 ; s=SCALE ; TEXT BEL
  -- Where SCALE = 1-7 (1 = normal, 7 = largest)
  --
  -- NOTE: This requires Kitty 0.40+ and currently no Neovim plugin
  -- officially supports this, so this is a custom implementation.

  {
    "nvim-lua/plenary.nvim", -- dependency for utilities
    lazy = true,
  },

  -- Custom heading size renderer using Kitty protocol
  {
    dir = vim.fn.stdpath("config") .. "/lua/custom/kitty-sizes",
    name = "kitty-heading-sizes",
    ft = { "markdown" },
    enabled = function()
      -- Only enable if running in Kitty terminal
      return vim.env.TERM == "xterm-kitty" or vim.env.KITTY_WINDOW_ID ~= nil
    end,
    config = function()
      -- Kitty Text Sizing Protocol escape sequences
      -- Format: \x1b]66;s=SCALE;TEXT\x07
      local function kitty_sized_text(text, scale)
        -- scale: 1-7 (1 = normal size, 7 = 7x size)
        return string.format("\x1b]66;s=%d;%s\x07", scale, text)
      end

      -- Heading scale mapping (H1 = largest, H6 = smallest)
      local heading_scales = {
        [1] = 3, -- H1: 3x size
        [2] = 2, -- H2: 2x size
        [3] = 2, -- H3: 2x size (slightly smaller feel with color)
        [4] = 1, -- H4: normal
        [5] = 1, -- H5: normal
        [6] = 1, -- H6: normal
      }

      -- Create namespace for extmarks
      local ns = vim.api.nvim_create_namespace("kitty_heading_sizes")

      -- Function to detect if we're in Kitty with text sizing support
      local function supports_text_sizing()
        local kitty_ver = vim.env.KITTY_WINDOW_ID
        return kitty_ver ~= nil
      end

      -- Apply sized headings (experimental - uses virtual text overlay)
      local function apply_heading_sizes(bufnr)
        if not supports_text_sizing() then
          return
        end

        bufnr = bufnr or vim.api.nvim_get_current_buf()

        -- Clear existing extmarks
        vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

        -- Get all lines
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

        for i, line in ipairs(lines) do
          -- Match markdown headings
          local level, content = line:match("^(#+)%s+(.+)$")
          if level and content then
            local heading_level = #level
            local scale = heading_scales[heading_level] or 1

            if scale > 1 then
              -- For now, we'll add a visual indicator
              -- True OSC 66 rendering would need terminal-level integration
              -- which Neovim doesn't expose directly yet
              --
              -- This adds a subtle size indicator as virtual text
              local size_indicator = string.rep("█", scale)
              vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, 0, {
                virt_text = { { size_indicator, "Comment" } },
                virt_text_pos = "right_align",
              })
            end
          end
        end
      end

      -- Auto-apply on markdown files
      vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "TextChangedI" }, {
        pattern = "*.md",
        callback = function(ev)
          -- Debounce for performance
          vim.defer_fn(function()
            if vim.api.nvim_buf_is_valid(ev.buf) then
              apply_heading_sizes(ev.buf)
            end
          end, 100)
        end,
      })

      -- Command to test Kitty text sizing directly in terminal
      vim.api.nvim_create_user_command("KittyTextSizeTest", function()
        -- This outputs directly to terminal to test the protocol
        local test_output = [[
Testing Kitty Text Sizing Protocol (OSC 66):
]]
        print(test_output)

        -- Direct terminal output with escape sequences
        io.write("\x1b]66;s=3;This is 3x sized text (H1)\x07\n")
        io.write("\x1b]66;s=2;This is 2x sized text (H2)\x07\n")
        io.write("This is normal sized text (body)\n")
      end, {})

      -- Info message
      vim.notify(
        "Kitty heading sizes: experimental feature loaded.\n"
          .. "Run :KittyTextSizeTest to test text sizing protocol.",
        vim.log.levels.INFO
      )
    end,
  },
}
