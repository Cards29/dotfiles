return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim", -- For linters/formatters
    },
    config = function()
      local keymap = vim.keymap

      -- 1. Setup Mason
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      -- 2. Setup Mason LSP Config (Handles LSP Servers)
      local servers = {
        "ts_ls", "html", "cssls", "tailwindcss", "svelte",
        "lua_ls", "graphql", "emmet_ls", "prismals", "pyright", "eslint"
      }

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true,
      })

      -- 3. Setup Mason Tool Installer (Handles Linters/Formatters)
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier", -- formatter
          "stylua",   -- lua formatter
          "eslint_d", -- linter (requested in your image)
        },
      })

      -- 4. Enable servers via built-in Neovim 0.10+ command
      -- This tells Neovim which servers to actually start
      vim.lsp.enable(servers)

      -- 5. Diagnostic Config
      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = "󰠠 ",
            [vim.diagnostic.severity.INFO]  = " ",
          },
        },
      })

      -- 6. LSP Attach Autocmd (Your existing keymaps)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }

          opts.desc = "Show LSP references"
          keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts)

          opts.desc = "Go to declaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

          opts.desc = "Show LSP definition"
          keymap.set("n", "gd", vim.lsp.buf.definition, opts)

          opts.desc = "Show LSP implementations"
          keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)

          opts.desc = "Show LSP type definitions"
          keymap.set("n", "gt", "<cmd>FzfLua lsp_typedefs<CR>", opts)

          opts.desc = "See available code actions"
          keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

          opts.desc = "Smart rename"
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

          opts.desc = "Show buffer diagnostics"
          keymap.set("n", "<leader>D", "<cmd>FzfLua diagnostics_document<CR>", opts)

          opts.desc = "Show line diagnostics"
          keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

          opts.desc = "Go to previous diagnostic"
          keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
          end, opts)

          opts.desc = "Go to next diagnostic"
          keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, opts)

          opts.desc = "Show documentation for what is under cursor"
          keymap.set("n", "K", vim.lsp.buf.hover, opts)

          opts.desc = "Restart LSP"
          keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        end,
      })
    end,
  },
}
