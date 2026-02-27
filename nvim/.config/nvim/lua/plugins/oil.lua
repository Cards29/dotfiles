return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Oil",
	keys = {
		{ "<leader>e", "<cmd>Oil --float<cr>", desc = "Explorer (Oil float)" },
	},
	opts = {
		skip_confirm_for_simple_edits = true,
	},
}
