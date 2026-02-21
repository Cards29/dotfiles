return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	cmd = "FzfLua",

	keys = {
		-- files and project
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
		{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
		{ "<leader>ft", "<cmd>FzfLua treesitter<cr>", desc = "Symbols (Treesitter)" },
		{
			"<leader>fa",
			function()
				require("fzf-lua").files({
					fd_opts = "--type f --no-ignore --hidden --follow --exclude .git --color=never --strip-cwd-prefix",
				})
			end,
			desc = "All files (hidden + ignored)",
		},

		-- search
		{ "<leader>fs", "<cmd>FzfLua live_grep<cr>", desc = "Search project" },
		{ "<leader>fc", "<cmd>FzfLua grep_cword<cr>", desc = "Search word" },
		{
			"<leader>fv",
			"<cmd>FzfLua grep_visual<cr>",
			mode = "v",
			desc = "Search selection",
		},
		{ "<leader>f/", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "Search current file" },

		-- misc
		{ "<leader>fm", "<cmd>FzfLua marks<cr>", desc = "List marks" },
		{ "<leader>fB", "<cmd>FzfLua builtin<cr>", desc = "Fzf-lua builtins" },
		{ "<leader>fM", "<cmd>FzfLua manpages<cr>", desc = "Search man pages" },
		{ "<leader>fC", "<cmd>FzfLua colorschemes<cr>", desc = "Choose colorscheme" },

		{ "?", "<cmd>FzfLua keymaps<cr>", desc = "Search keymaps" },
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
