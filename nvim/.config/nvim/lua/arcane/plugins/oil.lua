return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Oil",
	keys = {
		{ "<leader>e", "<cmd>Oil --float<cr>", desc = "Explorer (Oil float)" },
		{ "-", "<cmd>Oil<cr>", desc = "Oil (parent dir)" },
	},
	opts = {},
}
