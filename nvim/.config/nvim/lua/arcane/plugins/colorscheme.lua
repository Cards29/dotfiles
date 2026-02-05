return {
	{
		"marko-cerovac/material.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.g.material_style = "deep ocean"
		end,
		opt = {
			transparent = false,
			term_colors = true,

			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { bold = true, undercurl = true },
				strings = {},
				variables = {},
				operators = {},
				types = {},
			},

			plugins = {
				all = true,
			},
		},
		config = function(_, opt)
			require("material").setup(opt)
			vim.cmd.colorscheme("material")
		end,
	},
}
