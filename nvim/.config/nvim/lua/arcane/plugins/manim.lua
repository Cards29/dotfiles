return {
	"yeasin50/manim.nvim",
	ft = "python",
	keys = {
		{ "<leader>mp", "<cmd>ManimPlay<cr>", desc = "Play Manim class" },
	},
	opts = {
		manim_path = "manim", -- system binary
		play_args = { "-pql" }, -- preview quality (low)
	},
}
