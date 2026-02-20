return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	keys = {
		{ "<leader>mv", "<cmd>Markview splitToggle<CR>", { desc = "Markview Split Toggle" } },
	},
	opt = {
		preview = {
			icon_provider = "devicons",
		},
	},
}
