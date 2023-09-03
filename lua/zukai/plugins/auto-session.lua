local utils = require("zukai.utils")
return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})

		utils.map("n", "<leader>Sr", "<cmd>lua require('auto-session').restore()<CR>", "Restore session for cwd")
		utils.map(
			"n",
			"<leader>St",
			"<cmd>lua require('auto-session').toggle_auto_session()<CR>",
			"Toggle auto session"
		)
		utils.map("n", "<leader>Ss", "<cmd>lua require('auto-session').save()<CR>", "Save session for cwd")
	end,
}
