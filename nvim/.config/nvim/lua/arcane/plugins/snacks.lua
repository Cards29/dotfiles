return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		animate = { enabled = true },
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		picker = { enabled = true },
		gh = { enabled = true },
		git = { enabled = true },
		gitbrowse = { enabled = true },
		indent = { enabled = true },
		keymap = { enabled = true },
		layout = { enabled = true },
		lazygit = { configure = true },
		notifer = { enabled = true, timeout = 3000 },
		notify = { enabled = true },
		quickfile = { enabled = true },
		rename = { enabled = true },
		scope = { enabled = true },
		scratch = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		toggle = { enabled = true },
		win = { enabled = true },
		words = { enabled = true },
		styles = {
			notification = { border = "rounded", transparent = true },
			scratch = { border = "rounded", width = 0.8, height = 0.8 },
			lazygit = { border = "rounded", width = 0.9, height = 0.9 },
		},
	},
	keys = {
		-- --- SCRATCH & NOTES ---
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>nf",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},

		-- --- GIT & GITHUB ---
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Current File Log",
		},
		{
			"<leader>gl",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gL",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log (Project)",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse (Open)",
			mode = { "n", "v" },
		},
		{
			"<leader>gY",
			function()
				Snacks.gitbrowse({
					open = function(url)
						vim.fn.setreg("+", url)
					end,
					notify = false,
				})
			end,
			desc = "Git Browse (Copy URL)",
			mode = { "n", "v" },
		},

		-- GitHub Picker (Requires Snacks.picker)
		{
			"<leader>gi",
			function()
				Snacks.picker.gh_issue()
			end,
			desc = "GitHub Issues",
		},
		{
			"<leader>gp",
			function()
				Snacks.picker.gh_pr()
			end,
			desc = "GitHub PRs",
		},

		-- --- UI TOGGLES (Fixed) ---
		{
			"<leader>ui",
			function()
				Snacks.toggle.indent():toggle()
			end,
			desc = "Toggle Indent Guides",
		},
		{
			"<leader>un",
			function()
				Snacks.toggle.line_number():toggle()
			end,
			desc = "Toggle Line Numbers",
		},
		{
			"<leader>ua",
			function()
				Snacks.toggle.animate():toggle()
			end,
			desc = "Toggle Animation",
		},
		{
			"<leader>ud",
			function()
				Snacks.toggle.diagnostics():toggle()
			end,
			desc = "Toggle Diagnostics",
		},

		--- --- NAVIGATION & UTILS ---
		{
			"]]",
			function()
				Snacks.words.jump(1, true)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-1, true)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
	},
}
