return {
	"catppuccin/nvim",
	name = "catppuccin",
	flavour = "mocha",
	priority = 1000,
	config = function()
		-- load the colorscheme here
		vim.cmd([[colorscheme catppuccin-mocha]])
	end,
}
