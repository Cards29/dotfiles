return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" }, -- lazy-load only when needed
		keys = {
			{ "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
			{ "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "Git diff split" },
			{ "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
			{ "<leader>gc", "<cmd>Git commit<CR>", desc = "Git commit" },
			{ "<leader>gP", "<cmd>Git push<CR>", desc = "Git push" },
			{ "<leader>gp", "<cmd>Git pull<CR>", desc = "Git pull" },
		},
	},
}
