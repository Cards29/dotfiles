-- Plugin: xeluxee/competitest.nvim
-- Installed via store.nvim

return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		require("competitest").setup({
			-- Add your specific settings here
		})

		local keymap = vim.keymap.set
		local opts = { silent = true, noremap = true }

		-- Core Execution
		keymap("n", "<leader>Cr", "<cmd>CompetiTest run<cr>", opts)
		keymap("n", "<leader>Cs", "<cmd>CompetiTest show_ui<cr>", opts)

		-- Receiving Data
		keymap("n", "<leader>Ct", "<cmd>CompetiTest receive testcases<cr>", opts)
		keymap("n", "<leader>Cp", "<cmd>CompetiTest receive problem<cr>", opts)
		keymap("n", "<leader>Cc", "<cmd>CompetiTest receive contest<cr>", opts)

		-- Test Case Management
		keymap("n", "<leader>Ca", "<cmd>CompetiTest add_testcase<cr>", opts)
		keymap("n", "<leader>Ce", "<cmd>CompetiTest edit_testcase<cr>", opts)
		keymap("n", "<leader>Cd", "<cmd>CompetiTest delete_testcase<cr>", opts)
	end,
}

