return {
	"zeybek/camouflage.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{ "<leader>Ct", "<cmd>CamouflageToggle<cr>", desc = "Toggle Camouflage" },
		{ "<leader>Cr", "<cmd>CamouflageReveal<cr>", desc = "Reveal Line" },
		{ "<leader>Cy", "<cmd>CamouflageYank<cr>", desc = "Yank Value" },
		{ "<leader>Cf", "<cmd>CamouflageFollowCursor<cr>", desc = "Follow Cursor" },
	},
}
