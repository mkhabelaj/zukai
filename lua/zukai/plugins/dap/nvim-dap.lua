return {
	"mfussenegger/nvim-dap",
	config = function()
		local utils = require("zukai.utils")
		-- toggle breakpoint
		utils.map("n", "<leader>db", "<cmd> DapToggleBreakpoint<CR>", "toggle breakpoint")
		-- entry point
		utils.map("n", "<leader>dc", "<cmd> DapContinue<CR>", "Start/Continue")
	end,
}
