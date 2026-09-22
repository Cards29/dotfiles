return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false,
		workspaces = {
			{ name = "Flutter", path = "~/Documents/Obsidian/Flutter/" },
			{ name = "Tafriha-App", path = "~/Documents/Obsidian/Tafriha App/" },
			-- add more as needed
		},
	},
}
