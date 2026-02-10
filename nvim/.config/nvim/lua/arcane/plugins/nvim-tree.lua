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

	-- We use config instead of just opts to set up the Snacks integration
	config = function(_, opts)
		require("nvim-tree").setup(opts)

		-- SNACKS RENAME INTEGRATION
		local prev = { new_name = "", old_name = "" } -- Prevents duplicate event triggers
		require("nvim-tree.api").events.subscribe(require("nvim-tree.api").events.Event.NodeRenamed, function(data)
			if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
				prev = data
				Snacks.rename.on_rename_file(data.old_name, data.new_name)
			end
		end)
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
		update_cwd = true,
		respect_buf_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
	},
}
