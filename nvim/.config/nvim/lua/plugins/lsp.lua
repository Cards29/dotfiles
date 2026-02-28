return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
		},
		config = function()
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

			-- 2. Setup Mason LSP Config
			local servers = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"eslint",
				"clangd",
			}

			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_installation = true,
			})

			-- 3. Setup Mason Tool Installer (Linters/Formatters)
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"eslint_d",
				},
			})

			-- 4. Modern Neovim 0.11+ Server Setup with Blink
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			for _, server in ipairs(servers) do
				-- Use the new native API to avoid the lspconfig framework deprecation
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
				-- Actually enable the server
				vim.lsp.enable(server)
			end

			-- 5. Diagnostic Config
			vim.diagnostic.config({
				virtual_text = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			})

			-- 6. LSP Attach Autocmd (Keymaps)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }

					opts.desc = "Show LSP references"
					vim.keymap.set("n", "gR", function()
						Snacks.picker.lsp_references()
					end, opts)

					opts.desc = "Show LSP definitions"
					vim.keymap.set("n", "gd", function()
						Snacks.picker.lsp_definitions()
					end, opts)

					opts.desc = "Show LSP declarations"
					vim.keymap.set("n", "gD", function()
						Snacks.picker.lsp_declarations()
					end, opts)

					opts.desc = "Show LSP implementations"
					vim.keymap.set("n", "gi", function()
						Snacks.picker.lsp_implementations()
					end, opts)

					opts.desc = "Show LSP type definitions"
					vim.keymap.set("n", "gt", function()
						Snacks.picker.lsp_type_definitions()
					end, opts)

					opts.desc = "Show document symbols"
					vim.keymap.set("n", "<leader>ss", function()
						Snacks.picker.lsp_symbols()
					end, opts)

					opts.desc = "Show workspace symbols"
					vim.keymap.set("n", "<leader>sS", function()
						Snacks.picker.lsp_workspace_symbols()
					end, opts)

					opts.desc = "Show incoming calls"
					vim.keymap.set("n", "<leader>ci", function()
						Snacks.picker.lsp_incoming_calls()
					end, opts)

					opts.desc = "Show outgoing calls"
					vim.keymap.set("n", "<leader>co", function()
						Snacks.picker.lsp_outgoing_calls()
					end, opts)

					opts.desc = "See available code actions"
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

					opts.desc = "Smart rename"
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

					opts.desc = "Show documentation"
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

					opts.desc = "Restart LSP"
					vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)

					opts.desc = "Show LSP logs"
					vim.keymap.set("n", "<leader>sl", "<cmd>LspLog<CR>", opts)
				end,
			})
		end,
	},
}
