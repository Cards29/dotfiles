return {
	"wr9dg17/essential-term.nvim",
	lazy = false,
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("essential-term").setup({
			display_mode = "horizontal", -- or "vertical" or "float"
			size = 70, -- percentage of editor height/width
		})
	end,
	keys = {
		{ "<C-t>", "<cmd>EssentialTermToggle<cr>", mode = { "n", "t" } },
		{ "<C-n>", "<cmd>EssentialTermNew<cr>", mode = { "n", "t" } },
		{ "<C-x>", "<cmd>EssentialTermClose<cr>", mode = { "n", "t" } },
		{ "<C-h>", "<cmd>EssentialTermPrev<cr>", mode = { "t" } },
		{ "<C-l>", "<cmd>EssentialTermNext<cr>", mode = { "t" } },
	},
}
