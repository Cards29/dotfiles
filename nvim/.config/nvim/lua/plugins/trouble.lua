return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		focus = true,
	},
	cmd = "Trouble",

	keys = {
		-- diagnostics / lists
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Workspace diagnostics" },
		{ "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Document diagnostics" },
		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Todo list" },

		-- code navigation
		{ "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols outline" },
		{ "<leader>cr", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP navigation" },
	},
}
