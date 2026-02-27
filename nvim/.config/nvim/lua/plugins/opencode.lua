return {
	"nickjvandyke/opencode.nvim",
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
		}

		-- Required for `opts.events.reload`.
		vim.o.autoread = true

		local opencode = require("opencode")

		vim.keymap.set({ "n", "t" }, "<leader>oo", opencode.toggle, { desc = "AI: Toggle Sidebar" })
		vim.keymap.set({ "n", "x" }, "<leader>ox", opencode.select, { desc = "AI: Select Action" })

		vim.keymap.set({ "n", "x" }, "<leader>oa", function()
			opencode.ask("@this: ", { submit = true })
		end, { desc = "AI: Quick Ask (Context)" })

		vim.keymap.set({ "n", "x" }, "go", function()
			return opencode.operator("@this ")
		end, { expr = true, desc = "AI: Operator (send motion)" })

		vim.keymap.set("n", "goo", function()
			return opencode.operator("@this ") .. "_"
		end, { expr = true, desc = "AI: Send Current Line" })

		vim.keymap.set("n", "<S-C-u>", function()
			require("opencode").command("session.half.page.up")
		end, { desc = "Scroll opencode up" })

		vim.keymap.set("n", "<S-C-d>", function()
			require("opencode").command("session.half.page.down")
		end, { desc = "Scroll opencode down" })
	end,
}
