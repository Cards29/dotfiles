vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set({ "n", "v", "o" }, "H", "^", { desc = "Go to first non-blank character" })
keymap.set({ "n", "v", "o" }, "L", "$", { desc = "Go to end of line" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>w", ":wa<CR>", { desc = "Write all" })
keymap.set("n", "<leader>q", ":wqa<CR>", { desc = "Write & quit all" })
keymap.set("n", "<leader>Q", ":q!<CR>", { desc = "Force quit" })
keymap.set("n", "<leader>o", ":update<CR> :so $MYVIMRC<CR>", { desc = "Reload config" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>sm", "<C-w>| <C-w>_", { desc = "Maximize current split" })

keymap.set(
	"n",
	"<leader>ss",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under cursor (global)" }
)

keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })

keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Open lazy.nvim" })

keymap.set({ "n", "v", "i" }, "<Up>", "<Nop>", { desc = "Disable Up arrow" })
keymap.set({ "n", "v", "i" }, "<Down>", "<Nop>", { desc = "Disable Down arrow" })
keymap.set({ "n", "v", "i" }, "<Left>", "<Nop>", { desc = "Disable Left arrow" })
keymap.set({ "n", "v", "i" }, "<Right>", "<Nop>", { desc = "Disable Right arrow" })

keymap.set({ "n", "v", "i" }, "<C-Up>", "<Nop>", { desc = "Disable Ctrl + Up arrow" })
keymap.set({ "n", "v", "i" }, "<C-Down>", "<Nop>", { desc = "Disable Ctrl + Down arrow" })
keymap.set({ "n", "v", "i" }, "<C-Left>", "<Nop>", { desc = "Disable Ctrl + Left arrow" })
keymap.set({ "n", "v", "i" }, "<C-Right>", "<Nop>", { desc = "Disable Ctrl + Right arrow" })
