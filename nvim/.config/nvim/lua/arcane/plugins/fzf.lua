return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	cmd = "FzfLua",

	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Fuzzy find files in cwd" },
		{ "<leader>fs", "<cmd>FzfLua live_grep<cr>", desc = "Find string in cwd" },
		{ "<leader>fc", "<cmd>FzfLua grep_cword<cr>", desc = "Find string under cursor" },
		{ "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Search keymaps" },
		{ "?", "<cmd>FzfLua keymaps<cr>", desc = "Search keymaps" },
		{
			"<leader>fa",
			function()
				require("fzf-lua").files({
					fd_opts = "--type f --no-ignore --hidden --strip-cwd-prefix",
				})
			end,
			desc = "Fuzzy find all files (no ignore)",
		},
	},

	opts = {
		winopts = {
			preview = {
				layout = "flex",
			},
		},
		keymap = {
			fzf = {
				["ctrl-k"] = "up",
				["ctrl-j"] = "down",
				["ctrl-q"] = "select-all+accept",
			},
		},
		files = {
			formatter = "path.filename_first",
		},
	},

	config = function(_, opts)
		require("fzf-lua").setup(opts)
	end,
}
