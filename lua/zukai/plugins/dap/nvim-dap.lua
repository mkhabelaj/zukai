return {
	"mfussenegger/nvim-dap",
	config = function()
		local utils = require("zukai.utils")
		-- toggle breakpoint
		utils.map("n", "<F1>", "<cmd>DapToggleBreakpoint<CR>", "toggle breakpoint")
		utils.map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", "toggle breakpoint")
		-- entry point
		utils.map("n", "<leader>dr", "<cmd>DapContinue<CR>", "Start/Continue debugger")
		utils.map("n", "<F2>", "<cmd>DapContinue<CR>", "Start/Continue debugger")
		-- step over
		utils.map("n", "<leader>do", "<cmd>DapStepOver<CR>", "Step over")
		utils.map("n", "<F3>", "<cmd>DapStepOver<CR>", "Step over")
		-- step into
		utils.map("n", "<leader>di", "<cmd>DapStepInto<CR>", "Step into")
		utils.map("n", "<F4>", "<cmd>DapStepInto<CR>", "Step into")
		-- step out
		utils.map("n", "<leader>dt", "<cmd>DapStepOut<CR>", "Step out")
		utils.map("n", "<F5>", "<cmd>DapStepOut<CR>", "Step out")
		-- stop
		utils.map("n", "<leader>ds", "<cmd>DapTerminate<CR>", "Stop")
		utils.map("n", "<F6>", "<cmd>DapTerminate<CR>", "Stop")
	end,
}
