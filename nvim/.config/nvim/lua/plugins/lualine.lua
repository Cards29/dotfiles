return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = "",
				section_separators = "",
				globalstatus = true,
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = { "filename" },

				lualine_x = {
					function()
						return "󰃭 " .. os.date("%a %b %d") .. " | 󰥔 " .. os.date("%H:%M")
					end,
				},
				lualine_y = { "filetype" },
				lualine_z = {},
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "branch" },
			},
		})
	end,
}
