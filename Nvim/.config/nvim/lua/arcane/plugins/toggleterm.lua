return {
	{
		"akinsho/toggleterm.nvim",
		version = "*", -- Use the latest version
		event = "VeryLazy", -- Load plugin on VeryLazy event for better performance
		opts = {
			-- Configuration options for toggleterm
			size = 20, -- Size of the terminal (height for horizontal, width for vertical)
			open_mapping = [[<C-\>]], -- Keymap to toggle the terminal (Ctrl+\)
			hide_numbers = true, -- Hide line numbers in terminal buffer
			shade_filetypes = {},
			shade_terminals = true, -- Apply shading to terminal background
			shading_factor = 2, -- Degree of shading
			autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
			start_in_insert = true, -- Start terminal in insert mode
			insert_mappings = true, -- Apply mappings in insert mode
			terminal_mappings = true, -- Apply mappings in terminal mode
			persist_size = true, -- Persist the size of the terminal
			direction = "horizontal", -- Options: "horizontal", "vertical", "float", "tab"
			close_on_exit = true, -- Close terminal when process exits
			shell = vim.o.shell, -- Use the default shell
			float_opts = {
				-- Settings for floating terminal
				border = "curved", -- Border style: "single", "double", "shadow", "curved"
				width = 80,
				height = 20,
				winblend = 0,
			},
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)

			-- Optional: Custom keymaps or additional setup
			vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
			vim.keymap.set(
				"n",
				"<leader>tf",
				"<cmd>ToggleTerm direction=float<CR>",
				{ desc = "Toggle floating terminal" }
			)
			vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
		end,
	},
}
