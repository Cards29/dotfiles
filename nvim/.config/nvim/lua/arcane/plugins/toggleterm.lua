return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		size = 20,
		open_mapping = [[<c-\>]],
		hide_numbers = true,
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "horizontal",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
			winblend = 0,
		},
		dir = "cwd",
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
	},
	keys = {
		{ "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
		{ "<leader>t1", "<cmd>ToggleTerm 1<cr>", desc = "Toggle Terminal 1" },
		{ "<leader>t2", "<cmd>ToggleTerm 2<cr>", desc = "Toggle Terminal 2" },
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		-- Terminal-specific keybindings for easier navigation
		function _G.set_terminal_keymaps()
			local key_opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], key_opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], key_opts)
			-- Window navigation from within the terminal
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], key_opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], key_opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], key_opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], key_opts)
		end

		-- Trigger the keymaps when a terminal opens
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
