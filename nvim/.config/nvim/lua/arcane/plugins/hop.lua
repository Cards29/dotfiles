return {
	"smoka7/hop.nvim",
	version = "*",
	opts = {
		keys = "etovxqpdygfblzhckisuran",
	},
	config = function(_, opts)
		local hop = require("hop")
		hop.setup(opts)

		-- Default-style keybindings
		local directions = require("hop.hint").HintDirection

		-- Pattern/Word search
		-- vim.keymap.set("", "f", function()
		-- 	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		-- end, { remap = true })
		--
		-- vim.keymap.set("", "F", function()
		-- 	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		-- end, { remap = true })
		--
		-- vim.keymap.set("", "t", function()
		-- 	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		-- end, { remap = true })
		--
		-- vim.keymap.set("", "T", function()
		-- 	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		-- end, { remap = true })

		-- Global navigation (The "Hop" Way)
		vim.keymap.set("", "<leader>hw", function()
			hop.hint_words()
		end, { desc = "Hop to word" })
		-- vim.keymap.set("", "<leader>hl", function()
		-- 	hop.hint_lines()
		-- end, { desc = "Hop to line" })
		-- vim.keymap.set("", "<leader>hc", function()
		-- 	hop.hint_char1()
		-- end, { desc = "Hop to character" })
	end,
}
