vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
-- keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
-- keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- copy line up or down
keymap.set("n", "<A-S-Up>", "yyP", { desc = "Yank line Up (copy)" })
keymap.set("n", "<A-S-Down>", "yyp", { desc = "Yank line Down (copy)" })

-- ==================== Very popular basic QoL remaps ====================

-- Move visual selection up/down (ThePrimeagen classic, extremely common)
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up

-- Center search jumps
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Paste over visual selection without losing default register
keymap.set("x", "<leader>p", [["_dP]]) -- most people use <leader>p or just p

-- Replace word under cursor globally (very handy)
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Better indenting in visual mode (preserves selection)
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Disable hated arrow keys (optional — helps build muscle memory)
keymap.set({ "n", "v", "i" }, "<Up>", "<Nop>")
keymap.set({ "n", "v", "i" }, "<Down>", "<Nop>")
keymap.set({ "n", "v", "i" }, "<Left>", "<Nop>")
keymap.set({ "n", "v", "i" }, "<Right>", "<Nop>")

-- Move to beginning / end of line with H / L (very common in Primeagen-inspired setups)
vim.keymap.set({ "n", "v", "o" }, "H", "^", { desc = "Go to first non-blank character" }) -- like ^
vim.keymap.set({ "n", "v", "o" }, "L", "$", { desc = "Go to end of line" }) -- like $

-- many people also remap M to the middle of the line (very handy)
vim.keymap.set({ "n", "v", "o" }, "M", "gM", { desc = "Go to middle of line" })

vim.api.nvim_create_user_command("W", "w !sudo tee % > /dev/null", {})
