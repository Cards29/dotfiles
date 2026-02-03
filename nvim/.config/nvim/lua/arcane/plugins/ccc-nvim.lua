return {
	"uga-rosa/ccc.nvim",
	lazy = true,

	opts = {
		highlighter = {
			auto_enable = true,
			lsp = true,
		},
	},

	keys = {
		{ "<leader>pp", "<cmd>CccPick<CR>", desc = "Pick color" },
		{ "<leader>pc", "<cmd>CccConvert<CR>", desc = "Convert color" },
	},
}
