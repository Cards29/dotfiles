return {
  {
    "sainnhe/everforest",
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.everforest_background = "soft"
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_disable_italic_comment = 0
      vim.g.everforest_transparent_background = 0
      vim.g.everforest_ui_contrast = "low"
      vim.g.everforest_show_eob = 0
      vim.g.everforest_float_style = "dim"
      vim.g.everforest_diagnostic_text_highlight = 1
      vim.g.everforest_diagnostic_line_highlight = 0
      vim.g.everforest_diagnostic_virtual_text = "grey"
      vim.g.everforest_current_word = "grey background"

      vim.cmd.colorscheme("everforest")
    end,
  },

  { "catppuccin/nvim",         name = "catppuccin", lazy = true },
  { "folke/tokyonight.nvim",   lazy = true },
  { "rebelot/kanagawa.nvim",   lazy = true },
  { "rose-pine/neovim",        name = "rose-pine",  lazy = true },
  { "kaicataldo/material.vim", lazy = true },
  { "oskarnurm/koda.nvim",     lazy = true },
}
