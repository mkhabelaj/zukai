local utils = require("zukai.utils")
return {
	"ThePrimeagen/refactoring.nvim",
	keys = {
		utils.make_lazy_key("<leader>rb", "<cmd>Refactor extract_block<CR>", "Extract block"),
		utils.make_lazy_key("<leader>ri", "<cmd>Refactor inline_var<CR>", "Refactor inline", { "x", "n" }),
		utils.make_lazy_key("<leader>rx", "<cmd>Refactor extract_block_to_file<CR>", "Extract block to file"),
		utils.make_lazy_key("<leader>rv", "<cmd>Refactor extract_var<CR>", "Extract var", { "x" }),
		utils.make_lazy_key("<leader>re", "<cmd>Refactor extract<CR>", "Extract", { "x" }),
		utils.make_lazy_key("<leader>rf", "<cmd>Refactor extract_to_file<CR>", "Extract to file", { "x" }),
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup()
	end,
}

-- r = {
-- 	name = "Refatorting",
-- 	e = { "<cmd>Refactor extract <CR>", "Extract" },
-- 	f = { "<cmd>Refactor extract_to_file <CR>", "Extract to file" },
-- 	v = { "<cmd>Refactor extract_var <CR>", "Extract var" },
-- 	i = { "<cmd>Refactor inline_var<CR>", "Refactor inline" },
-- },
