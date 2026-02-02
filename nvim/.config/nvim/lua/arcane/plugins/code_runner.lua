return {
	"CRAG666/code_runner.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "RunCode", "RunFile", "RunProject", "CRFiletype", "CRProjects" },
	keys = {
		-- { "<leader>rr", ":RunCode<CR>", { noremap = true, silent = false, desc = "Run Code" } },
		{ "<leader>rr", ":RunFile<CR>", { noremap = true, silent = false, desc = "Run File" } },
		{ "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false, desc = "Run Project" } },
		{ "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false, desc = "Run Close" } },
	},
	opts = {
		mode = "float",
		focus = true,
		startinsert = true,
		term = {
			position = "bot",
			size = 12,
		},
		float = {
			border = "rounded",
			height = 0.8,
			width = 0.8,
		},
		filetype = {

			javascript = "node",
			typescript = "npx ts-node",
			html = "xdg-open",
			css = "xdg-open",

			python = "python3 -u",
			sh = "bash",
			lua = "lua",
			perl = "perl",
			ruby = "ruby",
			php = "php",

			c = {
				"cd $dir &&",
				"gcc $fileName -o $fileNameWithoutExt &&",
				"$dir/$fileNameWithoutExt",
			},
			cpp = {
				"cd $dir &&",
				"g++ $fileName -o $fileNameWithoutExt &&",
				"$dir/$fileNameWithoutExt",
			},
			rust = {
				"cd $dir &&",
				"rustc $fileName &&",
				"$dir/$fileNameWithoutExt",
			},
			java = {
				"cd $dir &&",
				"javac $fileName &&",
				"java $fileNameWithoutExt",
			},
			go = "go run",

			kotlin = "kotlinc $fileName -include-runtime -d $fileNameWithoutExt.jar && java -jar $fileNameWithoutExt.jar",
			dart = "dart",
			zig = "zig run",
		},
	},
	config = function(_, opts)
		require("code_runner").setup(opts)
	end,
}
