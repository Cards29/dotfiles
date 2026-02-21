return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local keymap = vim.keymap

      vim.diagnostic.config({ virtual_text = true, })

      -- Enable servers
      vim.lsp.enable({ "lua_ls" }) -- Lua LSP
      vim.lsp.enable({ "ts_ls" })  -- TypeScript/JS LSP

      -- LSP keymaps & buffer-local settings
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

      -- Diagnostic signs
      local severity = vim.diagnostic.severity
      vim.diagnostic.config({
        signs = {
          text = {
            [severity.ERROR] = " ",
            [severity.WARN]  = " ",
            [severity.HINT]  = "󰠠 ",
            [severity.INFO]  = " ",
          },
        },
      })

      -- Optional: inlay hints (Lua >= 0.11)
      -- vim.lsp.inlay_hint.enable(true)
    end,
  },
}
