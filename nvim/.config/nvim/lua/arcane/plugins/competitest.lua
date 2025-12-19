return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		require("competitest").setup({
			template_file = vim.fn.expand("~/.config/nvim/templates/template.cpp"),
		})

		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Testcase management
		map("n", "<leader>ca", "<cmd>CompetiTest add_testcase<CR>", { desc = "CompetiTest: Add testcase" })
		map("n", "<leader>ce", "<cmd>CompetiTest edit_testcase<CR>", { desc = "CompetiTest: Edit testcase" })
		map("n", "<leader>cr", "<cmd>CompetiTest run<CR>", { desc = "CompetiTest: Run testcase" })
		map("n", "<leader>cd", "<cmd>CompetiTest delete_testcase<CR>", { desc = "CompetiTest: Delete testcase" })
		map("n", "<leader>cs", "<cmd>CompetiTest show_ui<CR>", { desc = "CompetiTest: Show UI" })
		map("n", "<leader>ct", "<cmd>CompetiTest receive testcases<CR>", { desc = "CompetiTest: Receive Testcases" })
		map("n", "<leader>cp", "<cmd>CompetiTest receive problem<CR>", { desc = "CompetiTest: Receive Problem" })
		map("n", "<leader>cc", "<cmd>CompetiTest receive contest<CR>", { desc = "CompetiTest: Receive Contest" })
	end,
}
