return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",

	cmd = "CompetiTest",

	keys = {
		{ "<leader>ca", "<cmd>CompetiTest add_testcase<CR>", desc = "CompetiTest: Add testcase" },
		{ "<leader>ce", "<cmd>CompetiTest edit_testcase<CR>", desc = "CompetiTest: Edit testcase" },
		{ "<leader>cr", "<cmd>CompetiTest run<CR>", desc = "CompetiTest: Run testcase" },
		{ "<leader>cd", "<cmd>CompetiTest delete_testcase<CR>", desc = "CompetiTest: Delete testcase" },
		{ "<leader>cs", "<cmd>CompetiTest show_ui<CR>", desc = "CompetiTest: Show UI" },
		{ "<leader>ct", "<cmd>CompetiTest receive testcases<CR>", desc = "CompetiTest: Receive testcases" },
		{ "<leader>cp", "<cmd>CompetiTest receive problem<CR>", desc = "CompetiTest: Receive problem" },
		{ "<leader>cc", "<cmd>CompetiTest receive contest<CR>", desc = "CompetiTest: Receive contest" },
	},

	opts = {
		template_file = vim.fn.expand("~/.config/nvim/templates/template.cpp"),
	},
}
