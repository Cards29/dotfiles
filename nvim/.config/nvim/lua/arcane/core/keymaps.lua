vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>mp", function()
	local scene_name = vim.fn.expand("<cword>")
	local file_name = vim.fn.expand("%")

	vim.cmd(string.format("split | term manim -pqh %s %s", file_name, scene_name))
end, { desc = "Run Manim on class under cursor" })

keymap.set({ "n", "v", "o" }, "H", "^", { desc = "Go to first non-blank character" })
keymap.set({ "n", "v", "o" }, "L", "$", { desc = "Go to end of line" })

keymap.set("n", "<leader>w", ":wa<CR>", { desc = "Write all" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Write & quit all" })
keymap.set("n", "<leader>Q", ":q!<CR>", { desc = "Force quit" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>sm", "<C-w>| <C-w>_", { desc = "Maximize current split" })

keymap.set("n", "<leader>=", "<cmd>vertical resize +2<CR>", { desc = "Increase width" })
keymap.set("n", "<leader>-", "<cmd>vertical resize -2<CR>", { desc = "Decrease width" })
keymap.set("n", "<leader>+", "<cmd>horizontal resize +2<CR>", { desc = "Increase height" })
keymap.set("n", "<leader>_", "<cmd>horizontal resize -2<CR>", { desc = "Decrease height" })

keymap.set(
	"n",
	"<leader>ss",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under cursor (global)" }
)

keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })

keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { desc = "Move half page down" })
keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { desc = "Move half page up" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

keymap.set("n", "x", '"_x', { desc = "Delete character without copying" })
keymap.set({ "n", "v" }, "X", '"_dd<Esc>', { desc = "Delete without yanking" })

keymap.set("v", "<", "<gv", { desc = "Indent left & reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right & reselect" })

keymap.set("n", "dd", function()
	local line_content = vim.api.nvim_get_current_line()
	if line_content:match("^%s*$") then
		vim.api.nvim_feedkeys('"_dd', "n", false)
	else
		vim.api.nvim_feedkeys("dd", "n", false)
	end
end, { desc = "Delete line" })

keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

keymap.set("n", "<Esc>", "<Esc>:nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Open lazy.nvim" })

keymap.set({ "n", "v", "i" }, "<Up>", "<Nop>", { desc = "Disable Up arrow" })
keymap.set({ "n", "v", "i" }, "<Down>", "<Nop>", { desc = "Disable Down arrow" })
keymap.set({ "n", "v", "i" }, "<Left>", "<Nop>", { desc = "Disable Left arrow" })
keymap.set({ "n", "v", "i" }, "<Right>", "<Nop>", { desc = "Disable Right arrow" })

keymap.set({ "n", "v", "i" }, "<C-Up>", "<Nop>", { desc = "Disable Ctrl + Up arrow" })
keymap.set({ "n", "v", "i" }, "<C-Down>", "<Nop>", { desc = "Disable Ctrl + Down arrow" })
keymap.set({ "n", "v", "i" }, "<C-Left>", "<Nop>", { desc = "Disable Ctrl + Left arrow" })
keymap.set({ "n", "v", "i" }, "<C-Right>", "<Nop>", { desc = "Disable Ctrl + Right arrow" })
