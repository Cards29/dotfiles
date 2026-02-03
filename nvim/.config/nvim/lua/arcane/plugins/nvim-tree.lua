return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",

	cmd = {
		"NvimTreeToggle",
		"NvimTreeFocus",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeCollapse",
	},

	keys = {
		{ "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
		{ "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Explorer on current file" },
		{ "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse explorer" },
	},

	-- runs BEFORE the plugin loads
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,

	-- automatically passed to require("nvim-tree").setup(opts)
	opts = {
		view = {
			width = 40,
			relativenumber = true,
			side = "right",
		},
		renderer = {
			indent_markers = {
				enable = true,
			},
			icons = {
				glyphs = {
					folder = {
						arrow_closed = "",
						arrow_open = "",
					},
				},
			},
		},
		actions = {
			open_file = {
				window_picker = {
					enable = false,
				},
			},
		},
		filters = {
			custom = { ".DS_Store" },
		},
		git = {
			ignore = false,
		},
	},
}
