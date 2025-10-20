return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({
				settings = {
					save_on_toggle = true,
				},
				menu = {
					width = vim.api.nvim_win_get_width(0) - 4,
				},
			})
		end,
		keys = {
			{
				"<leader>ha",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Harpoon: Add file",
			},
			{
				"<leader>hh",
				function()
					require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
				end,
				desc = "Harpoon: Toggle menu",
			},
			{
				"<leader>hr",
				function()
					require("harpoon"):list():remove()
				end,
				desc = "Harpoon: Remove current file",
			},
			{
				"<leader>1",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Harpoon: Go to file 1",
			},
			{
				"<leader>2",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Harpoon: Go to file 2",
			},
			{
				"<leader>3",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Harpoon: Go to file 3",
			},
			{
				"<leader>4",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Harpoon: Go to file 4",
			},
			{
				"<leader>5",
				function()
					require("harpoon"):list():select(5)
				end,
				desc = "Harpoon: Go to file 5",
			},
			{
				"<leader>h[",
				function()
					require("harpoon"):list():prev()
				end,
				desc = "Harpoon: Previous file",
			},
			{
				"<leader>h]",
				function()
					require("harpoon"):list():next()
				end,
				desc = "Harpoon: Next file",
			},
		},
	},
}
