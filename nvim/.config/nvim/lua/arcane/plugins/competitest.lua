return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",

	cmd = "CompetiTest",

	keys = {
		{ "<leader>CPa", "<cmd>CompetiTest add_testcase<CR>", desc = "CompetiTest: Add testcase" },
		{ "<leader>CPe", "<cmd>CompetiTest edit_testcase<CR>", desc = "CompetiTest: Edit testcase" },
		{ "<leader>CPr", "<cmd>CompetiTest run<CR>", desc = "CompetiTest: Run testcase" },
		{ "<leader>CPd", "<cmd>CompetiTest delete_testcase<CR>", desc = "CompetiTest: Delete testcase" },
		{ "<leader>CPs", "<cmd>CompetiTest show_ui<CR>", desc = "CompetiTest: Show UI" },
		{ "<leader>CPt", "<cmd>CompetiTest receive testcases<CR>", desc = "CompetiTest: Receive testcases" },
		{ "<leader>CPp", "<cmd>CompetiTest receive problem<CR>", desc = "CompetiTest: Receive problem" },
		{ "<leader>CPc", "<cmd>CompetiTest receive contest<CR>", desc = "CompetiTest: Receive contest" },
	},

	opts = {
		template_file = vim.fn.expand("~/.config/nvim/templates/template.cpp"),
	},
}
