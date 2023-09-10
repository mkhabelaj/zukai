return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"neovim/nvim-lspconfig",
	},
	config = function()
		-- The folder options and capabilities are set in lspconfig
		require("ufo").setup()
	end,
}
