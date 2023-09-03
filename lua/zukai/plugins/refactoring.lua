local utils = require("zukai.utils")
return {
	"ThePrimeagen/refactoring.nvim",
	keys = {
		utils.make_lazy_key("<leader>rb", "<cmd>Refactor extract_block<CR>", "Extract block"),
		utils.make_lazy_key("<leader>ri", "<cmd>Refactor inline_var<CR>", "Refactor inline"),
		utils.make_lazy_key("<leader>rx", "<cmd>Refactor extract_block_to_file<CR>", "Extract block to file"),
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup()
	end,
}
