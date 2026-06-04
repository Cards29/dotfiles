return {
	"folke/tokyonight.nvim",
	lazy = false, -- Load this immediately so it doesn't flash when opening Neovim
	priority = 1000, -- Make sure it loads before all other plugins
	config = function()
		require("tokyonight").setup({
			style = "moon", -- Sets the flavor specifically to Moon
			transparent = false, -- Set to true if you want your terminal background to show through
			styles = {
				sidebars = "dark", -- Left sidebars (like NvimTree/Neo-tree) stay clean and dark
				floats = "dark", -- Floating windows get a dark, distinct background
			},
		})

		-- Actually load the colorscheme
		vim.cmd([[colorscheme tokyonight]])
	end,
}
