return {
	"mfussenegger/nvim-dap-python",
	ft = { "python" },
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
		require("dap-python").setup(path) -- Use default python
		local utils = require("zukai.utils")
		-- test method
		utils.map("n", "<leader>dpm", "<cmd>lua require('dap-python').test_method()<CR>", "test method")
		-- test class
		utils.map("n", "<leader>dpc", "<cmd>lua require('dap-python').test_class()<CR>", "test class")
		-- debug selection
		utils.map("n", "<leader>dps", "<cmd>lua require('dap-python').debug_selection()<CR>", "debug selection")
	end,
}
