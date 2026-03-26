return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#091518',
				base01 = '#091518',
				base02 = '#879d9f',
				base03 = '#879d9f',
				base04 = '#e0fbff',
				base05 = '#f2fdff',
				base06 = '#f2fdff',
				base07 = '#f2fdff',
				base08 = '#ff3f81',
				base09 = '#ff3f81',
				base0A = '#26e6ff',
				base0B = '#4cff5d',
				base0C = '#8cf1ff',
				base0D = '#26e6ff',
				base0E = '#4ceaff',
				base0F = '#4ceaff',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#879d9f',
				fg = '#f2fdff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#26e6ff',
				fg = '#091518',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#879d9f' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#8cf1ff', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#4ceaff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#26e6ff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#26e6ff',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#8cf1ff',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#4cff5d',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#e0fbff' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#e0fbff' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#879d9f',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
