return {
	{
		"sainnhe/everforest",
		priority = 1000,
		lazy = false,
		config = function()
			vim.g.everforest_background = "soft"
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_disable_italic_comment = 0
			vim.g.everforest_transparent_background = 0
			vim.g.everforest_ui_contrast = "low"
			vim.g.everforest_show_eob = 0
			vim.g.everforest_float_style = "dim"
			vim.g.everforest_diagnostic_text_highlight = 1
			vim.g.everforest_diagnostic_line_highlight = 0
			vim.g.everforest_diagnostic_virtual_text = "grey"
			vim.g.everforest_current_word = "grey background"

			vim.cmd.colorscheme("everforest")
		end,
	},

	{ "catppuccin/nvim", name = "catppuccin", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "rose-pine/neovim", name = "rose-pine", lazy = true },
	{ "sainnhe/gruvbox-material", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "scottmckendry/cyberdream.nvim", lazy = true },
	{ "AlexvZyl/nordic.nvim", lazy = true },
	{ "nyoom-engineering/oxocarbon.nvim", lazy = true },
	{ "savq/melange-nvim", lazy = true },
	{ "kaicataldo/material.vim", lazy = true },
	{ "mcchrish/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" }, lazy = true },
	{ "metalelf0/jellybeans-nvim", dependencies = { "rktjmp/lush.nvim" }, lazy = true },
	{ "baliestri/aura-theme", src = "packages/neovim", lazy = true },
	{ "shaunsingh/nord.nvim", lazy = true },
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = true },
	{ "oskarnurm/koda.nvim", lazy = true },
}
