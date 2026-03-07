return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"folke/snacks.nvim",
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>gn", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
	},
	opts = { graph_style = "unicode" },
}
