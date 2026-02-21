vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2       -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2    -- 2 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- Fix for vim-tmux-navigator / netrw <C-l> conflict
vim.g.tmux_navigator_disable_netrw_workaround = 1

local group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({
      higroup = "YankHighlight",
      timeout = 200,
    })
  end,
})

vim.api.nvim_set_hl(0, "YankHighlight", {
  bg = "#9a5a3a",
  fg = "#d8d8e6",
})

vim.api.nvim_create_autocmd({ "BufWritePre", "FileWritePre" }, {
  callback = function()
    local directory = vim.fn.expand("%:p:h")
    if not directory:match("^%w+:") and vim.fn.isdirectory(directory) == 0 then
      vim.fn.mkdir(directory, "p")
    end
  end,
})

opt.undofile = true
opt.conceallevel = 0
opt.showtabline = 0
opt.statusline = "%f %r %m%="
opt.winborder = "rounded"
opt.laststatus = 3
