return {
  -- ╔══════════════════════════════════════════════════════════════════════╗
  -- ║                    MARKDOWN ECOSYSTEM FOR NEOVIM                     ║
  -- ║                         Enhanced Setup 2025                          ║
  -- ╚══════════════════════════════════════════════════════════════════════╝

  -- ┌──────────────────────────────────────────────────────────────────────┐
  -- │                     IN-BUFFER MARKDOWN RENDERING                     │
  -- └──────────────────────────────────────────────────────────────────────┘
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" },
    config = function()
      require("render-markdown").setup({
        -- Rich in-buffer rendering (complementing peek.nvim preview)

        -- INDENT: Visual hierarchy - content under headings gets indented
        -- This creates clear visual separation between sections
        indent = {
          enabled = true,
          per_level = 3,       -- 3 spaces per heading level
          skip_level = 0,      -- Start from H1 level (all content gets indented)
          skip_heading = true, -- Headings stay at edge, content indented
          icon = "│",          -- Vertical line for clear visual guide
          highlight = "Comment", -- Subtle color for indent guide
        },

        -- Headings with beautiful icons and distinct visual hierarchy
        heading = {
          enabled = true,
          sign = true,
          icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
          width = "full",
          -- Add background colors for each heading level (simulates size)
          backgrounds = {
            "RenderMarkdownH1Bg",
            "RenderMarkdownH2Bg",
            "RenderMarkdownH3Bg",
            "RenderMarkdownH4Bg",
            "RenderMarkdownH5Bg",
            "RenderMarkdownH6Bg",
          },
          -- Foreground colors for heading text
          foregrounds = {
            "RenderMarkdownH1",
            "RenderMarkdownH2",
            "RenderMarkdownH3",
            "RenderMarkdownH4",
            "RenderMarkdownH5",
            "RenderMarkdownH6",
          },
          border = true,
          border_virtual = true,
          left_pad = 1,
          right_pad = 1,
          above = "▃",
          below = "▀",
        },
        -- Code blocks with full styling
        code = {
          enabled = true,
          sign = true,
          style = "full",
          position = "left",
          language_pad = 0,
          disable_background = { "diff" },
          width = "block",
          left_pad = 2,
          right_pad = 2,
        },
        -- Bullet points with visual hierarchy
        bullet = {
          enabled = true,
          icons = { "●", "○", "◆", "◇" },
        },
        -- Interactive checkboxes
        checkbox = {
          enabled = true,
          unchecked = {
            icon = "󰄱 ",
            highlight = "RenderMarkdownUnchecked",
          },
          checked = {
            icon = "󰱒 ",
            highlight = "RenderMarkdownChecked",
          },
          custom = {
            todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
          },
        },
        -- Pipe tables with borders
        pipe_table = {
          enabled = true,
          style = "full",
          cell = "padded",
        },
        -- GitHub-style callouts/alerts (restored!)
        callout = {
          note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
          tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
          important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
          warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
          caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
          abstract = { raw = "[!ABSTRACT]", rendered = "󰨸 Abstract", highlight = "RenderMarkdownInfo" },
          todo = { raw = "[!TODO]", rendered = " Todo", highlight = "RenderMarkdownInfo" },
          success = { raw = "[!SUCCESS]", rendered = "󰄬 Success", highlight = "RenderMarkdownSuccess" },
          question = { raw = "[!QUESTION]", rendered = "󰘥 Question", highlight = "RenderMarkdownWarn" },
          failure = { raw = "[!FAILURE]", rendered = "󰅖 Failure", highlight = "RenderMarkdownError" },
          danger = { raw = "[!DANGER]", rendered = "󱐌 Danger", highlight = "RenderMarkdownError" },
          bug = { raw = "[!BUG]", rendered = "󰃤 Bug", highlight = "RenderMarkdownError" },
          example = { raw = "[!EXAMPLE]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint" },
          quote = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote" },
        },
        -- Link rendering with icons
        link = {
          enabled = true,
          image = "󰥶 ",
          email = "󰀓 ",
          hyperlink = "󰌹 ",
          custom = {
            web = { pattern = "^http", icon = "󰖟 " },
          },
        },
      })

      -- Custom highlight groups for heading hierarchy (Catppuccin-inspired)
      -- H1 = largest/boldest, H6 = smallest/subtlest
      vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#f38ba8", bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#3b2838" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#fab387", bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#3b3328" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#f9e2af", bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "#3b3928" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = "#a6e3a1", bold = false })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "#283b2e" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = "#89b4fa", bold = false })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "#28303b" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#cba6f7", bold = false })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "#33283b" })
    end,
  },

  -- ┌──────────────────────────────────────────────────────────────────────┐
  -- │                    PEEK.NVIM - MODERN WEBVIEW PREVIEW                │
  -- └──────────────────────────────────────────────────────────────────────┘
  -- Beautiful GitHub-style preview in separate window (requires Deno)
  -- Install Deno: brew install deno (or see https://deno.land)
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    keys = {
      {
        "<leader>mp",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Peek (Markdown Preview)",
      },
    },
    opts = {
      -- Main options
      auto_load = false, -- Don't auto-open (use <leader>mp to toggle)
      close_on_bdelete = true, -- Close preview when buffer deleted
      syntax = true, -- Enable syntax highlighting
      theme = "dark", -- 'dark' or 'light'
      update_on_change = true, -- Live update as you type

      -- Webview appearance
      app = "webview", -- Use webview (not browser) - cleaner integration
      filetype = { "markdown" }, -- Only for markdown files
      throttle_at = 200000, -- Throttle updates for large files
      throttle_time = "auto", -- Auto throttle timing

      -- Note: Window automatically enters native macOS full screen on open
      -- Use Escape or Cmd+W to close from within the preview window
    },
    config = function(_, opts)
      require("peek").setup(opts)

      -- Auto-fullscreen peek.nvim window on macOS
      vim.api.nvim_create_autocmd("User", {
        pattern = "PeekOpen",
        callback = function()
          -- Wait a bit for window to appear
          vim.defer_fn(function()
            -- AppleScript to make "Peek preview" window full screen
            local script = [[
              tell application "System Events"
                try
                  set peekWindow to first window of (first process whose name contains "Peek preview")
                  -- Enter native macOS full screen mode
                  tell peekWindow
                    set value of attribute "AXFullScreen" to true
                  end tell
                end try
              end tell
            ]]
            vim.fn.system("osascript -e '" .. script:gsub("\n", " "):gsub("'", "'\\''") .. "'")
          end, 500)
        end,
      })
    end,
  },

  -- ┌──────────────────────────────────────────────────────────────────────┐
  -- │                      BROWSER-BASED PREVIEW (BACKUP)                  │
  -- └──────────────────────────────────────────────────────────────────────┘
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_auto_close = 0 -- Don't auto-close preview when switching buffers
      vim.g.mkdp_theme = "dark" -- Use dark theme for preview
    end,
    ft = { "markdown" },
    keys = {
      { "<leader>mb", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview (Browser)" },
    },
  },

  -- ┌──────────────────────────────────────────────────────────────────────┐
  -- │                    MARKSMAN LSP (INTELLIGENCE)                       │
  -- └──────────────────────────────────────────────────────────────────────┘
  -- Provides: completion, goto definition, find references, wiki-links
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {
          -- Marksman provides:
          -- • [[wiki-link]] completion and navigation
          -- • Go to definition (gd) for links
          -- • Find references across files
          -- • Rename refactoring
          -- • Broken link diagnostics
          -- • Table of contents generation
        },
      },
    },
  },

  -- Ensure Marksman is installed via Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "marksman", -- Markdown LSP
        "markdownlint-cli2", -- Markdown linter
        "prettier", -- Markdown formatter
      },
    },
  },

  -- ┌──────────────────────────────────────────────────────────────────────┐
  -- │                      IMAGE WORKFLOW (PASTE/DRAG)                     │
  -- └──────────────────────────────────────────────────────────────────────┘
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        -- Images saved to ./assets/ directory
        dir_path = "assets",
        -- File naming with timestamp
        file_name = "%Y-%m-%d-%H-%M-%S",
        -- Default to PNG format
        extension = "png",
        -- Prompt for filename (set to false for auto-naming)
        prompt_for_file_name = true,
        -- Use relative paths in markdown
        relative_to_current_file = true,
      },
      filetypes = {
        markdown = {
          -- Markdown-specific template
          template = "![$CURSOR]($FILE_PATH)",
        },
      },
    },
    keys = {
      { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
      { "<leader>ps", "<cmd>ImgClipSelect<cr>", desc = "Select image to insert" },
    },
  },

  -- ┌──────────────────────────────────────────────────────────────────────┐
  -- │                       DOCUMENT OUTLINE/STRUCTURE                     │
  -- └──────────────────────────────────────────────────────────────────────┘
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<cr>", desc = "Toggle document outline" },
      { "<leader>O", "<cmd>OutlineOpen<cr>", desc = "Open outline and focus" },
    },
    opts = {
      outline_window = {
        position = "left",  -- Left side for easy navigation
        width = 30,  -- Slightly wider for readability
        relative_width = false,  -- Fixed width
        auto_jump = false,  -- Don't jump to symbol on click
        show_numbers = false,
        show_relative_numbers = false,
      },
      symbols = {
        -- Show only headings for markdown
        filter = { "String" }, -- String = markdown headings
      },
      preview_window = {
        auto_preview = true,  -- Auto preview on hover
        live = true,
      },
      -- Show current position
      symbol_folding = {
        autofold_depth = false,
        auto_unfold_hover = true,
      },
    },
  },

  -- ┌──────────────────────────────────────────────────────────────────────┐
  -- │                    AUTOMATED BULLET/LIST MANAGEMENT                  │
  -- └──────────────────────────────────────────────────────────────────────┘
  {
    "bullets-vim/bullets.vim",
    ft = { "markdown", "text", "gitcommit" },
    init = function()
      -- Enable for markdown files
      vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit" }
      -- Checkbox markers
      vim.g.bullets_checkbox_markers = " .oOX"
      -- Renumber on change
      vim.g.bullets_renumber_on_change = 1
      -- Nested checkboxes
      vim.g.bullets_nested_checkboxes = 1
    end,
  },

  -- ┌──────────────────────────────────────────────────────────────────────┐
  -- │                   MARKDOWN KEYBINDINGS & COMMANDS                    │
  -- └──────────────────────────────────────────────────────────────────────┘
  {
    "tadmccorkle/markdown.nvim",
    ft = { "markdown" },
    opts = {
      -- Keybindings for markdown operations
      mappings = {
        inline_surround_toggle = "gs", -- Toggle inline style (bold, italic)
        inline_surround_toggle_line = "gss", -- Toggle on line
        inline_surround_delete = "ds", -- Delete surrounding
        inline_surround_change = "cs", -- Change surrounding
        link_add = "gl", -- Add link
        link_follow = "gx", -- Follow link
        go_curr_heading = "]c", -- Go to current heading
        go_parent_heading = "]p", -- Go to parent heading
        go_next_heading = "]]", -- Go to next heading
        go_prev_heading = "[[", -- Go to previous heading
      },
      inline_surround = {
        emphasis = {
          key = "i",
          txt = "*",
        },
        strong = {
          key = "b",
          txt = "**",
        },
        strikethrough = {
          key = "s",
          txt = "~~",
        },
        code = {
          key = "c",
          txt = "`",
        },
      },
      on_attach = function(bufnr)
        local map = vim.keymap.set
        local opts = { buffer = bufnr }

        -- Toggle checkbox
        map({ "n", "v" }, "<leader>mt", "<cmd>MDTaskToggle<cr>", opts)
        -- Insert table of contents
        map("n", "<leader>mT", "<cmd>MDToc<cr>", opts)
        -- Insert code block
        map("n", "<leader>mc", "o```<cr>```<esc>kA", opts)
      end,
    },
  },

  -- ┌──────────────────────────────────────────────────────────────────────┐
  -- │                        TABLE OF CONTENTS GENERATOR                   │
  -- └──────────────────────────────────────────────────────────────────────┘
  {
    "mzlogin/vim-markdown-toc",
    ft = { "markdown" },
    cmd = { "GenTocGFM", "GenTocRedcarpet", "GenTocGitLab", "UpdateToc", "RemoveToc" },
    keys = {
      { "<leader>mtc", "<cmd>GenTocGFM<cr>", desc = "Generate TOC (GitHub)" },
      { "<leader>mtu", "<cmd>UpdateToc<cr>", desc = "Update existing TOC" },
    },
    init = function()
      -- Auto-update TOC on save
      vim.g.vmt_auto_update_on_save = 1
      -- Don't insert fence (use comment markers instead)
      vim.g.vmt_fence_text = "TOC"
      vim.g.vmt_fence_closing_text = "/TOC"
    end,
  },

  -- ┌──────────────────────────────────────────────────────────────────────┐
  -- │                      FORMATTING WITH PRETTIER                        │
  -- └──────────────────────────────────────────────────────────────────────┘
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        markdown = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
      },
      formatters = {
        prettier = {
          prepend_args = {
            "--prose-wrap",
            "always",
            "--print-width",
            "80",
          },
        },
      },
    },
  },

  -- ┌──────────────────────────────────────────────────────────────────────┐
  -- │                    LINTING WITH MARKDOWNLINT                         │
  -- └──────────────────────────────────────────────────────────────────────┘
  -- DISABLED: Too noisy, disrupts visual flow
  -- {
  --   "mfussenegger/nvim-lint",
  --   optional = true,
  --   opts = {
  --     linters_by_ft = {
  --       markdown = { "markdownlint-cli2" },
  --     },
  --   },
  -- },
}
