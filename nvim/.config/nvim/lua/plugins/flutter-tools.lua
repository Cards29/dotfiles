return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("flutter-tools").setup({
			flutter_path = vim.fn.expand("~/Development/flutter/bin/flutter"),
			debugger = {
				enabled = true,
			},
			lsp = {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			},
		})
	end,
}
