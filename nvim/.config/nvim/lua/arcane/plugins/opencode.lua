return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Add your specific options here if needed
		}

		-- Required for opencode to auto-update buffers when the AI writes to them
		vim.o.autoread = true

		-- Helper for local variables
		local oc = require("opencode")

		-- 1. Main Interaction (Ask & Actions)
		vim.keymap.set({ "n", "x" }, "<leader>oa", function()
			oc.ask("@this: ", { submit = true })
		end, { desc = "AI Ask" })
		vim.keymap.set({ "n", "x" }, "<leader>ox", function()
			oc.select()
		end, { desc = "AI Actions Select" })

		-- 2. Interface (Toggle Chat)
		vim.keymap.set({ "n", "t" }, "<leader>oc", function()
			oc.toggle()
		end, { desc = "AI Toggle Chat" })

		-- 3. Operators (Add code to context)
		-- Usage: 'go' + motion (e.g., 'gow' for word, 'goip' for paragraph)
		vim.keymap.set({ "n", "x" }, "go", function()
			return oc.operator("@this ")
		end, { desc = "AI Add Range", expr = true })
		vim.keymap.set("n", "goo", function()
			return oc.operator("@this ") .. "_"
		end, { desc = "AI Add Line", expr = true })

		-- 4. Scrolling the AI Window
		vim.keymap.set("n", "<leader>ou", function()
			oc.command("session.half.page.up")
		end, { desc = "AI Scroll Up" })
		vim.keymap.set("n", "<leader>od", function()
			oc.command("session.half.page.down")
		end, { desc = "AI Scroll Down" })

		-- Note: We removed the remapping of "+" and "-" because we are no longer
		-- overriding the default <C-a> and <C-x> keys.
	end,
}
