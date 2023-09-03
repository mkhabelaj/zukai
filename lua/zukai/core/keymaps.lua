vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jj", "<ESC>")

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
