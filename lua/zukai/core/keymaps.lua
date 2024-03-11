vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jj", "<ESC>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement
-- clear search highlights
keymap.set("n", "<leader>N", ":nohl<CR>", { desc = "Clear search highlights" })
-- dismiss noice messages
keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss noice messages" })

-- Copilot keymaps
-- map cycle through suggestions forword to alt + j
keymap.set("i", "<A-j>", "<Plug>(copilot-next)")
-- map cycle through suggestions backword to alt + k
keymap.set("i", "<A-k>", "<Plug>(copilot-prev)")
-- request a new suggestion to alt + s
keymap.set("i", "<A-s>", "<Plug>(copilot-suggest)")
-- dissmiss the current suggestion to alt + d
keymap.set("i", "<A-d>", "<Plug>(copilot-dismiss)")
-- open panel to alt + p
keymap.set({ "n", "i" }, "<A-p>", "<cmd> Copilot panel<CR>")

-- window management
keymap.set("n", "<leader>s|", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>s-", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>so", "<cmd>only<CR>", { desc = "Close all splits except current" }) -- close all splits except current
-- increase/decrease window size by default_size
local default_size = 10
keymap.set(
	"n",
	"<leader>sj",
	"<cmd>resize -" .. default_size .. "<CR>",
	{ desc = "Decrease window size by " .. default_size }
) -- decrease window size
keymap.set(
	"n",
	"<leader>sk",
	"<cmd>resize +" .. default_size .. "<CR>",
	{ desc = "Increase window size by " .. default_size }
) -- increase window size
keymap.set(
	"n",
	"<leader>sh",
	"<cmd>vertical resize +" .. default_size .. "<CR>",
	{ desc = "Decrease window size by " .. default_size }
) -- decrease window size

keymap.set(
	"n",
	"<leader>sl",
	"<cmd>vertical resize -" .. default_size .. "<CR>",
	{ desc = "Increase window size by " .. default_size }
) -- increase window size

-- tab management
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" }) -- new tab
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close tab" }) -- close tab
-- move to next/previous tab
keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>te", "<cmd>tabedit<CR>", { desc = "Edit tab" }) -- edit tab

-- git keymaps
-- close nvim
keymap.set("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Close nvim" })
