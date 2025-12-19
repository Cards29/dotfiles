return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- Load this during startup
		priority = 1000, -- Load this before other plugins
		opts = {
			style = "night", -- Choose between: storm, night, moon, day
			transparent = false, -- Great if you use a transparent terminal on Arch
			terminal_colors = true,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
