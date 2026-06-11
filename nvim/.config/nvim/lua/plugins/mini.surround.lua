return {
	"nvim-mini/mini.surround",
	version = "*",
	opts = {
		mappings = {
			add = "ys", -- Add surrounding in Normal and Visual modes
			delete = "ds", -- Delete surrounding
			find = "fs", -- Find surrounding (to the right)
			find_left = "Fs", -- Find surrounding (to the left)
			highlight = "hs", -- Highlight surrounding
			replace = "cs", -- Replace surrounding

			suffix_last = "l", -- Suffix to search with "prev" method
			suffix_next = "n", -- Suffix to search with "next" method
		},
	},
	config = function(_, opts)
		require("mini.surround").setup(opts)

		-- Map 'S' in visual mode to match nvim-surround's behavior
		vim.keymap.set(
			"x",
			"S",
			[[:<C-u>lua MiniSurround.add('visual')<CR>]],
			{ silent = true, desc = "Add surrounding" }
		)
	end,
}
