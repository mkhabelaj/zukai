vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jj", "<ESC>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement
-- clear search highlights
keymap.set("n", "<leader>N", ":nohl<CR>", { desc = "Clear search highlights" })

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
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- git keymaps
-- close nvim
keymap.set("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Close nvim" })
