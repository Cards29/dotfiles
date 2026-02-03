return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",

	cmd = "Telescope",

	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
		{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Search keymaps" },
		{ "?", "<cmd>Telescope keymaps<cr>", desc = "Search keymaps" },
		{
			"<leader>fa",
			function()
				require("telescope.builtin").find_files({
					find_command = {
						"fd",
						"--type",
						"f",
						"--no-ignore",
						"--hidden",
						"--strip-cwd-prefix",
					},
				})
			end,
			desc = "Fuzzy find all files (no ignore)",
		},
	},

	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		defaults = {
			path_display = { "smart" },
			mappings = {
				i = {
					["<C-k>"] = require("telescope.actions").move_selection_previous,
					["<C-j>"] = require("telescope.actions").move_selection_next,
					["<C-q>"] = require("telescope.actions").send_selected_to_qflist
						+ require("telescope.actions").open_qflist,
				},
			},
		},
	},

	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
	end,
}
