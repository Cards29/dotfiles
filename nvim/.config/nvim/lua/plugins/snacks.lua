return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- --- UI & Aesthetics ---
    animate = { enabled = true },                  -- Smooth animations for cursor movement and scrolling
    indent = { enabled = true },                   -- Modern indent guides with scope detection
    notifier = { enabled = true, timeout = 3000 }, -- Pretty notification UI (replaces default)
    notify = { enabled = true },                   -- Wraps vim.notify to use the snacks notifier
    scroll = { enabled = true },                   -- Smooth scrolling animations
    statuscolumn = { enabled = true },             -- Custom status column with signs, numbers, and folds

    -- --- File & Buffer Management ---
    bigfile = { enabled = true },   -- Optimizes performance when opening very large files
    bufdelete = { enabled = true }, -- Delete buffers without disrupting your window layout
    quickfile = { enabled = true }, -- Faster file opening by bypassing heavy autocmds
    rename = { enabled = true },    -- LSP-integrated file renaming with UI
    win = { enabled = true },       -- High-performance window management and API

    -- --- Search & Navigation ---
    picker = { enabled = true }, -- A powerful, fast picker (similar to Telescope/Fzf)
    scope = { enabled = true },  -- Scope-based logic for navigation and highlighting
    words = { enabled = true },  -- Highlights and allows jumping between LSP references of the word under cursor

    -- --- Dashboard ---
    dashboard = { enabled = false }, -- Snacks dashboard

    -- --- Git Integration ---
    gh = { enabled = true },        -- GitHub-specific integrations and picker extensions
    git = { enabled = true },       -- General Git utilities (blame, etc.)
    gitbrowse = { enabled = true }, -- Open current file/line in your browser (GitHub/GitLab)
    lazygit = { configure = true }, -- Integration for the Lazygit terminal UI

    -- --- Productivity & Utils ---
    keymap = { enabled = true },   -- Helpful metadata and utilities for keybindings
    layout = { enabled = true },   -- Advanced window layout manager for pickers and UI
    scratch = { enabled = true },  -- Instant scratch buffers for notes or temporary code
    toggle = { enabled = true },   -- API to create toggles for settings (indent, wrap, etc.)
    terminal = { enabled = true }, -- Snacks terminal

    -- --- Visual Styles ---
    styles = {
      notification = { border = "rounded", transparent = true },
      scratch = { border = "rounded", width = 0.8, height = 0.8 },
      lazygit = { border = "rounded", width = 0.9, height = 0.9 },
      terminal = {
        border = "rounded",
        position = "bottom",
        width = function(self)
          local pos = self.opts.position
          if pos == "right" then
            return 0.5
          elseif pos == "bottom" then
            return 1.0 -- full width for horizontal split
          else
            return 0.9 -- default float
          end
        end,
        height = function(self)
          local pos = self.opts.position
          if pos == "right" then
            return 1.0 -- full height for vertical split
          elseif pos == "bottom" then
            return 0.7
          else
            return 0.8 -- default float
          end
        end,
      },
    },
  },
  keys = {
    -- --- SCRATCH & NOTES ---
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
    {
      "<leader>nh",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },

    -- --- GIT & GITHUB ---
    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gf",
      function()
        Snacks.lazygit.log_file()
      end,
      desc = "Lazygit Current File Log",
    },
    {
      "<leader>gL",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Lazygit Log (Project)",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse (Open)",
      mode = { "n", "v" },
    },
    {
      "<leader>gY",
      function()
        Snacks.gitbrowse({
          open = function(url)
            vim.fn.setreg("+", url)
          end,
          notify = false,
        })
      end,
      desc = "Git Browse (Copy URL)",
      mode = { "n", "v" },
    },

    -- GitHub Picker (Requires Snacks.picker)
    {
      "<leader>gi",
      function()
        Snacks.picker.gh_issue()
      end,
      desc = "GitHub Issues",
    },
    {
      "<leader>gp",
      function()
        Snacks.picker.gh_pr()
      end,
      desc = "GitHub PRs",
    },

    -- --- UI TOGGLES (Fixed) ---
    {
      "<leader>ui",
      function()
        Snacks.toggle.indent():toggle()
      end,
      desc = "Toggle Indent Guides",
    },
    {
      "<leader>un",
      function()
        Snacks.toggle.line_number():toggle()
      end,
      desc = "Toggle Line Numbers",
    },
    {
      "<leader>ua",
      function()
        Snacks.toggle.animate():toggle()
      end,
      desc = "Toggle Animation",
    },
    {
      "<leader>ud",
      function()
        Snacks.toggle.diagnostics():toggle()
      end,
      desc = "Toggle Diagnostics",
    },

    -- --- TERMINAL ---
    {
      "<C-\\>",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle Terminal",
      mode = { "n", "t" },
    },
    {
      "<leader>tf",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle Terminal (Float)",
    },
    {
      "<leader>tt",
      function()
        Snacks.terminal.toggle(nil, { win = { position = "bottom" } })
      end,
      desc = "Toggle Terminal (Bottom Split)",
    },
    {
      "<leader>tv",
      function()
        Snacks.terminal.toggle(nil, { win = { position = "right" } })
      end,
      desc = "Toggle Terminal (Right Split)",
    },
    {
      "<leader>tn",
      function()
        Snacks.terminal.open()
      end,
      desc = "New Terminal",
    },
    {
      "<leader>1",
      function()
        Snacks.terminal.toggle(nil, { count = 1 })
      end,
      desc = "Terminal 1",
    },
    {
      "<leader>2",
      function()
        Snacks.terminal.toggle(nil, { count = 2 })
      end,
      desc = "Terminal 2",
    },
    {
      "<leader>3",
      function()
        Snacks.terminal.toggle(nil, { count = 3 })
      end,
      desc = "Terminal 3",
    },
    {
      "<leader>4",
      function()
        Snacks.terminal.toggle(nil, { count = 4 })
      end,
      desc = "Terminal 4",
    },
    {
      "<leader>5",
      function()
        Snacks.terminal.toggle(nil, { count = 5 })
      end,
      desc = "Terminal 5",
    },

    --- --- NAVIGATION & UTILS ---
    {
      "]]",
      function()
        Snacks.words.jump(1, true)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-1, true)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
  },
}
