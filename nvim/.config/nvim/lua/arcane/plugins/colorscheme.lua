return {
	{
		"sainnhe/everforest",
		priority = 1000, -- load before everything else
		lazy = false, -- make sure it loads on startup
		config = function()
			-- Background: 'soft' (best for eyes), 'medium', 'hard'
			vim.g.everforest_background = "soft"

			-- Better performance & clean colors
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_disable_italic_comment = 0
			vim.g.everforest_transparent_background = 0

			-- UI polish
			vim.g.everforest_ui_contrast = "low"
			vim.g.everforest_show_eob = 0 -- hide ~
			vim.g.everforest_float_style = "dim" -- floating windows softer

			-- Diagnostics & signs
			vim.g.everforest_diagnostic_text_highlight = 1
			vim.g.everforest_diagnostic_line_highlight = 0
			vim.g.everforest_diagnostic_virtual_text = "grey"

			-- Better current word visibility
			vim.g.everforest_current_word = "grey background"

			-- Apply theme
			vim.cmd.colorscheme("everforest")
		end,
	},
}
