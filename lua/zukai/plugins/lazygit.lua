local utils = require("zukai.utils")
return {
	"kdheepak/lazygit.nvim",
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	keys = {
		utils.make_lazy_key("<leader>gg", "<cmd>LazyGit<cr>", "lazygit"),
	},
}
