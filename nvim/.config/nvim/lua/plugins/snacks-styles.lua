return {
	"folke/snacks.nvim",
	opts = {
		-- --- Visual Styles ---
		styles = {
			notification = { border = "rounded", transparent = true },
			scratch = { border = "rounded", width = 0.8, height = 0.8 },
			lazygit = { border = "rounded", width = 0.9, height = 0.9 },
			terminal = {
				border = "rounded",
				position = "bottom",
				width = function(self)
					local pos = self.opts.position
					if pos == "right" then
						return 0.5
					elseif pos == "bottom" then
						return 1.0 -- full width for horizontal split
					else
						return 0.9 -- default float
					end
				end,
				height = function(self)
					local pos = self.opts.position
					if pos == "right" then
						return 1.0 -- full height for vertical split
					elseif pos == "bottom" then
						return 0.7
					else
						return 0.8 -- default float
					end
				end,
			},
		},
	},
}
