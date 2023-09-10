return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"neovim/nvim-lspconfig",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local vim_opt = vim.o
		vim_opt.foldcolumn = "1" -- '0' is not bad
		vim_opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim_opt.foldlevelstart = 99
		vim_opt.foldenable = true
		require("ufo").setup()
	end,
}
